USE [master]
GO
/****** Object:  Database [CompanyDb]    Script Date: 27-03-2020 21:37:49 ******/
CREATE DATABASE [CompanyDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CompanyDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\CompanyDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CompanyDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\CompanyDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [CompanyDb] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CompanyDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CompanyDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CompanyDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CompanyDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CompanyDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CompanyDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [CompanyDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CompanyDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CompanyDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CompanyDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CompanyDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CompanyDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CompanyDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CompanyDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CompanyDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CompanyDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CompanyDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CompanyDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CompanyDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CompanyDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CompanyDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CompanyDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CompanyDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CompanyDb] SET RECOVERY FULL 
GO
ALTER DATABASE [CompanyDb] SET  MULTI_USER 
GO
ALTER DATABASE [CompanyDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CompanyDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CompanyDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CompanyDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CompanyDb] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CompanyDb', N'ON'
GO
ALTER DATABASE [CompanyDb] SET QUERY_STORE = OFF
GO
USE [CompanyDb]
GO
/****** Object:  Table [dbo].[BusinessUnits]    Script Date: 27-03-2020 21:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusinessUnits](
	[BusinessUnitId] [int] IDENTITY(1,1) NOT NULL,
	[BusinessUnitName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_BusinessUnits] PRIMARY KEY CLUSTERED 
(
	[BusinessUnitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 27-03-2020 21:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeName] [varchar](50) NOT NULL,
	[BusinessUnitId] [int] NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Projects]    Script Date: 27-03-2020 21:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projects](
	[ProjectId] [int] IDENTITY(1,1) NOT NULL,
	[ProjectName] [varchar](50) NOT NULL,
	[BusinessUnitId] [int] NOT NULL,
 CONSTRAINT [PK_Projects] PRIMARY KEY CLUSTERED 
(
	[ProjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Project_Employees]    Script Date: 27-03-2020 21:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project_Employees](
	[ProjectEmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[ProjectId] [int] NOT NULL,
	[EmployeeId] [int] NOT NULL,
 CONSTRAINT [PK_Project_Employees] PRIMARY KEY CLUSTERED 
(
	[ProjectEmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vEmployees]    Script Date: 27-03-2020 21:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vEmployees]
AS
SELECT dbo.Employees.EmployeeName, dbo.Projects.ProjectName, dbo.BusinessUnits.BusinessUnitName
FROM     dbo.BusinessUnits INNER JOIN
                  dbo.Employees ON dbo.BusinessUnits.BusinessUnitId = dbo.Employees.BusinessUnitId INNER JOIN
                  dbo.Projects ON dbo.BusinessUnits.BusinessUnitId = dbo.Projects.BusinessUnitId INNER JOIN
                  dbo.Project_Employees ON dbo.Employees.EmployeeId = dbo.Project_Employees.EmployeeId AND dbo.Projects.ProjectId = dbo.Project_Employees.ProjectId
GO
/****** Object:  Table [dbo].[ProjectManagers]    Script Date: 27-03-2020 21:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectManagers](
	[ProjectManagerId] [int] IDENTITY(1,1) NOT NULL,
	[ProjectEmployeeId] [int] NOT NULL,
	[ProjectId] [int] NOT NULL,
 CONSTRAINT [PK_ProjectManagers] PRIMARY KEY CLUSTERED 
(
	[ProjectManagerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vProjectManagers]    Script Date: 27-03-2020 21:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vProjectManagers]
AS
SELECT dbo.Employees.EmployeeName, dbo.Projects.ProjectName, dbo.BusinessUnits.BusinessUnitName
FROM     dbo.Employees INNER JOIN
                  dbo.Project_Employees ON dbo.Employees.EmployeeId = dbo.Project_Employees.EmployeeId INNER JOIN
                  dbo.Projects ON dbo.Project_Employees.ProjectId = dbo.Projects.ProjectId INNER JOIN
                  dbo.BusinessUnits ON dbo.Employees.BusinessUnitId = dbo.BusinessUnits.BusinessUnitId AND dbo.Projects.BusinessUnitId = dbo.BusinessUnits.BusinessUnitId INNER JOIN
                  dbo.ProjectManagers ON dbo.Project_Employees.ProjectEmployeeId = dbo.ProjectManagers.ProjectEmployeeId AND dbo.Projects.ProjectId = dbo.ProjectManagers.ProjectId
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_BusinessUnits] FOREIGN KEY([BusinessUnitId])
REFERENCES [dbo].[BusinessUnits] ([BusinessUnitId])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_BusinessUnits]
GO
ALTER TABLE [dbo].[Project_Employees]  WITH CHECK ADD  CONSTRAINT [FK_Project_Employees_Employees] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([EmployeeId])
GO
ALTER TABLE [dbo].[Project_Employees] CHECK CONSTRAINT [FK_Project_Employees_Employees]
GO
ALTER TABLE [dbo].[Project_Employees]  WITH CHECK ADD  CONSTRAINT [FK_Project_Employees_Projects] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Projects] ([ProjectId])
GO
ALTER TABLE [dbo].[Project_Employees] CHECK CONSTRAINT [FK_Project_Employees_Projects]
GO
ALTER TABLE [dbo].[ProjectManagers]  WITH CHECK ADD  CONSTRAINT [FK_ProjectManagers_Project_Employees] FOREIGN KEY([ProjectEmployeeId])
REFERENCES [dbo].[Project_Employees] ([ProjectEmployeeId])
GO
ALTER TABLE [dbo].[ProjectManagers] CHECK CONSTRAINT [FK_ProjectManagers_Project_Employees]
GO
ALTER TABLE [dbo].[ProjectManagers]  WITH CHECK ADD  CONSTRAINT [FK_ProjectManagers_Projects] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Projects] ([ProjectId])
GO
ALTER TABLE [dbo].[ProjectManagers] CHECK CONSTRAINT [FK_ProjectManagers_Projects]
GO
ALTER TABLE [dbo].[Projects]  WITH CHECK ADD  CONSTRAINT [FK_Projects_BusinessUnits] FOREIGN KEY([BusinessUnitId])
REFERENCES [dbo].[BusinessUnits] ([BusinessUnitId])
GO
ALTER TABLE [dbo].[Projects] CHECK CONSTRAINT [FK_Projects_BusinessUnits]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "BusinessUnits"
            Begin Extent = 
               Top = 0
               Left = 391
               Bottom = 119
               Right = 608
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Employees"
            Begin Extent = 
               Top = 36
               Left = 902
               Bottom = 177
               Right = 1103
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Projects"
            Begin Extent = 
               Top = 31
               Left = 76
               Bottom = 194
               Right = 289
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Project_Employees"
            Begin Extent = 
               Top = 131
               Left = 532
               Bottom = 272
               Right = 752
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vEmployees'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'= 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vEmployees'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vEmployees'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Employees"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 148
               Right = 249
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Projects"
            Begin Extent = 
               Top = 120
               Left = 582
               Bottom = 283
               Right = 795
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "BusinessUnits"
            Begin Extent = 
               Top = 179
               Left = 268
               Bottom = 298
               Right = 485
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ProjectManagers"
            Begin Extent = 
               Top = 0
               Left = 834
               Bottom = 141
               Right = 1054
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Project_Employees"
            Begin Extent = 
               Top = 13
               Left = 299
               Bottom = 154
               Right = 519
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
  ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vProjectManagers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'       Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vProjectManagers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vProjectManagers'
GO
USE [master]
GO
ALTER DATABASE [CompanyDb] SET  READ_WRITE 
GO
