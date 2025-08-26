using Medical_Appointment_System_API.Interface;
using Medical_Appointment_System_API.Models;
using Medical_Appointment_System_API.Models.RequestModel;
using Medical_Appointment_System_API.Models.Response;
using Microsoft.AspNetCore.Mvc;
using System.Buffers;
using System.Security.Claims;
using static System.Runtime.InteropServices.JavaScript.JSType;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Medical_Appointment_System_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AppointmentsController : ControllerBase
    {
        private readonly IAppointmentsService _appointmentsService;
        public AppointmentsController(IAppointmentsService appointmentsService) 
        {
            _appointmentsService = appointmentsService;
        }
        // GET: api/Appointments
        // Get a list of appointments
        [HttpGet]
        public async Task<IActionResult> GetAppointments([FromQuery] string? searchValue, [FromQuery] string? doctorId,
                                                         [FromQuery] string? visitType, [FromQuery] int pageNo = 1, [FromQuery] string pageSize = "10")
        {
            CustomResponse response = new() { ReponseCode = 200 };
            try
            {
                response = await _appointmentsService.GetAppointmentsAsync(searchValue, doctorId, visitType, pageNo, pageSize);
            }
            catch (Exception)
            {
                response.ReponseCode = 500;
                response.Message = "Data Not Found";
                response.Data = null;
            }
            return Ok(response);
        }

        // GET: api/Appointments/{id}
        // Get a appointment by it id
        [HttpGet("{id}")]
        public async Task<IActionResult> GetAppointment(Guid id)
        {
            CustomResponse response = new() { ReponseCode = 200 };
            try
            {
                response = await _appointmentsService.GetAppointmentByIdAsync(id);
            }
            catch (Exception)
            {
                response.ReponseCode = 500;
                response.Message = "Data Not Found";
                response.Data = null;
            }
            return Ok(response);
        }

        // POST: api/Appointments
        // Add a new appointment with prescription details
        [HttpPost]
        public async Task<IActionResult> CreateAppointment([FromBody] AppointmentRequest appointment)
        {
            var objResponse = new CustomResponse();
            try
            {

                if (!ModelState.IsValid)
                {
                    objResponse.Message = "Invalid";
                    objResponse.Data = null;
                    objResponse.ReponseCode = 400;
                    return BadRequest(objResponse);
                }
                objResponse = await _appointmentsService.CreateAppointmentAsync(appointment);
                if (objResponse.ReponseCode == 200)
                {
                    return Ok(objResponse);
                }
                else
                {
                    return BadRequest(objResponse);
                }

            }
            catch (Exception ex)
            {
                objResponse.Data = null;
                objResponse.ReponseCode = 400;
                objResponse.Message = ex.InnerException is null ? ex.Message : ex.InnerException.Message;
                return BadRequest(objResponse);
            }
        }

        // PUT: api/Appointments
        // Update an existing appointment with prescription details
        [HttpPut]
        public async Task<IActionResult> UpdateAppointment([FromBody] AppointmentRequest appointment)
        {
            var objResponse = new CustomResponse();
            try
            {

                if (!ModelState.IsValid)
                {
                    objResponse.Message = "Invalid";
                    objResponse.Data = null;
                    objResponse.ReponseCode = 400;
                    return BadRequest(objResponse);
                }
                objResponse = await _appointmentsService.UpdateAppointmentAsync(appointment);
                if (objResponse.ReponseCode == 200)
                {
                    return Ok(objResponse);
                }
                else
                {
                    return BadRequest(objResponse);
                }

            }
            catch (Exception ex)
            {
                objResponse.Data = null;
                objResponse.ReponseCode = 400;
                objResponse.Message = ex.InnerException is null ? ex.Message : ex.InnerException.Message;
                return BadRequest(objResponse);
            }
        }

        // DELETE: api/Appointments/{id}
        // Delete a appointment by it id
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteAppointmentAsync(Guid id)
        {
            var objResponse = new CustomResponse();
            try
            {
                if (await _appointmentsService.DeleteAppointmentAsync(id))
                {
                    objResponse.Message = "Appointment Successfully Deleted";
                    objResponse.Data = null;
                    objResponse.ReponseCode = 200;
                    return Ok(objResponse);
                }
                objResponse.Message = "Invalid";
                objResponse.Data = null;
                objResponse.ReponseCode = 400;
                return BadRequest(objResponse);
            }
            catch (Exception ex)
            {
                objResponse.Message = ex.InnerException is null ? ex.Message : ex.InnerException.Message;
                objResponse.Data = null;
                objResponse.ReponseCode = 400;
                return BadRequest(objResponse);
            }
        }
        // GET: api/Appointments/sendPrescriptionMail/{id}
        // Send a appointment prescription mail by it id
        [HttpGet("sendPrescriptionMail/{id}")]
        public async Task<IActionResult> SendPrescriptionMail(Guid id)
        {
            CustomResponse response = new() { ReponseCode = 200 };
            try
            {
                response = await _appointmentsService.SendPatientPrescriptionMail(id);
                if (response.ReponseCode == 200)
                {
                    return Ok(response);
                }
                else
                {
                    return BadRequest(response);
                }
            }
            catch (Exception)
            {
                response.ReponseCode = 500;
                response.Message = "Data Not Found";
                response.Data = null;
                return BadRequest(response);
            }
        }


    }
}
