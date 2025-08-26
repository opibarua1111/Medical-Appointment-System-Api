using System;
using System.Collections.Generic;

namespace Medical_Appointment_System_API.Models;

public partial class Patient
{
    public Guid Id { get; set; }

    public string FullName { get; set; } = null!;

    public DateOnly? DateOfBirth { get; set; }

    public string? Phone { get; set; }

    public string? Email { get; set; }

    public DateTime CreatedUtc { get; set; }

    public virtual ICollection<Appointment> Appointments { get; set; } = new List<Appointment>();
}
