using Medical_Appointment_System_API.Models.RequestModel;
using Medical_Appointment_System_API.Models.Response;

namespace Medical_Appointment_System_API.Interface
{
    public interface IEmailSender
    {
        Task SendPatientPrescription(string patientEmail, string patientName, string doctorName,string appointmentDate, string visitType, List<PrescriptionDetailResponse> prescriptionDetails);
    }
}
