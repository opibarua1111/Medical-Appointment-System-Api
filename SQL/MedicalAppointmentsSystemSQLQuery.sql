
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 8/27/2025 12:42:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Appointments]    Script Date: 8/27/2025 12:42:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointments](
	[Id] [uniqueidentifier] NOT NULL,
	[PatientId] [uniqueidentifier] NOT NULL,
	[DoctorId] [uniqueidentifier] NOT NULL,
	[AppointmentDate] [date] NOT NULL,
	[VisitType] [nvarchar](50) NULL,
	[Notes] [nvarchar](1000) NULL,
	[Diagnosis] [nvarchar](2000) NULL,
	[CreatedUtc] [datetime2](7) NOT NULL,
	[UpdatedUtc] [datetime2](7) NULL,
 CONSTRAINT [PK__Appointm__3214EC07363C685C] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctors]    Script Date: 8/27/2025 12:42:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctors](
	[Id] [uniqueidentifier] NOT NULL,
	[FullName] [nvarchar](120) NOT NULL,
	[Specialty] [nvarchar](120) NULL,
	[CreatedUtc] [datetime2](7) NOT NULL,
 CONSTRAINT [PK__Doctors__3214EC07CD1D906F] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicines]    Script Date: 8/27/2025 12:42:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicines](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](160) NOT NULL,
	[Strength] [nvarchar](60) NULL,
	[CreatedUtc] [datetime2](7) NOT NULL,
 CONSTRAINT [PK__Medicine__3214EC073F45B323] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patients]    Script Date: 8/27/2025 12:42:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patients](
	[Id] [uniqueidentifier] NOT NULL,
	[FullName] [nvarchar](120) NOT NULL,
	[DateOfBirth] [date] NULL,
	[Phone] [nvarchar](40) NULL,
	[Email] [nvarchar](120) NULL,
	[CreatedUtc] [datetime2](7) NOT NULL,
 CONSTRAINT [PK__Patients__3214EC0775AF7E7E] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PrescriptionDetails]    Script Date: 8/27/2025 12:42:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrescriptionDetails](
	[Id] [uniqueidentifier] NOT NULL,
	[AppointmentId] [uniqueidentifier] NOT NULL,
	[MedicineId] [uniqueidentifier] NOT NULL,
	[Dosage] [nvarchar](120) NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[Notes] [nvarchar](1000) NULL,
 CONSTRAINT [PK__Prescrip__3214EC07DB17A68B] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250825013719_InitialCreate', N'9.0.8')
GO
INSERT [dbo].[Appointments] ([Id], [PatientId], [DoctorId], [AppointmentDate], [VisitType], [Notes], [Diagnosis], [CreatedUtc], [UpdatedUtc]) VALUES (N'579aade1-2d38-4292-b372-08dde3d1d403', N'f339517d-c19d-4a66-9e0a-f76f5864d8e2', N'ac1a7e3c-b801-4fa7-808c-2257eb164ed5', CAST(N'2025-08-26' AS Date), N'first', N'', N'', CAST(N'2025-08-25T02:41:33.3659909' AS DateTime2), CAST(N'2025-08-25T07:06:34.3671175' AS DateTime2))
GO
INSERT [dbo].[Appointments] ([Id], [PatientId], [DoctorId], [AppointmentDate], [VisitType], [Notes], [Diagnosis], [CreatedUtc], [UpdatedUtc]) VALUES (N'e4fb2c27-f292-4311-a5c3-12fdf9d1c079', N'b8743907-ce3c-417f-bd8e-aec378eb5ae8', N'ac1a7e3c-b801-4fa7-808c-2257eb164ed5', CAST(N'2025-08-27' AS Date), N'first', N'notes', N'', CAST(N'2025-08-26T15:41:54.6279640' AS DateTime2), NULL)
GO
INSERT [dbo].[Appointments] ([Id], [PatientId], [DoctorId], [AppointmentDate], [VisitType], [Notes], [Diagnosis], [CreatedUtc], [UpdatedUtc]) VALUES (N'3e31e98e-75d7-4ce1-9bd6-24b89b335424', N'd0a09415-0df6-4ff8-a952-c1ed63d27729', N'ac1a7e3c-b801-4fa7-808c-2257eb164ed5', CAST(N'2025-08-15' AS Date), N'first', N'', N'', CAST(N'2025-08-26T06:25:02.4512096' AS DateTime2), NULL)
GO
INSERT [dbo].[Appointments] ([Id], [PatientId], [DoctorId], [AppointmentDate], [VisitType], [Notes], [Diagnosis], [CreatedUtc], [UpdatedUtc]) VALUES (N'8799e58f-affa-4095-9066-2c61bd0b7783', N'b8743907-ce3c-417f-bd8e-aec378eb5ae8', N'7da0e852-9307-412c-aa0d-fe723d48ed6e', CAST(N'2025-09-06' AS Date), N'first', N'', N'', CAST(N'2025-08-26T06:26:08.3517955' AS DateTime2), CAST(N'2025-08-26T15:44:02.2487590' AS DateTime2))
GO
INSERT [dbo].[Appointments] ([Id], [PatientId], [DoctorId], [AppointmentDate], [VisitType], [Notes], [Diagnosis], [CreatedUtc], [UpdatedUtc]) VALUES (N'4e4a9075-ccb2-4f52-9af1-4a45c5ffe8df', N'b8743907-ce3c-417f-bd8e-aec378eb5ae8', N'ac1a7e3c-b801-4fa7-808c-2257eb164ed5', CAST(N'2025-08-27' AS Date), N'first', N'notes', N'', CAST(N'2025-08-26T15:39:21.8576412' AS DateTime2), NULL)
GO
INSERT [dbo].[Appointments] ([Id], [PatientId], [DoctorId], [AppointmentDate], [VisitType], [Notes], [Diagnosis], [CreatedUtc], [UpdatedUtc]) VALUES (N'8a62071e-e2c3-44ed-9d13-5488539e86aa', N'b8743907-ce3c-417f-bd8e-aec378eb5ae8', N'7da0e852-9307-412c-aa0d-fe723d48ed6e', CAST(N'2025-08-01' AS Date), N'follow up', N'', N'', CAST(N'2025-08-26T06:24:47.8661237' AS DateTime2), CAST(N'2025-08-26T11:21:49.5604339' AS DateTime2))
GO
INSERT [dbo].[Appointments] ([Id], [PatientId], [DoctorId], [AppointmentDate], [VisitType], [Notes], [Diagnosis], [CreatedUtc], [UpdatedUtc]) VALUES (N'29a53034-0a56-4d6d-b9a1-55ee3e428404', N'b8743907-ce3c-417f-bd8e-aec378eb5ae8', N'ac1a7e3c-b801-4fa7-808c-2257eb164ed5', CAST(N'2025-08-21' AS Date), N'', N'', N'', CAST(N'2025-08-26T06:24:25.0442005' AS DateTime2), NULL)
GO
INSERT [dbo].[Appointments] ([Id], [PatientId], [DoctorId], [AppointmentDate], [VisitType], [Notes], [Diagnosis], [CreatedUtc], [UpdatedUtc]) VALUES (N'b168c8a3-a487-482f-9dab-5acbcbd38ff2', N'd0a09415-0df6-4ff8-a952-c1ed63d27729', N'ac1a7e3c-b801-4fa7-808c-2257eb164ed5', CAST(N'2025-08-28' AS Date), N'first', N'', N'', CAST(N'2025-08-26T06:25:20.7640438' AS DateTime2), CAST(N'2025-08-26T10:42:09.6596853' AS DateTime2))
GO
INSERT [dbo].[Appointments] ([Id], [PatientId], [DoctorId], [AppointmentDate], [VisitType], [Notes], [Diagnosis], [CreatedUtc], [UpdatedUtc]) VALUES (N'aaa263e1-c367-475c-b529-5dab10b2fcda', N'd0a09415-0df6-4ff8-a952-c1ed63d27729', N'e5b61a17-a637-47f8-8f0b-e44dcb10dd73', CAST(N'2025-08-28' AS Date), N'', N'', N'', CAST(N'2025-08-26T15:25:31.4268207' AS DateTime2), NULL)
GO
INSERT [dbo].[Appointments] ([Id], [PatientId], [DoctorId], [AppointmentDate], [VisitType], [Notes], [Diagnosis], [CreatedUtc], [UpdatedUtc]) VALUES (N'4d4ab15d-19b8-476b-9a47-651d3a211944', N'b8743907-ce3c-417f-bd8e-aec378eb5ae8', N'e5b61a17-a637-47f8-8f0b-e44dcb10dd73', CAST(N'2025-08-30' AS Date), N'first', N'', N'', CAST(N'2025-08-26T06:25:35.7879969' AS DateTime2), CAST(N'2025-08-26T10:33:10.1664972' AS DateTime2))
GO
INSERT [dbo].[Appointments] ([Id], [PatientId], [DoctorId], [AppointmentDate], [VisitType], [Notes], [Diagnosis], [CreatedUtc], [UpdatedUtc]) VALUES (N'8439fb6d-232a-4d25-bae9-6b0c0e136b70', N'b8743907-ce3c-417f-bd8e-aec378eb5ae8', N'7da0e852-9307-412c-aa0d-fe723d48ed6e', CAST(N'2025-08-27' AS Date), N'follow up', N'', N'', CAST(N'2025-08-26T03:45:41.5807023' AS DateTime2), CAST(N'2025-08-26T03:54:56.2778424' AS DateTime2))
GO
INSERT [dbo].[Appointments] ([Id], [PatientId], [DoctorId], [AppointmentDate], [VisitType], [Notes], [Diagnosis], [CreatedUtc], [UpdatedUtc]) VALUES (N'9606180e-e8f7-4e86-9ddf-6b73aafb93dc', N'b8743907-ce3c-417f-bd8e-aec378eb5ae8', N'ac1a7e3c-b801-4fa7-808c-2257eb164ed5', CAST(N'2025-08-27' AS Date), N'first', N'notes', N'', CAST(N'2025-08-26T15:41:29.4621549' AS DateTime2), NULL)
GO
INSERT [dbo].[Appointments] ([Id], [PatientId], [DoctorId], [AppointmentDate], [VisitType], [Notes], [Diagnosis], [CreatedUtc], [UpdatedUtc]) VALUES (N'ba65ba9c-ae1e-4118-b84b-6e2e99d5d5f5', N'b8743907-ce3c-417f-bd8e-aec378eb5ae8', N'ac1a7e3c-b801-4fa7-808c-2257eb164ed5', CAST(N'2025-08-28' AS Date), N'', N'', N'', CAST(N'2025-08-26T15:25:04.7799643' AS DateTime2), NULL)
GO
INSERT [dbo].[Appointments] ([Id], [PatientId], [DoctorId], [AppointmentDate], [VisitType], [Notes], [Diagnosis], [CreatedUtc], [UpdatedUtc]) VALUES (N'1ae47366-1cf5-417d-9162-8fceea6f64e3', N'b8743907-ce3c-417f-bd8e-aec378eb5ae8', N'7da0e852-9307-412c-aa0d-fe723d48ed6e', CAST(N'2025-08-15' AS Date), N'follow up', N'', N'', CAST(N'2025-08-26T06:24:35.6064177' AS DateTime2), NULL)
GO
INSERT [dbo].[Appointments] ([Id], [PatientId], [DoctorId], [AppointmentDate], [VisitType], [Notes], [Diagnosis], [CreatedUtc], [UpdatedUtc]) VALUES (N'7cb1b17b-b8d1-4e4f-8003-917f1d4bc3a0', N'f339517d-c19d-4a66-9e0a-f76f5864d8e2', N'e5b61a17-a637-47f8-8f0b-e44dcb10dd73', CAST(N'2025-08-28' AS Date), N'first', N'', N'', CAST(N'2025-08-26T14:47:17.3660427' AS DateTime2), NULL)
GO
INSERT [dbo].[Appointments] ([Id], [PatientId], [DoctorId], [AppointmentDate], [VisitType], [Notes], [Diagnosis], [CreatedUtc], [UpdatedUtc]) VALUES (N'13ba63c7-4e80-415a-8289-93558265f122', N'f339517d-c19d-4a66-9e0a-f76f5864d8e2', N'ac1a7e3c-b801-4fa7-808c-2257eb164ed5', CAST(N'2025-10-10' AS Date), N'first', N'des', N'dio', CAST(N'2025-08-25T05:10:22.4072234' AS DateTime2), CAST(N'2025-08-25T15:21:06.4852787' AS DateTime2))
GO
INSERT [dbo].[Appointments] ([Id], [PatientId], [DoctorId], [AppointmentDate], [VisitType], [Notes], [Diagnosis], [CreatedUtc], [UpdatedUtc]) VALUES (N'4760bfcc-8fe5-458d-ab79-984b602b670f', N'd0a09415-0df6-4ff8-a952-c1ed63d27729', N'e5b61a17-a637-47f8-8f0b-e44dcb10dd73', CAST(N'2025-09-01' AS Date), N'first', N'', N'', CAST(N'2025-08-26T03:56:38.9287428' AS DateTime2), CAST(N'2025-08-26T04:07:40.5618743' AS DateTime2))
GO
INSERT [dbo].[Appointments] ([Id], [PatientId], [DoctorId], [AppointmentDate], [VisitType], [Notes], [Diagnosis], [CreatedUtc], [UpdatedUtc]) VALUES (N'31048878-167e-42b1-8d60-9f9436cbba9e', N'b8743907-ce3c-417f-bd8e-aec378eb5ae8', N'ac1a7e3c-b801-4fa7-808c-2257eb164ed5', CAST(N'2025-08-27' AS Date), N'first', N'notes', N'', CAST(N'2025-08-26T15:41:00.3684142' AS DateTime2), NULL)
GO
INSERT [dbo].[Appointments] ([Id], [PatientId], [DoctorId], [AppointmentDate], [VisitType], [Notes], [Diagnosis], [CreatedUtc], [UpdatedUtc]) VALUES (N'80343f5c-495d-44f1-a4c1-bdf0ad461d6b', N'b8743907-ce3c-417f-bd8e-aec378eb5ae8', N'ac1a7e3c-b801-4fa7-808c-2257eb164ed5', CAST(N'2025-09-04' AS Date), N'first', N'description', N'details here', CAST(N'2025-08-26T11:19:24.9742681' AS DateTime2), NULL)
GO
INSERT [dbo].[Appointments] ([Id], [PatientId], [DoctorId], [AppointmentDate], [VisitType], [Notes], [Diagnosis], [CreatedUtc], [UpdatedUtc]) VALUES (N'94dcdf90-c517-4e1f-ae8b-c662c129eb6e', N'b8743907-ce3c-417f-bd8e-aec378eb5ae8', N'ac1a7e3c-b801-4fa7-808c-2257eb164ed5', CAST(N'2025-08-29' AS Date), N'first', N'description', N'diagnosis', CAST(N'2025-08-26T11:28:03.4650112' AS DateTime2), CAST(N'2025-08-26T11:31:22.0608345' AS DateTime2))
GO
INSERT [dbo].[Appointments] ([Id], [PatientId], [DoctorId], [AppointmentDate], [VisitType], [Notes], [Diagnosis], [CreatedUtc], [UpdatedUtc]) VALUES (N'7985ee31-e3c6-403d-a2d5-cb75138a2c03', N'f339517d-c19d-4a66-9e0a-f76f5864d8e2', N'e5b61a17-a637-47f8-8f0b-e44dcb10dd73', CAST(N'2025-08-27' AS Date), N'', N'', N'', CAST(N'2025-08-26T14:12:24.6777200' AS DateTime2), NULL)
GO
INSERT [dbo].[Appointments] ([Id], [PatientId], [DoctorId], [AppointmentDate], [VisitType], [Notes], [Diagnosis], [CreatedUtc], [UpdatedUtc]) VALUES (N'32c71013-3496-49e4-92b2-d3af95b9a235', N'b8743907-ce3c-417f-bd8e-aec378eb5ae8', N'ac1a7e3c-b801-4fa7-808c-2257eb164ed5', CAST(N'2025-08-30' AS Date), N'first', N'notes ', N'diagnosis', CAST(N'2025-08-26T11:46:52.0759115' AS DateTime2), CAST(N'2025-08-26T11:49:07.0376049' AS DateTime2))
GO
INSERT [dbo].[Appointments] ([Id], [PatientId], [DoctorId], [AppointmentDate], [VisitType], [Notes], [Diagnosis], [CreatedUtc], [UpdatedUtc]) VALUES (N'edaa88a3-7c32-4ab7-9814-eebce6635b12', N'f339517d-c19d-4a66-9e0a-f76f5864d8e2', N'ac1a7e3c-b801-4fa7-808c-2257eb164ed5', CAST(N'2025-08-28' AS Date), N'', N'', N'', CAST(N'2025-08-26T14:11:43.5104834' AS DateTime2), NULL)
GO
INSERT [dbo].[Appointments] ([Id], [PatientId], [DoctorId], [AppointmentDate], [VisitType], [Notes], [Diagnosis], [CreatedUtc], [UpdatedUtc]) VALUES (N'39b198ea-e8de-46bb-880f-f4dd1b71ffb4', N'b8743907-ce3c-417f-bd8e-aec378eb5ae8', N'ac1a7e3c-b801-4fa7-808c-2257eb164ed5', CAST(N'2025-08-27' AS Date), N'follow up', N'notes', N'', CAST(N'2025-08-26T15:42:04.0990713' AS DateTime2), NULL)
GO
INSERT [dbo].[Doctors] ([Id], [FullName], [Specialty], [CreatedUtc]) VALUES (N'ac1a7e3c-b801-4fa7-808c-2257eb164ed5', N'Dr. Alice', N'Cardiologist', CAST(N'2025-08-25T08:09:04.8551227' AS DateTime2))
GO
INSERT [dbo].[Doctors] ([Id], [FullName], [Specialty], [CreatedUtc]) VALUES (N'e5b61a17-a637-47f8-8f0b-e44dcb10dd73', N'Dr. Charlie', N'Neurologist', CAST(N'2025-08-25T08:09:04.8551227' AS DateTime2))
GO
INSERT [dbo].[Doctors] ([Id], [FullName], [Specialty], [CreatedUtc]) VALUES (N'7da0e852-9307-412c-aa0d-fe723d48ed6e', N'Dr. Bob', N'Dermatologist', CAST(N'2025-08-25T08:09:04.8551227' AS DateTime2))
GO
INSERT [dbo].[Medicines] ([Id], [Name], [Strength], [CreatedUtc]) VALUES (N'd134a67f-5bc7-44ba-aaae-511c5aad8bc8', N'Ibuprofen', N'400mg', CAST(N'2025-08-25T08:09:04.8640901' AS DateTime2))
GO
INSERT [dbo].[Medicines] ([Id], [Name], [Strength], [CreatedUtc]) VALUES (N'54047cee-990a-49f6-ab7b-92506903ac6f', N'Aspirin', N'500mg', CAST(N'2025-08-25T08:09:04.8640901' AS DateTime2))
GO
INSERT [dbo].[Medicines] ([Id], [Name], [Strength], [CreatedUtc]) VALUES (N'6e60560e-eeac-4752-a68b-aa4e3a701cac', N'Paracetamol', N'650mg', CAST(N'2025-08-25T08:09:04.8640901' AS DateTime2))
GO
INSERT [dbo].[Patients] ([Id], [FullName], [DateOfBirth], [Phone], [Email], [CreatedUtc]) VALUES (N'b8743907-ce3c-417f-bd8e-aec378eb5ae8', N'Jane Smith', CAST(N'1992-09-23' AS Date), N'4445556666', N'opibarua1111@gmail.com', CAST(N'2025-08-25T08:09:04.8640901' AS DateTime2))
GO
INSERT [dbo].[Patients] ([Id], [FullName], [DateOfBirth], [Phone], [Email], [CreatedUtc]) VALUES (N'd0a09415-0df6-4ff8-a952-c1ed63d27729', N'Mike Brown', CAST(N'2000-02-15' AS Date), N'7778889999', N'mike.brown@example.com', CAST(N'2025-08-25T08:09:04.8640901' AS DateTime2))
GO
INSERT [dbo].[Patients] ([Id], [FullName], [DateOfBirth], [Phone], [Email], [CreatedUtc]) VALUES (N'f339517d-c19d-4a66-9e0a-f76f5864d8e2', N'Opi Barua', CAST(N'1985-05-12' AS Date), N'01300023918', N'opibarua1122@gmail.com', CAST(N'2025-08-25T08:09:04.8640901' AS DateTime2))
GO
INSERT [dbo].[PrescriptionDetails] ([Id], [AppointmentId], [MedicineId], [Dosage], [StartDate], [EndDate], [Notes]) VALUES (N'74fc59bf-878e-4bd1-b3ce-02e770a568b8', N'32c71013-3496-49e4-92b2-d3af95b9a235', N'd134a67f-5bc7-44ba-aaae-511c5aad8bc8', N'400 mg', CAST(N'2025-08-28' AS Date), CAST(N'2025-09-04' AS Date), N'note')
GO
INSERT [dbo].[PrescriptionDetails] ([Id], [AppointmentId], [MedicineId], [Dosage], [StartDate], [EndDate], [Notes]) VALUES (N'40ea1b1b-c3ed-4b00-b2cd-083631f56621', N'31048878-167e-42b1-8d60-9f9436cbba9e', N'54047cee-990a-49f6-ab7b-92506903ac6f', N'500 mg', CAST(N'2025-08-22' AS Date), CAST(N'2025-09-05' AS Date), N'')
GO
INSERT [dbo].[PrescriptionDetails] ([Id], [AppointmentId], [MedicineId], [Dosage], [StartDate], [EndDate], [Notes]) VALUES (N'29c546e9-ec05-4fca-9b38-154191a3b5ed', N'8439fb6d-232a-4d25-bae9-6b0c0e136b70', N'd134a67f-5bc7-44ba-aaae-511c5aad8bc8', N'200mg', CAST(N'2025-08-27' AS Date), CAST(N'2025-08-27' AS Date), N'')
GO
INSERT [dbo].[PrescriptionDetails] ([Id], [AppointmentId], [MedicineId], [Dosage], [StartDate], [EndDate], [Notes]) VALUES (N'a0d16056-ee39-446e-b3fe-1df7cd873d1b', N'8a62071e-e2c3-44ed-9d13-5488539e86aa', N'6e60560e-eeac-4752-a68b-aa4e3a701cac', N'250 mg', CAST(N'2025-08-27' AS Date), CAST(N'2025-08-30' AS Date), N'note')
GO
INSERT [dbo].[PrescriptionDetails] ([Id], [AppointmentId], [MedicineId], [Dosage], [StartDate], [EndDate], [Notes]) VALUES (N'b45f1e2f-c43e-444b-bd86-1eab9e28aa98', N'9606180e-e8f7-4e86-9ddf-6b73aafb93dc', N'd134a67f-5bc7-44ba-aaae-511c5aad8bc8', N'400mg', CAST(N'2025-08-27' AS Date), CAST(N'2025-08-28' AS Date), N'note')
GO
INSERT [dbo].[PrescriptionDetails] ([Id], [AppointmentId], [MedicineId], [Dosage], [StartDate], [EndDate], [Notes]) VALUES (N'8d5e690d-50af-4e01-ad46-222e454bc8b7', N'4d4ab15d-19b8-476b-9a47-651d3a211944', N'd134a67f-5bc7-44ba-aaae-511c5aad8bc8', N'', CAST(N'2025-08-29' AS Date), CAST(N'2025-09-05' AS Date), N'')
GO
INSERT [dbo].[PrescriptionDetails] ([Id], [AppointmentId], [MedicineId], [Dosage], [StartDate], [EndDate], [Notes]) VALUES (N'3f913e67-9ad6-4aa6-823c-257210c03579', N'39b198ea-e8de-46bb-880f-f4dd1b71ffb4', N'54047cee-990a-49f6-ab7b-92506903ac6f', N'500 mg', CAST(N'2025-08-22' AS Date), CAST(N'2025-09-05' AS Date), N'')
GO
INSERT [dbo].[PrescriptionDetails] ([Id], [AppointmentId], [MedicineId], [Dosage], [StartDate], [EndDate], [Notes]) VALUES (N'486b9d2c-6265-4260-84d8-274daecbf37d', N'579aade1-2d38-4292-b372-08dde3d1d403', N'd134a67f-5bc7-44ba-aaae-511c5aad8bc8', N'200mg', CAST(N'2025-08-26' AS Date), CAST(N'2025-09-05' AS Date), N'note')
GO
INSERT [dbo].[PrescriptionDetails] ([Id], [AppointmentId], [MedicineId], [Dosage], [StartDate], [EndDate], [Notes]) VALUES (N'aa34e798-e01f-49e6-9230-27b769c6a13a', N'e4fb2c27-f292-4311-a5c3-12fdf9d1c079', N'd134a67f-5bc7-44ba-aaae-511c5aad8bc8', N'400mg', CAST(N'2025-08-27' AS Date), CAST(N'2025-08-28' AS Date), N'note')
GO
INSERT [dbo].[PrescriptionDetails] ([Id], [AppointmentId], [MedicineId], [Dosage], [StartDate], [EndDate], [Notes]) VALUES (N'c12dce2d-1705-4058-a9ed-293814e5eb71', N'aaa263e1-c367-475c-b529-5dab10b2fcda', N'd134a67f-5bc7-44ba-aaae-511c5aad8bc8', N'', NULL, NULL, N'')
GO
INSERT [dbo].[PrescriptionDetails] ([Id], [AppointmentId], [MedicineId], [Dosage], [StartDate], [EndDate], [Notes]) VALUES (N'3aa58aea-035a-4a27-bb5b-33b6e624969b', N'e4fb2c27-f292-4311-a5c3-12fdf9d1c079', N'6e60560e-eeac-4752-a68b-aa4e3a701cac', N'100 mg', CAST(N'2025-08-28' AS Date), CAST(N'2025-08-30' AS Date), N'')
GO
INSERT [dbo].[PrescriptionDetails] ([Id], [AppointmentId], [MedicineId], [Dosage], [StartDate], [EndDate], [Notes]) VALUES (N'b45af2d2-bfe4-47f4-9a07-3a92622c7f2f', N'579aade1-2d38-4292-b372-08dde3d1d403', N'54047cee-990a-49f6-ab7b-92506903ac6f', N'', CAST(N'2025-08-14' AS Date), CAST(N'2025-08-15' AS Date), N'')
GO
INSERT [dbo].[PrescriptionDetails] ([Id], [AppointmentId], [MedicineId], [Dosage], [StartDate], [EndDate], [Notes]) VALUES (N'cec03626-6a1a-43c4-b582-4e04a7775951', N'9606180e-e8f7-4e86-9ddf-6b73aafb93dc', N'6e60560e-eeac-4752-a68b-aa4e3a701cac', N'', NULL, NULL, N'')
GO
INSERT [dbo].[PrescriptionDetails] ([Id], [AppointmentId], [MedicineId], [Dosage], [StartDate], [EndDate], [Notes]) VALUES (N'1a99ea95-5359-4ba5-aba0-4fdaa97c7119', N'31048878-167e-42b1-8d60-9f9436cbba9e', N'd134a67f-5bc7-44ba-aaae-511c5aad8bc8', N'400mg', CAST(N'2025-08-27' AS Date), CAST(N'2025-08-28' AS Date), N'note')
GO
INSERT [dbo].[PrescriptionDetails] ([Id], [AppointmentId], [MedicineId], [Dosage], [StartDate], [EndDate], [Notes]) VALUES (N'5cda233a-19db-4e3e-9bf7-5873dab2a25f', N'8a62071e-e2c3-44ed-9d13-5488539e86aa', N'6e60560e-eeac-4752-a68b-aa4e3a701cac', N'400 mg', CAST(N'2025-08-29' AS Date), CAST(N'2025-09-06' AS Date), N'')
GO
INSERT [dbo].[PrescriptionDetails] ([Id], [AppointmentId], [MedicineId], [Dosage], [StartDate], [EndDate], [Notes]) VALUES (N'c26aedf6-28af-4c76-b3cd-62030e51e44f', N'579aade1-2d38-4292-b372-08dde3d1d403', N'6e60560e-eeac-4752-a68b-aa4e3a701cac', N'', NULL, NULL, N'')
GO
INSERT [dbo].[PrescriptionDetails] ([Id], [AppointmentId], [MedicineId], [Dosage], [StartDate], [EndDate], [Notes]) VALUES (N'faaf9102-1490-444d-b803-628bd199fec6', N'94dcdf90-c517-4e1f-ae8b-c662c129eb6e', N'54047cee-990a-49f6-ab7b-92506903ac6f', N'400 mg', CAST(N'2025-08-28' AS Date), CAST(N'2025-08-29' AS Date), N'')
GO
INSERT [dbo].[PrescriptionDetails] ([Id], [AppointmentId], [MedicineId], [Dosage], [StartDate], [EndDate], [Notes]) VALUES (N'272d3700-2d1d-4cd1-b2bf-63df6fca9c79', N'9606180e-e8f7-4e86-9ddf-6b73aafb93dc', N'54047cee-990a-49f6-ab7b-92506903ac6f', N'500 mg', CAST(N'2025-08-22' AS Date), CAST(N'2025-09-05' AS Date), N'')
GO
INSERT [dbo].[PrescriptionDetails] ([Id], [AppointmentId], [MedicineId], [Dosage], [StartDate], [EndDate], [Notes]) VALUES (N'954d3e0b-2cae-4306-a78f-6b2ce2b0e326', N'32c71013-3496-49e4-92b2-d3af95b9a235', N'54047cee-990a-49f6-ab7b-92506903ac6f', N'600 mg', CAST(N'2025-08-26' AS Date), CAST(N'2025-09-06' AS Date), N'')
GO
INSERT [dbo].[PrescriptionDetails] ([Id], [AppointmentId], [MedicineId], [Dosage], [StartDate], [EndDate], [Notes]) VALUES (N'239662e5-2d58-43c1-a5f9-80652b63ee31', N'13ba63c7-4e80-415a-8289-93558265f122', N'd134a67f-5bc7-44ba-aaae-511c5aad8bc8', N'10mg', CAST(N'2025-08-07' AS Date), CAST(N'2025-09-05' AS Date), N'')
GO
INSERT [dbo].[PrescriptionDetails] ([Id], [AppointmentId], [MedicineId], [Dosage], [StartDate], [EndDate], [Notes]) VALUES (N'da1ff28b-8dc5-4584-bb02-869254866863', N'39b198ea-e8de-46bb-880f-f4dd1b71ffb4', N'6e60560e-eeac-4752-a68b-aa4e3a701cac', N'100 mg', CAST(N'2025-08-28' AS Date), CAST(N'2025-08-30' AS Date), N'')
GO
INSERT [dbo].[PrescriptionDetails] ([Id], [AppointmentId], [MedicineId], [Dosage], [StartDate], [EndDate], [Notes]) VALUES (N'5ebc4054-a153-42a9-b9d5-86cd0f549b5e', N'32c71013-3496-49e4-92b2-d3af95b9a235', N'6e60560e-eeac-4752-a68b-aa4e3a701cac', N'500 mg', NULL, NULL, N'')
GO
INSERT [dbo].[PrescriptionDetails] ([Id], [AppointmentId], [MedicineId], [Dosage], [StartDate], [EndDate], [Notes]) VALUES (N'b68ac3cf-103b-4fb6-aaef-8f830e731dbb', N'7cb1b17b-b8d1-4e4f-8003-917f1d4bc3a0', N'd134a67f-5bc7-44ba-aaae-511c5aad8bc8', N'', CAST(N'2025-08-28' AS Date), CAST(N'2025-09-05' AS Date), N'')
GO
INSERT [dbo].[PrescriptionDetails] ([Id], [AppointmentId], [MedicineId], [Dosage], [StartDate], [EndDate], [Notes]) VALUES (N'1a21b846-2037-427b-a1ca-957c50d8bd18', N'579aade1-2d38-4292-b372-08dde3d1d403', N'd134a67f-5bc7-44ba-aaae-511c5aad8bc8', N'', NULL, NULL, N'')
GO
INSERT [dbo].[PrescriptionDetails] ([Id], [AppointmentId], [MedicineId], [Dosage], [StartDate], [EndDate], [Notes]) VALUES (N'753c208f-3246-4fd6-9fb4-96ff205dc2ba', N'7985ee31-e3c6-403d-a2d5-cb75138a2c03', N'54047cee-990a-49f6-ab7b-92506903ac6f', N'', NULL, NULL, N'')
GO
INSERT [dbo].[PrescriptionDetails] ([Id], [AppointmentId], [MedicineId], [Dosage], [StartDate], [EndDate], [Notes]) VALUES (N'22c88a8b-632b-4436-8809-a21c38753b5e', N'31048878-167e-42b1-8d60-9f9436cbba9e', N'6e60560e-eeac-4752-a68b-aa4e3a701cac', N'', NULL, NULL, N'')
GO
INSERT [dbo].[PrescriptionDetails] ([Id], [AppointmentId], [MedicineId], [Dosage], [StartDate], [EndDate], [Notes]) VALUES (N'433d744b-9df3-4031-8ada-b9c371cca791', N'13ba63c7-4e80-415a-8289-93558265f122', N'd134a67f-5bc7-44ba-aaae-511c5aad8bc8', N'400mg', NULL, NULL, N'')
GO
INSERT [dbo].[PrescriptionDetails] ([Id], [AppointmentId], [MedicineId], [Dosage], [StartDate], [EndDate], [Notes]) VALUES (N'14e79da6-f9e2-4301-9cab-bd8e2bcc8111', N'4760bfcc-8fe5-458d-ab79-984b602b670f', N'54047cee-990a-49f6-ab7b-92506903ac6f', N'20gm', NULL, NULL, N'')
GO
INSERT [dbo].[PrescriptionDetails] ([Id], [AppointmentId], [MedicineId], [Dosage], [StartDate], [EndDate], [Notes]) VALUES (N'81a25d1e-179f-480d-bcca-c0ed3ce15116', N'13ba63c7-4e80-415a-8289-93558265f122', N'54047cee-990a-49f6-ab7b-92506903ac6f', N'200mg', CAST(N'2025-08-26' AS Date), CAST(N'2025-09-05' AS Date), N'')
GO
INSERT [dbo].[PrescriptionDetails] ([Id], [AppointmentId], [MedicineId], [Dosage], [StartDate], [EndDate], [Notes]) VALUES (N'a147e3d5-69d7-41c1-89c7-cd9958db874b', N'94dcdf90-c517-4e1f-ae8b-c662c129eb6e', N'd134a67f-5bc7-44ba-aaae-511c5aad8bc8', N'300 mg', CAST(N'2025-08-27' AS Date), CAST(N'2025-09-05' AS Date), N'')
GO
INSERT [dbo].[PrescriptionDetails] ([Id], [AppointmentId], [MedicineId], [Dosage], [StartDate], [EndDate], [Notes]) VALUES (N'c7270590-725a-4d57-be29-cfb38e435878', N'39b198ea-e8de-46bb-880f-f4dd1b71ffb4', N'd134a67f-5bc7-44ba-aaae-511c5aad8bc8', N'400mg', CAST(N'2025-08-27' AS Date), CAST(N'2025-08-28' AS Date), N'note')
GO
INSERT [dbo].[PrescriptionDetails] ([Id], [AppointmentId], [MedicineId], [Dosage], [StartDate], [EndDate], [Notes]) VALUES (N'3420788b-3adc-4aed-bc50-d68209f2f6c9', N'94dcdf90-c517-4e1f-ae8b-c662c129eb6e', N'54047cee-990a-49f6-ab7b-92506903ac6f', N'700 mg', CAST(N'2025-08-30' AS Date), CAST(N'2025-08-30' AS Date), N'note')
GO
INSERT [dbo].[PrescriptionDetails] ([Id], [AppointmentId], [MedicineId], [Dosage], [StartDate], [EndDate], [Notes]) VALUES (N'492202ad-d6b5-4f16-b390-e1235b5227da', N'e4fb2c27-f292-4311-a5c3-12fdf9d1c079', N'54047cee-990a-49f6-ab7b-92506903ac6f', N'500 mg', CAST(N'2025-08-22' AS Date), CAST(N'2025-09-05' AS Date), N'')
GO
INSERT [dbo].[PrescriptionDetails] ([Id], [AppointmentId], [MedicineId], [Dosage], [StartDate], [EndDate], [Notes]) VALUES (N'971ae0ff-fde5-4081-b725-e722eb75fdb0', N'13ba63c7-4e80-415a-8289-93558265f122', N'6e60560e-eeac-4752-a68b-aa4e3a701cac', N'300 mg', CAST(N'2025-08-25' AS Date), CAST(N'2025-09-05' AS Date), N'')
GO
INSERT [dbo].[PrescriptionDetails] ([Id], [AppointmentId], [MedicineId], [Dosage], [StartDate], [EndDate], [Notes]) VALUES (N'306c3a7b-1d26-477b-afdd-f479d4c78394', N'4760bfcc-8fe5-458d-ab79-984b602b670f', N'd134a67f-5bc7-44ba-aaae-511c5aad8bc8', N'400 mg', CAST(N'2025-08-27' AS Date), CAST(N'2025-08-28' AS Date), N'')
GO
/****** Object:  Index [IX_Appointments_PatientId]    Script Date: 8/27/2025 12:42:46 AM ******/
CREATE NONCLUSTERED INDEX [IX_Appointments_PatientId] ON [dbo].[Appointments]
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Appointments_Search]    Script Date: 8/27/2025 12:42:46 AM ******/
CREATE NONCLUSTERED INDEX [IX_Appointments_Search] ON [dbo].[Appointments]
(
	[DoctorId] ASC,
	[PatientId] ASC,
	[AppointmentDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PrescriptionDetails_Appointment]    Script Date: 8/27/2025 12:42:46 AM ******/
CREATE NONCLUSTERED INDEX [IX_PrescriptionDetails_Appointment] ON [dbo].[PrescriptionDetails]
(
	[AppointmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PrescriptionDetails_MedicineId]    Script Date: 8/27/2025 12:42:46 AM ******/
CREATE NONCLUSTERED INDEX [IX_PrescriptionDetails_MedicineId] ON [dbo].[PrescriptionDetails]
(
	[MedicineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Appointments] ADD  DEFAULT (sysutcdatetime()) FOR [CreatedUtc]
GO
ALTER TABLE [dbo].[Doctors] ADD  DEFAULT (sysutcdatetime()) FOR [CreatedUtc]
GO
ALTER TABLE [dbo].[Medicines] ADD  DEFAULT (sysutcdatetime()) FOR [CreatedUtc]
GO
ALTER TABLE [dbo].[Patients] ADD  DEFAULT (sysutcdatetime()) FOR [CreatedUtc]
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD  CONSTRAINT [FK_Appointments_Doctor] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Doctors] ([Id])
GO
ALTER TABLE [dbo].[Appointments] CHECK CONSTRAINT [FK_Appointments_Doctor]
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD  CONSTRAINT [FK_Appointments_Patient] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patients] ([Id])
GO
ALTER TABLE [dbo].[Appointments] CHECK CONSTRAINT [FK_Appointments_Patient]
GO
ALTER TABLE [dbo].[PrescriptionDetails]  WITH CHECK ADD  CONSTRAINT [FK_PrescriptionDetails_Appointment] FOREIGN KEY([AppointmentId])
REFERENCES [dbo].[Appointments] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PrescriptionDetails] CHECK CONSTRAINT [FK_PrescriptionDetails_Appointment]
GO
ALTER TABLE [dbo].[PrescriptionDetails]  WITH CHECK ADD  CONSTRAINT [FK_PrescriptionDetails_Medicine] FOREIGN KEY([MedicineId])
REFERENCES [dbo].[Medicines] ([Id])
GO
ALTER TABLE [dbo].[PrescriptionDetails] CHECK CONSTRAINT [FK_PrescriptionDetails_Medicine]
GO
/****** Object:  StoredProcedure [dbo].[spGetAppointmentById]    Script Date: 8/27/2025 12:42:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Opi Barua
-- Create date: 24 August, 2025
-- Description:	Get Medical appointment By id
-- =============================================
CREATE PROCEDURE [dbo].[spGetAppointmentById]
    @Id UNIQUEIDENTIFIER
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        A.Id,
        A.PatientId,
		p.FullName AS PatientName,
		p.Email AS PatientEmail,
        A.DoctorId,
		D.FullName AS DoctorName,
        A.AppointmentDate,
        A.VisitType,
        A.Diagnosis,
        A.Notes,
        (
            SELECT 
                PD.Id,
                PD.MedicineId,
				M.Name AS MedicineName,
                PD.Dosage,
                PD.StartDate,
                PD.EndDate,
                PD.Notes
            FROM PrescriptionDetails PD
			INNER JOIN Medicines M ON M.Id = PD.MedicineId
            WHERE PD.AppointmentId = A.Id
            FOR JSON PATH
        ) AS PrescriptionDetails
    FROM Appointments A
	INNER JOIN Doctors D ON d.Id = A.DoctorId
	INNER JOIN Patients P ON P.Id = A.PatientId
    WHERE A.Id = @Id
END;
GO
/****** Object:  StoredProcedure [dbo].[spGetAppointments]    Script Date: 8/27/2025 12:42:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Opi Barua
-- Create date: 24 August, 2025
-- Description:	Get Medical appointments list
-- =============================================
CREATE PROCEDURE [dbo].[spGetAppointments]
    @pageNo INT,
    @pageSize INT,
    @searchValue NVARCHAR(100) = NULL,
    @doctorId UNIQUEIDENTIFIER = NULL,
    @visitType NVARCHAR(50) = NULL,
    @recordsFiltered INT OUTPUT,
    @recordsTotal INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    -- Temporary result set for filtering
    ;WITH FilteredAppointments AS
    (
        SELECT 
            A.Id,
            p.FullName AS PatientName,
            D.FullName AS DoctorName,
            A.DoctorId,
            A.AppointmentDate,
            A.VisitType,
			A.Diagnosis,
            ROW_NUMBER() OVER (ORDER BY A.AppointmentDate DESC) AS RowNum
        FROM Appointments A
        INNER JOIN Doctors D ON A.DoctorId = D.Id
		INNER JOIN Patients p ON A.PatientId = p.Id
        WHERE
            (@doctorId IS NULL OR A.DoctorId = @doctorId)
			AND (@visitType IS NULL OR A.VisitType = @visitType)
            AND (
                @searchValue IS NULL
                OR p.FullName LIKE '%' + @searchValue + '%'
                OR D.FullName LIKE '%' + @searchValue + '%'
				OR A.VisitType LIKE '%' + @searchValue + '%'
				OR A.Diagnosis LIKE '%' + @searchValue + '%'
            )
    )

    SELECT 
        Id,
        PatientName,
        AppointmentDate,
        DoctorId,
        DoctorName,
        VisitType,
		Diagnosis
    FROM FilteredAppointments
    WHERE RowNum BETWEEN ((@pageNo - 1) * @pageSize + 1) AND (@pageNo * @pageSize);

    -- Get Filtered rows for pagination
    SELECT @recordsFiltered = COUNT(1)
    FROM Appointments A
    INNER JOIN Doctors D ON A.DoctorId = D.Id
	INNER JOIN Patients p ON A.PatientId = p.Id
    WHERE
        (@doctorId IS NULL OR A.DoctorId = @doctorId)
		AND (@visitType IS NULL OR A.VisitType = @visitType)
        AND (
            @searchValue IS NULL
            OR p.FullName LIKE '%' + @searchValue + '%'
            OR D.FullName LIKE '%' + @searchValue + '%'
			OR A.VisitType LIKE '%' + @searchValue + '%'
			OR A.Diagnosis LIKE '%' + @searchValue + '%'
        );

    -- Get Total rows for pagination
    SELECT @recordsTotal = COUNT(1) FROM Appointments

END;
GO

