-- SQL Script for two tables with data and Stored Procedure.

DROP PROCEDURE IF EXISTS [dbo].[GetEmployeesWithDepartment]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employee]') AND type in (N'U'))
ALTER TABLE [dbo].[Employee] DROP CONSTRAINT IF EXISTS [FK_Employee_Employee]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employee]') AND type in (N'U'))
ALTER TABLE [dbo].[Employee] DROP CONSTRAINT IF EXISTS [FK_Employee_Department]
GO

DROP TABLE IF EXISTS [dbo].[Employee]
GO
DROP TABLE IF EXISTS [dbo].[Department]
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[ManagerId] [int] NULL,
	[Salary] [int] NOT NULL,
	[Bonus] [numeric](6, 2) NULL,
 CONSTRAINT [PK_Employee_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


SET IDENTITY_INSERT [dbo].[Department] ON 
INSERT [dbo].[Department] ([ID], [Name]) 
VALUES 
(1, N'Computer'),
(2, N'Account'),
(3, N'Engineering'),
(4, N'HR');
SET IDENTITY_INSERT [dbo].[Department] OFF
GO


SET IDENTITY_INSERT [dbo].[Employee] ON 
INSERT [dbo].[Employee] ([ID], [Name], [DepartmentId], [ManagerId], [Salary], [Bonus]) 
VALUES 
(1, N'John', 3, NULL, 25000, NULL),
(2, N'Robert', 3, 1, 15000, NULL),
(3, N'Richard', 2, 2, 10000, NULL),
(4, N'Mark', 2, 3, 7500, NULL),
(5, N'Stefan', 1, 2, 5000, NULL)
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO

ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([ID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Department]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Employee] FOREIGN KEY([ManagerId])
REFERENCES [dbo].[Employee] ([ID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Employee]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[GetEmployeesWithDepartment] 	
	@id INT
AS
BEGIN
	
	SET NOCOUNT ON;

	SELECT [E].*, [D].[Name] AS [Department]
	FROM [dbo].[Employee] [E]
		INNER JOIN [dbo].[Department] [D] ON [E].[DepartmentId] = [D].[Id]
	WHERE [E].[Id] >= @id
END
GO
