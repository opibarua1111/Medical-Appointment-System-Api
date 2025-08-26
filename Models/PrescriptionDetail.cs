using System;
using System.Collections.Generic;

namespace Medical_Appointment_System_API.Models;

public partial class PrescriptionDetail
{
    public Guid Id { get; set; }

    public Guid AppointmentId { get; set; }

    public Guid MedicineId { get; set; }

    public string? Dosage { get; set; }

    public DateOnly? StartDate { get; set; }

    public DateOnly? EndDate { get; set; }

    public string? Notes { get; set; }

    public virtual Appointment Appointment { get; set; } = null!;

    public virtual Medicine Medicine { get; set; } = null!;
}
