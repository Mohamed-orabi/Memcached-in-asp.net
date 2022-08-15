DECLARE @name AS NVARCHAR(MAX);
SET @name = (SELECT CONCAT(N'IntranetV3_', FORMAT(GETDATE(),'MM'), FORMAT(GETDATE(),'dd'), FORMAT(GETDATE(),'yyyy'), '_Backup'));
DECLARE @createATMDataTableStatment AS NVARCHAR(MAX);
set @createATMDataTableStatment = 'USE ' + QUOTENAME(@name) + N'; CREATE TABLE [dbo].[ATM_DATA](
	[SerialNo] [int] NOT NULL,
	[ATM_ID] [nvarchar](50) NULL,
	[Date_opened] [nvarchar](50) NULL,
	[Time_Open] [nvarchar](50) NULL,
	[Date_Finished] [nvarchar](50) NULL,
	[Time_Finished] [nvarchar](50) NULL,
	[Date_Dispatch_FLM] [nvarchar](50) NULL,
	[Time_Dispatch_FLM] [nvarchar](50) NULL,
	[ETA_Dispatch_FLM] [nvarchar](50) NULL,
	[Date_Arrived_FLM] [nvarchar](50) NULL,
	[Time_Arrived_FLM] [nvarchar](50) NULL,
	[Date_Dispatch_SLM] [nvarchar](50) NULL,
	[Time_Dispatch_SLM] [nvarchar](50) NULL,
	[Date_Arrived_SLM] [nvarchar](50) NULL,
	[Time_Arrived_SLM] [nvarchar](50) NULL,
	[Engineer_Name] [nvarchar](50) NULL,
	[Technician_Name] [nvarchar](50) NULL,
	[ActionID] [int] NULL,
	[Communication_Call_NO] [nvarchar](50) NULL,
	[Maintenance_Call_NO] [nvarchar](50) NULL,
	[Description_Notes] [nvarchar](max) NULL,
	[Opened_by] [nvarchar](50) NULL,
	[Closed_By] [nvarchar](50) NULL,
	[FLM_Date] [nvarchar](50) NULL,
	[FLM_TimeOpen] [nvarchar](50) NULL,
	[FLM_EArrivalDate] [nvarchar](50) NULL,
	[FLM_EArrivalTime] [nvarchar](50) NULL,
	[FLM_ActionID] [int] NULL,
	[FLM_VisitNo] [nvarchar](50) NULL,
	[Technician_No] [nvarchar](50) NULL,
	[SLM_Date] [nvarchar](50) NULL,
	[SLM_TimeOpen] [nvarchar](50) NULL,
	[SLM_EArrivalDate] [nvarchar](50) NULL,
	[SLM_EArrivalTime] [nvarchar](50) NULL,
	[SLM_ActionID] [int] NULL,
	[TicketNo] [nvarchar](50) NULL,
	[FLM_PenaltyTime] [nvarchar](50) NULL,
	[SLM_PenaltyTime] [nvarchar](50) NULL,
	[Down_Time_Duration] [nvarchar](50) NULL,
	[OtherMainReasonDesc] [nvarchar](max) NULL,
	[MainReasonID] [int] NULL,
	[FlagColor] [bit] NULL,
	[FlagColorBy] [nvarchar](50) NULL,
	[FlagColorRegDate] [datetime] NULL,
	[FlagReason] [bit] NULL,
	[FlagReasonBy] [nvarchar](50) NULL,
	[FlagReasonRegDate] [datetime] NULL,
	[AS400Date] [nvarchar](50) NULL,
	[AS400Time] [nvarchar](50) NULL,
	[ATMSerialNumber] [nvarchar](250) NULL)';
DECLARE @createATM_Data_CIT_Statment AS NVARCHAR(MAX);
set @createATM_Data_CIT_Statment = 'USE ' + QUOTENAME(@name) + N'CREATE TABLE [dbo].[ATM_Data_CIT](
	[SN] [numeric](38, 0) NOT NULL,
	[ATMdataSN] [int] NOT NULL,
	[RegDateInTable] [datetime] NULL,
	[Tbl_ID] [numeric](38, 0) NOT NULL)';
DECLARE @createATM_Data_ItalianSecurity_Statment AS NVARCHAR(MAX);
set @createATM_Data_ItalianSecurity_Statment = 'USE ' + QUOTENAME(@name) + N'CREATE TABLE [dbo].[ATM_Data_ItalianSecurity](
	[Tbl_ID] [int] NOT NULL,
	[SN] [numeric](38, 0) NOT NULL,
	[ATMdataSN] [int] NOT NULL,
	[RegDateInTable] [datetime] NULL)';
DECLARE @createATM_Data_Reasons_Statment AS NVARCHAR(MAX);
set @createATM_Data_Reasons_Statment = 'USE ' + QUOTENAME(@name) + N'CREATE TABLE [dbo].[ATM_DATA_Reasons](
	[ATM_Data_SerialNo] [int] NOT NULL,
	[SubReasonID] [int] NOT NULL,
	[MainReasonID] [int] NOT NULL)';
DECLARE @createATM_Data_Target_Statment AS NVARCHAR(MAX);
set @createATM_Data_Target_Statment = 'USE ' + QUOTENAME(@name) + N'CREATE TABLE [dbo].[ATM_Data_Target](
	[SN] [numeric](38, 0) NOT NULL,
	[ATMdataSN] [int] NOT NULL,
	[RegDateInTable] [datetime] NULL,
	[Tbl_ID] [numeric](38, 0) NOT NULL)';
DECLARE @createATM_Data_Tiba2000_Statment AS NVARCHAR(MAX);
set @createATM_Data_Tiba2000_Statment = 'USE ' + QUOTENAME(@name) + N'CREATE TABLE [dbo].[ATM_Data_Tiba2000](
	[SN] [numeric](38, 0) NOT NULL,
	[ATMdataSN] [int] NOT NULL,
	[RegDateInTable] [datetime] NULL,
	[Tbl_ID] [numeric](38, 0) NOT NULL)';
DECLARE @createATM_DATAResponse_Statment AS NVARCHAR(MAX);
set @createATM_DATAResponse_Statment = 'USE ' + QUOTENAME(@name) + N'CREATE TABLE [dbo].[ATM_DATAResponse](
	[ResponseNo] [int] NOT NULL,
	[ResponseMessage] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedDate] [nvarchar](50) NULL,
	[SerialNo] [int] NULL)';

IF NOT EXISTS(SELECT * FROM sys.databases WHERE NAME = @name)
BEGIN
	EXEC('CREATE DATABASE '+@name);
	EXEC(@createATMDataTableStatment);
	EXEC(@createATM_Data_CIT_Statment);
	EXEC(@createATM_Data_ItalianSecurity_Statment);
	EXEC(@createATM_Data_Reasons_Statment);
	EXEC(@createATM_Data_Target_Statment);
	EXEC(@createATM_Data_Tiba2000_Statment);
	EXEC(@createATM_DATAResponse_Statment);
END
