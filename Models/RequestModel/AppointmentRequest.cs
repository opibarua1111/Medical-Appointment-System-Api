namespace Medical_Appointment_System_API.Models.RequestModel
{
    public class AppointmentRequest
    {
        public Guid? Id { get; set; }
        public Guid PatientId { get; set; }
        public Guid DoctorId { get; set; }
        public DateOnly AppointmentDate { get; set; }
        public string? VisitType { get; set; }
        public string? Notes { get; set; }
        public string? Diagnosis { get; set; }
        public DateTime? CreatedUtc { get; set; }
        public DateTime? UpdatedUtc { get; set; }

        public virtual ICollection<PrescriptionDetailReq>? PrescriptionDetails { get; set; } = new List<PrescriptionDetailReq>();
    }

    public partial class PrescriptionDetailReq
    {
        public Guid? Id { get; set; }

        public Guid? AppointmentId { get; set; }

        public Guid MedicineId { get; set; }
        public string? MedicineName { get; set; }

        public string? Dosage { get; set; }

        public DateOnly? StartDate { get; set; }

        public DateOnly? EndDate { get; set; }

        public string? Notes { get; set; }

    }
}
