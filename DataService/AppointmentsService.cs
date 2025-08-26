using Azure;
using Azure.Core;
using Dapper;
using Medical_Appointment_System_API.Data;
using Medical_Appointment_System_API.Interface;
using Medical_Appointment_System_API.Models;
using Medical_Appointment_System_API.Models.RequestModel;
using Medical_Appointment_System_API.Models.Response;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using System.Buffers;
using System.Data;

namespace Medical_Appointment_System_API.DataService
{
    public class AppointmentsService : IAppointmentsService
    {
        private readonly AppDbContext _context;
        private readonly IEmailSender _emailSender;
        public AppointmentsService(AppDbContext appDbContext, IEmailSender emailSender)
        {
            _context = appDbContext;
            _emailSender = emailSender;
        }

        public async Task<CustomResponse> GetAppointmentsAsync(string? searchValue, string? doctorId, string? visitType, int pageNo, string pageSize)
        {
            try
            {
                var response = new CustomResponse();
                var result = new List<dynamic>();
                int recordsTotal = 0;
                int recordsFiltered = 0;

                using (var con = new SqlConnection(_context.Database.GetConnectionString()))
                {
                    var param = new DynamicParameters();
                    param.Add("pageNo", pageNo);
                    param.Add("pageSize", pageSize);
                    param.Add("searchValue", searchValue);
                    param.Add("doctorId", doctorId);
                    param.Add("visitType", visitType);
                    param.Add("recordsFiltered", dbType: DbType.Int32, direction: ParameterDirection.Output);
                    param.Add("recordsTotal", dbType: DbType.Int32, direction: ParameterDirection.Output);
                    con.Open();
                    result = (List<dynamic>)await con.QueryAsync("spGetAppointments", param);
                    recordsTotal = param.Get<int>("recordsTotal");
                    recordsFiltered = param.Get<int>("recordsFiltered");
                    con.Close();

                }

                var doctors = await _context.Doctors.ToListAsync();
                var patients = await _context.Patients.ToListAsync();
                var medicines = await _context.Medicines.ToListAsync();

                var data = new { appointments = result, recordsFiltered, recordsTotal, doctors, patients, medicines };
                response.Data = data;
                return response;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public async Task<CustomResponse> GetAppointmentByIdAsync(Guid id)
        {
            try
            {
                var response = new CustomResponse();
                dynamic result;
                using (var con = new SqlConnection(_context.Database.GetConnectionString()))
                {
                    var param = new DynamicParameters();
                    param.Add("Id", id);

                    await con.OpenAsync();

                    // Get a single record
                    result = await con.QueryFirstOrDefaultAsync<dynamic>(
                        "spGetAppointmentById",
                        param,
                        commandType: CommandType.StoredProcedure
                    );

                    await con.CloseAsync();

                }

                if (result == null) {
                    response.Message = "Appointment not found";
                    response.ReponseCode = 404;
                    return response;
                }
                response.Data = result;
                return response;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public async Task<CustomResponse> CreateAppointmentAsync(AppointmentRequest request)
        {
            try
            {
                var response = new CustomResponse();
                
                var appointment = new Appointment
                {
                    Id = Guid.NewGuid(),
                    PatientId = request.PatientId,
                    DoctorId = request.DoctorId,
                    AppointmentDate = request.AppointmentDate,
                    VisitType = request.VisitType,
                    Notes = request.Notes,
                    Diagnosis = request.Diagnosis,
                    CreatedUtc = DateTime.UtcNow,
                    PrescriptionDetails = request.PrescriptionDetails
                        .Select(p => new PrescriptionDetail
                        {
                            Id = Guid.NewGuid(),
                            AppointmentId = Guid.Empty,
                            MedicineId = p.MedicineId,
                            Dosage = p.Dosage,
                            StartDate = p.StartDate,
                            EndDate = p.EndDate,
                            Notes = p.Notes
                        })
                        .ToList()
                };

                // Add appointment (with prescriptions)
                _context.Appointments.Add(appointment);
                await _context.SaveChangesAsync();

                response.Message = "Appointment created successfully";
                response.ReponseCode = 200;
                return response;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public async Task<CustomResponse> UpdateAppointmentAsync(AppointmentRequest request)
        {
            try
            {
                var response = new CustomResponse();
                var existing = await _context.Appointments
                                .Include(a => a.PrescriptionDetails)
                                .Include(d => d.Doctor)
                                .Include(p => p.Patient)
                                .FirstOrDefaultAsync(a => a.Id == request.Id);

                if (existing == null)
                {
                    response.Message = "Appointment not found";
                    return response;
                }

                // Update appointment fields
                existing.PatientId = request.PatientId;
                existing.DoctorId = request.DoctorId;
                existing.AppointmentDate = request.AppointmentDate;
                existing.VisitType = request.VisitType;
                existing.Notes = request.Notes;
                existing.Diagnosis = request.Diagnosis;
                existing.UpdatedUtc = DateTime.UtcNow;

                // Remove existing tracked prescriptions
                _context.PrescriptionDetails.RemoveRange(existing.PrescriptionDetails);

                await _context.SaveChangesAsync();

                // 2. Add new prescriptions mapped from DTO
                var prescriptionDetails = new List<PrescriptionDetail>();
                prescriptionDetails = request.PrescriptionDetails
                    .Select(p => new PrescriptionDetail
                    {
                        Id = Guid.NewGuid(),
                        AppointmentId = existing.Id,
                        MedicineId = p.MedicineId,
                        Dosage = p.Dosage,
                        StartDate = p.StartDate,
                        EndDate = p.EndDate,
                        Notes = p.Notes
                    })
                    .ToList();
                _context.PrescriptionDetails.AddRangeAsync(prescriptionDetails);

                await _context.SaveChangesAsync();
                
                response.Message = "Appointment updated successfully";
                response.Data = new { appointmentId = existing.Id };
                response.ReponseCode = 200;
                return response;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public async Task<bool> DeleteAppointmentAsync(Guid id)
        {
            try
            {
                var appointment = await _context.Appointments.FindAsync(id);
                if (appointment == null) return false;

                _context.Appointments.Remove(appointment);
                await _context.SaveChangesAsync();
                return true;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public async Task<CustomResponse> SendPatientPrescriptionMail(Guid id)
        {
            try
            {
                var response = new CustomResponse();
                dynamic result;
                using (var con = new SqlConnection(_context.Database.GetConnectionString()))
                {
                    var param = new DynamicParameters();
                    param.Add("Id", id);

                    await con.OpenAsync();
                    // Get a single record
                    result = await con.QueryFirstOrDefaultAsync<dynamic>(
                        "spGetAppointmentById",
                        param,
                        commandType: CommandType.StoredProcedure
                    );
                    await con.CloseAsync();
                }
                AppointmentResponse appointment = null;

                if (result != null)
                {
                    appointment = new AppointmentResponse
                    {
                        Id = result.Id,
                        PatientId = result.PatientId,
                        DoctorId = result.DoctorId,
                        AppointmentDate = result.AppointmentDate,
                        DoctorName = result.DoctorName,
                        PatientName = result.PatientName,
                        PatientEmail = result.PatientEmail,
                        VisitType = result.VisitType,
                        Notes = result.Notes,
                        Diagnosis = result.Diagnosis,
                        CreatedUtc = result.CreatedUtc,
                        UpdatedUtc = result.UpdatedUtc,

                        // Deserialize JSON string
                        PrescriptionDetails = string.IsNullOrEmpty(result.PrescriptionDetails)
                            ? new List<PrescriptionDetailResponse>()
                            : JsonConvert.DeserializeObject<List<PrescriptionDetailResponse>>(result.PrescriptionDetails)
                    };
                }

                var appointmentDate = appointment.AppointmentDate?.ToString("dd-MMM-yyyy");
                if (appointment.PrescriptionDetails.Count < 1 )
                {
                    response.Message = "Please add Prescription Details";
                    response.ReponseCode = 300;
                    return response;
                }
                await _emailSender.SendPatientPrescription(appointment.PatientEmail, appointment.PatientName, appointment.DoctorName,
                            appointmentDate, appointment.VisitType, appointment.PrescriptionDetails);

                response.Message = "Appointment Prescription mail send successfully";
                response.ReponseCode = 200;
                return response;

            }
            catch (Exception ex)
            {
                throw;
            }
        }


    }
}
