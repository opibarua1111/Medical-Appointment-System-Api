using System;
using System.Collections.Generic;

namespace Medical_Appointment_System_API.Models;

public partial class Appointment
{
    public Guid Id { get; set; }

    public Guid PatientId { get; set; }

    public Guid DoctorId { get; set; }

    public DateOnly AppointmentDate { get; set; }

    public string? VisitType { get; set; }

    public string? Notes { get; set; }

    public string? Diagnosis { get; set; }

    public DateTime CreatedUtc { get; set; }

    public DateTime? UpdatedUtc { get; set; }

    public virtual Doctor Doctor { get; set; } = null!;

    public virtual Patient Patient { get; set; } = null!;

    public virtual ICollection<PrescriptionDetail> PrescriptionDetails { get; set; } = new List<PrescriptionDetail>();
}
