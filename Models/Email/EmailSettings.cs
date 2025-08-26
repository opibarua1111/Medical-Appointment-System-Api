namespace Medical_Appointment_System_API.Models.Email
{
    public class EmailSettings
    {
        public string SmtpServer { get; set; }
        public int MailPort { get; set; }
        public string SenderName { get; set; }
        public string SenderEmail { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public bool EnableSsl { get; set; }
    }
}
