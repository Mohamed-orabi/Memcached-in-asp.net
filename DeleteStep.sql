DECLARE @name AS NVARCHAR(MAX);
SET @name = (SELECT CONCAT(N'IntranetV3_', FORMAT(GETDATE(),'MM'), FORMAT(GETDATE(),'dd'), FORMAT(GETDATE(),'yyyy'), '_Backup'));
DECLARE @condition AS NVARCHAR(MAX);
SET @condition = N'DATEADD(year, 1, atm.Date_Finished) < GETDATE() and atm.Date_Finished  != ''''';
DECLARE @sqlCMD AS NVARCHAR(MAX);
SET @sqlCMD= N'USE '+QUOTENAME(@name)+N';
delete cit  from  IntranetV3.dbo.ATM_Data_CIT cit inner join ATM_DATA atm  on cit.ATMdataSN = atm.SerialNo  where '+@condition+'

delete res from IntranetV3.dbo.ATM_DATA_Reasons res inner join ATM_DATA atm  on res.ATM_Data_SerialNo = atm.SerialNo  where '+@condition+'

delete tar from IntranetV3.dbo.ATM_Data_Target tar inner join ATM_DATA atm  on tar.ATMdataSN = atm.SerialNo  where '+@condition+'

delete tiba from IntranetV3.dbo.ATM_Data_Tiba2000 tiba inner join ATM_DATA atm  on tiba.ATMdataSN = atm.SerialNo  where '+@condition+'

delete ita from IntranetV3.dbo.ATM_Data_ItalianSecurity ita inner join ATM_DATA atm  on ita.ATMdataSN = atm.SerialNo  where '+@condition+'

delete resp from IntranetV3.dbo.ATM_DATAResponse resp inner join ATM_DATA atm  on resp.SerialNo = atm.SerialNo  where '+@condition+'

delete from IntranetV3.dbo.ATM_DATA  where DATEADD(year, 1, Date_Finished) < GETDATE()  and Date_Finished  != ''''';

EXEC(@sqlCMD)