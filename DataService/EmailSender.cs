using iTextSharp.text;
using iTextSharp.text.pdf;
using Medical_Appointment_System_API.Interface;
using Medical_Appointment_System_API.Models.Email;
using Medical_Appointment_System_API.Models.RequestModel;
using Medical_Appointment_System_API.Models.Response;
using Microsoft.Extensions.Options;
using System.Net;
using System.Net.Mail;
using System.Reflection.Metadata;
using System.Text;
using System.Xml.Linq;
using static Org.BouncyCastle.Math.EC.ECCurve;
using Document = iTextSharp.text.Document;

namespace Medical_Appointment_System_API.DataService
{
    public class EmailSender : IEmailSender
    {
        private readonly EmailSettings _emailSettings;

        public EmailSender(IOptions<EmailSettings> options)
        {
            _emailSettings = options.Value;
        }
        public async Task<bool> SendEmailAsync(string email, string subject, string message, string attachmentPath = null)
        {
            try
            {
                /*var client = new SmtpClient(_emailSettings.MailServer);

                var mailMessage = new MailMessage
                {
                    From = new MailAddress(_emailSettings.SenderEmail)
                };
                mailMessage.To.Add(email);
                mailMessage.Subject = subject;
                mailMessage.Body = message;
                mailMessage.IsBodyHtml = true;

                if (attachmentPath != null)
                {
                    string tempFilePath = await DownloadFileAsync(attachmentPath);

                    if (!string.IsNullOrEmpty(tempFilePath) && File.Exists(tempFilePath))
                    {
                        Attachment attachment = new Attachment(tempFilePath);
                        mailMessage.Attachments.Add(attachment);
                    }
                }

                client.Port = _emailSettings.MailPort;
                client.DeliveryMethod = SmtpDeliveryMethod.Network;
                client.UseDefaultCredentials = false;
                client.Credentials = new NetworkCredential(_emailSettings.SenderEmail, _emailSettings.Password);
                client.EnableSsl = _emailSettings.EnableSsl;
                client.SendMailAsync(mailMessage);*/
                using (var client = new SmtpClient(_emailSettings.SmtpServer, _emailSettings.MailPort))
                {
                    client.DeliveryMethod = SmtpDeliveryMethod.Network;
                    client.UseDefaultCredentials = false;
                    client.Credentials = new NetworkCredential(_emailSettings.SenderEmail, _emailSettings.Password);
                    client.EnableSsl = _emailSettings.EnableSsl;

                    using (var mailMessage = new MailMessage
                    {
                        From = new MailAddress(_emailSettings.SenderEmail),
                        Subject = subject,
                        Body = message,
                        IsBodyHtml = true
                    })
                    {
                        mailMessage.To.Add(email);

                        if (attachmentPath != null)
                        {
                            string tempFilePath = await DownloadFileAsync(attachmentPath);
                            if (!string.IsNullOrEmpty(tempFilePath) && File.Exists(tempFilePath))
                            {
                                mailMessage.Attachments.Add(new Attachment(tempFilePath));
                            }
                        }

                        await client.SendMailAsync(mailMessage);
                    }
                }

                return await Task.FromResult(true);
            }
            catch (Exception ex)
            {
                return await Task.FromResult(false);
            }
        }

        // download file
        private static async Task<string> DownloadFileAsync(string urlOrPath)
        {
            try
            {
                // If it's a local file path
                if (File.Exists(urlOrPath))
                {
                    return urlOrPath; // Just return the same path
                }

                // Otherwise treat it as an HTTP/HTTPS URL
                if (Uri.TryCreate(urlOrPath, UriKind.Absolute, out var uri) &&
                    (uri.Scheme == Uri.UriSchemeHttp || uri.Scheme == Uri.UriSchemeHttps))
                {
                    using (HttpClient client = new HttpClient())
                    {
                        HttpResponseMessage response = await client.GetAsync(uri);

                        if (!response.IsSuccessStatusCode)
                        {
                            throw new Exception($"Failed to download file. Status code: {response.StatusCode}");
                        }

                        string fileName = Path.GetFileName(uri.LocalPath);
                        if (string.IsNullOrEmpty(fileName))
                        {
                            fileName = Guid.NewGuid() + ".tmp";
                        }

                        string tempFilePath = Path.Combine(Path.GetTempPath(), fileName);

                        await using (var fs = new FileStream(tempFilePath, FileMode.Create, FileAccess.Write, FileShare.None))
                        {
                            await response.Content.CopyToAsync(fs);
                        }

                        return tempFilePath;
                    }
                }

                throw new Exception("Invalid path or URL");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"DownloadFileAsync error: {ex.Message}");
                return null;
            }
        }


