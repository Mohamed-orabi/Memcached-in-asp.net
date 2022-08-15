DECLARE @name AS NVARCHAR(MAX);
SET @name = (SELECT CONCAT(N'IntranetV3_', FORMAT(GETDATE(),'MM'), FORMAT(GETDATE(),'dd'), FORMAT(GETDATE(),'yyyy'), '_Backup'));
DECLARE @condition AS NVARCHAR(MAX);
SET @condition = N'DATEADD(year, 1, atm.Date_Finished) < GETDATE() and atm.Date_Finished  != ''''';
DECLARE @insertIntoATMDATA AS NVARCHAR(MAX);
SET @insertIntoATMDATA = N'insert into '+ @name +N'.dbo.ATM_DATA
select * from IntranetV3.dbo.ATM_DATA atm where '+@condition;

DECLARE @insertIntoATM_CIT AS NVARCHAR(MAX);
SET @insertIntoATM_CIT = N'insert into '+ @name +N'.dbo.ATM_Data_CIT
select cit.* from IntranetV3.dbo.ATM_Data_CIT cit inner join IntranetV3.dbo.ATM_DATA atm  on cit.ATMdataSN = atm.SerialNo  where '+@condition;

DECLARE @insertIntoATM_DATA_Reasons AS NVARCHAR(MAX);
SET @insertIntoATM_DATA_Reasons = N'insert into '+ @name +N'.dbo.ATM_DATA_Reasons
select res.* from IntranetV3.dbo.ATM_DATA_Reasons res inner join IntranetV3.dbo.ATM_DATA atm  on res.ATM_Data_SerialNo = atm.SerialNo  where '+@condition;

DECLARE @insertIntoATM_Data_Target AS NVARCHAR(MAX);
SET @insertIntoATM_Data_Target = N'insert into '+ @name +N'.dbo.ATM_Data_Target
select tar.* from IntranetV3.dbo.ATM_Data_Target tar inner join IntranetV3.dbo.ATM_DATA atm  on tar.ATMdataSN = atm.SerialNo  where '+@condition;

DECLARE @insertIntoATM_Data_Tiba2000 AS NVARCHAR(MAX);
SET @insertIntoATM_Data_Tiba2000 = N'insert into '+ @name +N'.dbo.ATM_Data_Tiba2000
select tiba.* from IntranetV3.dbo.ATM_Data_Tiba2000 tiba inner join IntranetV3.dbo.ATM_DATA atm  on tiba.ATMdataSN = atm.SerialNo  where '+@condition;

DECLARE @insertIntoATM_Data_ItalianSecurity AS NVARCHAR(MAX);
SET @insertIntoATM_Data_ItalianSecurity = N'insert into '+ @name +N'.dbo.ATM_Data_ItalianSecurity
select ita.* from IntranetV3.dbo.ATM_Data_ItalianSecurity ita inner join IntranetV3.dbo.ATM_DATA atm  on ita.ATMdataSN = atm.SerialNo  where '+@condition;

DECLARE @insertIntoATM_DATAResponse AS NVARCHAR(MAX);
SET @insertIntoATM_DATAResponse = N'insert into '+ @name +N'.dbo.ATM_DATAResponse
select resp.* from IntranetV3.dbo.ATM_DATAResponse resp inner join IntranetV3.dbo.ATM_DATA atm  on resp.SerialNo = atm.SerialNo  where '+@condition;
EXEC(@insertIntoATMDATA)
EXEC(@insertIntoATM_CIT)
EXEC(@insertIntoATM_DATA_Reasons)
EXEC(@insertIntoATM_Data_Target)
EXEC(@insertIntoATM_Data_Tiba2000)
EXEC(@insertIntoATM_Data_ItalianSecurity)
EXEC(@insertIntoATM_DATAResponse)