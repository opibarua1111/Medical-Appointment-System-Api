using Medical_Appointment_System_API.Models;
using Medical_Appointment_System_API.Models.RequestModel;
using Medical_Appointment_System_API.Models.Response;

namespace Medical_Appointment_System_API.Interface
{
    public interface IAppointmentsService
    {
        Task<CustomResponse> GetAppointmentsAsync(string? searchValue, string? doctorId, string? visitType, int pageNo, string pageSize);
        Task<CustomResponse> GetAppointmentByIdAsync(Guid id);
        Task<CustomResponse> CreateAppointmentAsync(AppointmentRequest appointment);
        Task<CustomResponse> UpdateAppointmentAsync(AppointmentRequest appointment);
        Task<bool> DeleteAppointmentAsync(Guid id);
        Task<CustomResponse> SendPatientPrescriptionMail(Guid id);
    }
}