        public async Task SendPatientPrescription(string patientEmail, string patientName, string doctorName, string appointmentDate, string visitType, List<PrescriptionDetailResponse> prescriptions)
        {
            try
            {
                var subject = $"Your Medical Appointment Prescription";
                var attachmentPath = GeneratePrescriptionPdf(patientName, doctorName, visitType, appointmentDate, prescriptions);

                var isSent = await SendEmailAsync(patientEmail, subject, "Downdoad your prescription", attachmentPath);
                if (!isSent)
                {
                    throw new Exception("Sorry! Prescription Sending Faild");
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        public string GeneratePrescriptionPdf(string patientName, string doctorName, string visitType, string appointmentDate, List<PrescriptionDetailResponse> prescriptions)
        {
            string folderPath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "Reports");
            if (!Directory.Exists(folderPath))
                Directory.CreateDirectory(folderPath);

            string filePath = Path.Combine(folderPath, "PrescriptionReport.pdf");

            Document doc = new Document(PageSize.A4, 50, 50, 50, 50);
            PdfWriter.GetInstance(doc, new FileStream(filePath, FileMode.Create));
            doc.Open();

            // Title
            var titleFont = FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 20);
            Paragraph title = new Paragraph("Prescription Report", titleFont);
            title.Alignment = Element.ALIGN_CENTER;
            doc.Add(title);
            doc.Add(new Paragraph("\n"));

            // Patient Details (left aligned, bold labels)
            var labelFont = FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 12);
            var valueFont = FontFactory.GetFont(FontFactory.HELVETICA, 12);


            Paragraph patient = new Paragraph();
            patient.Add(new Chunk("Patient: ", labelFont));
            patient.Add(new Chunk(patientName, valueFont));
            doc.Add(patient);

            Paragraph dName = new Paragraph();
            dName.Add(new Chunk("Doctor: ", labelFont));
            dName.Add(new Chunk(doctorName, valueFont));
            doc.Add(dName);

            Paragraph date = new Paragraph();
            date.Add(new Chunk("Date: ", labelFont));
            date.Add(new Chunk(appointmentDate, valueFont));
            doc.Add(date);

            Paragraph vType = new Paragraph();
            vType.Add(new Chunk("Visit Type: ", labelFont));
            vType.Add(new Chunk(visitType, valueFont));
            doc.Add(vType);

            //doc.Add(new Paragraph($"Visit Type: ", labelFont));
            //doc.Add(new Paragraph(visitType, valueFont));
            doc.Add(new Paragraph("\n"));

            // Prescription Table
            var headerFont = FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 15);
            Paragraph tableHeader = new Paragraph("Prescriptions", headerFont);
            tableHeader.SpacingBefore = 10f;
            tableHeader.SpacingAfter = 5f;
            doc.Add(tableHeader);

            PdfPTable table = new PdfPTable(4); // 4 columns
            table.WidthPercentage = 100;
            table.SetWidths(new float[] { 2, 2, 2, 2 });

            // Table Header
            string[] headers = { "Medicine", "Dosage", "Start Date", "End Date" };
            foreach (var h in headers)
            {
                PdfPCell cell = new PdfPCell(new Phrase(h, labelFont));
                cell.HorizontalAlignment = Element.ALIGN_CENTER;
                cell.BackgroundColor = BaseColor.LIGHT_GRAY;
                cell.Padding = 5;
                table.AddCell(cell);
            }

            // Table Rows
            foreach (var p in prescriptions)
            {
                table.AddCell(new PdfPCell(new Phrase(p.MedicineName, valueFont)) { Padding = 5 });
                table.AddCell(new PdfPCell(new Phrase(p.Dosage, valueFont)) { Padding = 5 });
                /*table.AddCell(new PdfPCell(new Phrase(p.StartDate.ToString("dd-MMM-yyyy"), valueFont)) { Padding = 5 });*/
                table.AddCell(new PdfPCell(new Phrase(p.StartDate != DateOnly.MinValue ? p.StartDate.ToString("dd-MMM-yyyy") : string.Empty,valueFont)){ Padding = 5 });
                table.AddCell(new PdfPCell(new Phrase(p.EndDate != DateOnly.MinValue ? p.StartDate.ToString("dd-MMM-yyyy") : string.Empty,valueFont)){ Padding = 5 });
            }

            doc.Add(table);
            doc.Close();

            return filePath;
        }



    }
}
