using System;
using System.Collections.Generic;

namespace Medical_Appointment_System_API.Models;

public partial class Medicine
{
    public Guid Id { get; set; }

    public string Name { get; set; } = null!;

    public string? Strength { get; set; }

    public DateTime CreatedUtc { get; set; }

    public virtual ICollection<PrescriptionDetail> PrescriptionDetails { get; set; } = new List<PrescriptionDetail>();
}
