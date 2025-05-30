USE [job]
GO
/****** Object:  Table [dbo].[Applications]    Script Date: 5/26/2025 1:37:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Applications](
	[application_id] [int] IDENTITY(1,1) NOT NULL,
	[job_id] [int] NOT NULL,
	[candidate_id] [int] NOT NULL,
	[application_date] [datetime] NULL,
	[status] [char](1) NULL,
	[resume_file] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[application_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 5/26/2025 1:37:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Job_Postings]    Script Date: 5/26/2025 1:37:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job_Postings](
	[job_id] [int] IDENTITY(1,1) NOT NULL,
	[job_title] [nvarchar](255) NOT NULL,
	[category_id] [int] NULL,
	[salary_min] [decimal](10, 2) NULL,
	[salary_max] [decimal](10, 2) NULL,
	[location] [nvarchar](255) NULL,
	[deadline] [date] NULL,
	[company_name] [nvarchar](255) NULL,
	[company_logo_url] [nvarchar](255) NULL,
	[user_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[job_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Job_Skills]    Script Date: 5/26/2025 1:37:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job_Skills](
	[job_id] [int] NOT NULL,
	[skill_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[job_id] ASC,
	[skill_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 5/26/2025 1:37:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role_User]    Script Date: 5/26/2025 1:37:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_User](
	[user_id] [int] NOT NULL,
	[role_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC,
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Saved_Jobs]    Script Date: 5/26/2025 1:37:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Saved_Jobs](
	[user_id] [int] NOT NULL,
	[job_id] [int] NOT NULL,
	[saved_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC,
	[job_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Skills]    Script Date: 5/26/2025 1:37:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skills](
	[skill_id] [int] IDENTITY(1,1) NOT NULL,
	[skill_name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[skill_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/26/2025 1:37:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](255) NOT NULL,
	[password_hash] [nvarchar](255) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[company_name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([category_id], [category_name]) VALUES (7, N'Bán hàng - Kinh doanh')
INSERT [dbo].[Categories] ([category_id], [category_name]) VALUES (8, N'Bán sỉ - Bán lẻ - Quản lý cửa hàng')
INSERT [dbo].[Categories] ([category_id], [category_name]) VALUES (10, N'Du lịch')
INSERT [dbo].[Categories] ([category_id], [category_name]) VALUES (3, N'Hành chính - Thư ký')
INSERT [dbo].[Categories] ([category_id], [category_name]) VALUES (2, N'Kế toán')
INSERT [dbo].[Categories] ([category_id], [category_name]) VALUES (5, N'Khoa học - Kỹ thuật - IT')
INSERT [dbo].[Categories] ([category_id], [category_name]) VALUES (4, N'Kiểm toán')
INSERT [dbo].[Categories] ([category_id], [category_name]) VALUES (6, N'Marketing')
INSERT [dbo].[Categories] ([category_id], [category_name]) VALUES (9, N'Nghiên cứu sinh')
INSERT [dbo].[Categories] ([category_id], [category_name]) VALUES (1, N'Sư phạm')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Job_Postings] ON 

INSERT [dbo].[Job_Postings] ([job_id], [job_title], [category_id], [salary_min], [salary_max], [location], [deadline], [company_name], [company_logo_url], [user_id]) VALUES (1, N'Nhân Viên Bảo Trì Cơ Khí', 5, CAST(9.50 AS Decimal(10, 2)), CAST(13.00 AS Decimal(10, 2)), N'Bình Dương', CAST(N'2025-06-12' AS Date), N'Công Ty TNHH Cheng Loong Bình Dương Paper', N'/images/logo-company.png', 7)
INSERT [dbo].[Job_Postings] ([job_id], [job_title], [category_id], [salary_min], [salary_max], [location], [deadline], [company_name], [company_logo_url], [user_id]) VALUES (2, N'Kỹ Thuật Viên Điện Công Nghiệp', 5, CAST(9.50 AS Decimal(10, 2)), CAST(13.00 AS Decimal(10, 2)), N'Bình Thạnh', CAST(N'2025-06-12' AS Date), N'Công Ty TNHH Cheng Loong Bình Duong Paper', N'/images/logo-company1.webp', 7)
INSERT [dbo].[Job_Postings] ([job_id], [job_title], [category_id], [salary_min], [salary_max], [location], [deadline], [company_name], [company_logo_url], [user_id]) VALUES (3, N'Nhân Viên IT – Quản Trị Hệ Thống', 5, CAST(9.80 AS Decimal(10, 2)), CAST(13.50 AS Decimal(10, 2)), N'Tây Ninh', CAST(N'2025-06-12' AS Date), N'Công Ty TNHH Cheng Loong Bình Duong Paper', N'/images/logo-company2.png', 7)
INSERT [dbo].[Job_Postings] ([job_id], [job_title], [category_id], [salary_min], [salary_max], [location], [deadline], [company_name], [company_logo_url], [user_id]) VALUES (4, N'Kỹ Thuật Vận Hành Máy Móc', 5, CAST(9.60 AS Decimal(10, 2)), CAST(12.50 AS Decimal(10, 2)), N'Bình Dương', CAST(N'2025-06-12' AS Date), N'Công Ty TNHH Cheng Loong Bình Duong Paper', N'/images/logo-company3.jpg', 7)
INSERT [dbo].[Job_Postings] ([job_id], [job_title], [category_id], [salary_min], [salary_max], [location], [deadline], [company_name], [company_logo_url], [user_id]) VALUES (5, N'Kỹ Sư Điều Khiển Tự Động', 5, CAST(10.50 AS Decimal(10, 2)), CAST(14.00 AS Decimal(10, 2)), N'Đồng Nai', CAST(N'2025-06-12' AS Date), N'Công Ty TNHH Cheng Loong Bình Duong Paper', N'/images/logo-company4.jpg', 7)
INSERT [dbo].[Job_Postings] ([job_id], [job_title], [category_id], [salary_min], [salary_max], [location], [deadline], [company_name], [company_logo_url], [user_id]) VALUES (6, N'Nhân Viên Kiểm Tra Chất Lượng (QA/QC)', 5, CAST(9.30 AS Decimal(10, 2)), CAST(12.80 AS Decimal(10, 2)), N'Bình Dương', CAST(N'2025-06-12' AS Date), N'Công Ty TNHH Cheng Loong Bình Duong Paper', N'/images/logo-company5.png', 7)
INSERT [dbo].[Job_Postings] ([job_id], [job_title], [category_id], [salary_min], [salary_max], [location], [deadline], [company_name], [company_logo_url], [user_id]) VALUES (7, N'Nhân Viên Bảo Trì Máy Cơ Khí', 5, CAST(9.70 AS Decimal(10, 2)), CAST(13.20 AS Decimal(10, 2)), N'Cà Mau', CAST(N'2025-06-12' AS Date), N'Công Ty TNHH Cheng Loong Bình Duong Paper', N'/images/logo-company6.png', 7)
INSERT [dbo].[Job_Postings] ([job_id], [job_title], [category_id], [salary_min], [salary_max], [location], [deadline], [company_name], [company_logo_url], [user_id]) VALUES (8, N'Chuyên Viên Đảm Bảo Chất Lượng', 5, CAST(9.50 AS Decimal(10, 2)), CAST(12.70 AS Decimal(10, 2)), N'Bình Dương', CAST(N'2025-06-12' AS Date), N'Công Ty TNHH Cheng Loong Bình Duong Paper', N'/images/logo-company7.webp', 7)
INSERT [dbo].[Job_Postings] ([job_id], [job_title], [category_id], [salary_min], [salary_max], [location], [deadline], [company_name], [company_logo_url], [user_id]) VALUES (9, N'Nhân Viên QA – Sản Xuất Giấy', 5, CAST(9.40 AS Decimal(10, 2)), CAST(12.40 AS Decimal(10, 2)), N'Bình Dương', CAST(N'2025-06-12' AS Date), N'Công Ty TNHH Cheng Loong Bình Duong Paper', N'/images/logo-company8.png', 7)
SET IDENTITY_INSERT [dbo].[Job_Postings] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (3, N'ADMIN')
INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (2, N'EMPLOYER')
INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (1, N'USER')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
INSERT [dbo].[Role_User] ([user_id], [role_id]) VALUES (1, 1)
INSERT [dbo].[Role_User] ([user_id], [role_id]) VALUES (2, 2)
INSERT [dbo].[Role_User] ([user_id], [role_id]) VALUES (7, 2)
GO
SET IDENTITY_INSERT [dbo].[Skills] ON 

INSERT [dbo].[Skills] ([skill_id], [skill_name]) VALUES (1, N'IT')
INSERT [dbo].[Skills] ([skill_id], [skill_name]) VALUES (3, N'Thợ điện lạnh')
INSERT [dbo].[Skills] ([skill_id], [skill_name]) VALUES (2, N'Thợ Hàn')
SET IDENTITY_INSERT [dbo].[Skills] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([user_id], [username], [password_hash], [email], [company_name]) VALUES (1, N'quan', N'123', N'bestleague07072002@gmail.com', NULL)
INSERT [dbo].[Users] ([user_id], [username], [password_hash], [email], [company_name]) VALUES (2, N'quynh', N'123', N'abc@gmail.com', NULL)
INSERT [dbo].[Users] ([user_id], [username], [password_hash], [email], [company_name]) VALUES (7, N'huy', N'123', N'huy@gmail.com', NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Categori__5189E2555FE5D6A6]    Script Date: 5/26/2025 1:37:48 PM ******/
ALTER TABLE [dbo].[Categories] ADD UNIQUE NONCLUSTERED 
(
	[category_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Role__783254B144235457]    Script Date: 5/26/2025 1:37:48 PM ******/
ALTER TABLE [dbo].[Role] ADD UNIQUE NONCLUSTERED 
(
	[role_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Skills__73C038ADE82F12E9]    Script Date: 5/26/2025 1:37:48 PM ******/
ALTER TABLE [dbo].[Skills] ADD UNIQUE NONCLUSTERED 
(
	[skill_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__AB6E61640894128A]    Script Date: 5/26/2025 1:37:48 PM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__F3DBC5727AF93FAF]    Script Date: 5/26/2025 1:37:48 PM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Applications] ADD  DEFAULT (getdate()) FOR [application_date]
GO
ALTER TABLE [dbo].[Applications] ADD  DEFAULT ('P') FOR [status]
GO
ALTER TABLE [dbo].[Saved_Jobs] ADD  DEFAULT (getdate()) FOR [saved_date]
GO
ALTER TABLE [dbo].[Applications]  WITH CHECK ADD FOREIGN KEY([candidate_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Applications]  WITH CHECK ADD FOREIGN KEY([job_id])
REFERENCES [dbo].[Job_Postings] ([job_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Job_Postings]  WITH CHECK ADD  CONSTRAINT [FK_JobPostings_Category] FOREIGN KEY([category_id])
REFERENCES [dbo].[Categories] ([category_id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Job_Postings] CHECK CONSTRAINT [FK_JobPostings_Category]
GO
ALTER TABLE [dbo].[Job_Skills]  WITH CHECK ADD FOREIGN KEY([job_id])
REFERENCES [dbo].[Job_Postings] ([job_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Job_Skills]  WITH CHECK ADD FOREIGN KEY([skill_id])
REFERENCES [dbo].[Skills] ([skill_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Role_User]  WITH CHECK ADD FOREIGN KEY([role_id])
REFERENCES [dbo].[Role] ([role_id])
GO
ALTER TABLE [dbo].[Role_User]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Saved_Jobs]  WITH CHECK ADD FOREIGN KEY([job_id])
REFERENCES [dbo].[Job_Postings] ([job_id])
GO
ALTER TABLE [dbo].[Saved_Jobs]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Applications]  WITH CHECK ADD CHECK  (([status]='R' OR [status]='A' OR [status]='P'))
GO
