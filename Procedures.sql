--my procedures


use VehicleSystem
go


CREATE PROCEDURE insertVehicle
	-- Add the parameters for the stored procedure here
	@Model  varchar(20), 
	@Type varchar(20),
	@LicenceNo int, 
	@Vyear char(4) ,
	@Vimage Image,
	@Cost int,
	@Location varchar(40),
	@Duration date,
	@rent_SSN INT 
AS
BEGIN
INSERT INTO RenterVehicle
Values (@Model,@Type,@LicenceNo,@Vyear,@Vimage,@Cost,@Location,@Duration,@rent_SSN,'1')
END
GO


CREATE PROCEDURE insertReport
	-- Add the parameters for the stored procedure here
	@OrderNo int, 
	@Data varchar(500),
	@RepoSSN int, 
	@RorL char(1) ,
	@ReportTitle varchar(15)
	
AS
BEGIN
INSERT INTO Report
Values (@OrderNo,@Data,@RepoSSn,@RorL,@ReportTitle)
END
GO

CREATE PROCEDURE UpdateVehicle
	-- Add the parameters for the stored procedure here
	@licenceNo int,
	@Cost int, 
	@Duration date
	
AS
BEGIN
UPDATE Vehicle
SET  Duration=@Duration , Cost=@Cost
WHERE LicenceNo=@licenceNo
END
GO 


CREATE PROCEDURE ShowInformations
	-- Add the parameters for the stored procedure here
	@RSSN INT
	
AS
BEGIN                                                                         
SELECT DISTINCT LicenceNo, StartDate,Dur AS EndDate,Cost,Order_No
FROM  LessorVehicle,Vehicle,Renter
WHERE  rent_SSN=@RSSN AND LicenceNo=Vno
END
GO 

CREATE PROCEDURE CHECK_VEHICLE
@LicenceNo int
AS
BEGIN
SELECT *
FROM RenterVehicle
where LicenceNo=@LicenceNo
END
GO

CREATE PROCEDURE [dbo].[DeleteLessor]
	@LSSN  int 
AS
BEGIN
Delete From Lessor
Where LSSN=@LSSN
END

CREATE PROCEDURE [dbo].[DeleteRenter]
	@RSSN  int 
AS
BEGIN
Delete From Renter
Where RSSN=@RSSN
END

CREATE PROCEDURE [dbo].[getAllReports]

AS
BEGIN
	SELECT *
     From Report
END

ALTER PROCEDURE [dbo].[getLessorSSN]

AS
BEGIN
	SELECT LSSN 
     From Lessor
END

CREATE PROCEDURE [dbo].[getRenterSSN]

AS
BEGIN
	SELECT RSSN 
     From Renter
END


CREATE PROCEDURE [dbo].[get_renter_requests]
AS
BEGIN
SELECT *
From RenterVehicle
END
GO


CREATE PROCEDURE [dbo].[Select_Licence_NO]
AS
BEGIN
SELECT LicenceNo
From Vehicle
END
GO


CREATE PROCEDURE [dbo].[DeleteRequest] @Licence_NO int
AS
BEGIN
Delete From RenterVehicle
where LicenceNo=@Licence_NO
END
GO

CREATE PROCEDURE [dbo].[insertVehicle2]
@Model       varchar(20),
@Type        varchar(20),
@LicenceNo   int,
@Vyear       char(4),
@Vimage      image,
@Cost        int,
@Location    varchar(40),
@Duration    date,
@rent_SSN    int
AS
BEGIN
insert into Vehicle(Model,Type,LicenceNo,Vyear,Vimage,Cost,Location,Duration,rent_SSN,available)
Values (@Model,@Type,@LicenceNo,@Vyear,@Vimage,@Cost,@Location,@Duration,@rent_SSN,'1')
END
GO


CREATE PROCEDURE [dbo].[update_vehicle]
@Licence_no  int
AS
BEGIN
UPDATE Vehicle
SET available = '1'
WHERE LicenceNo=@Licence_no
END
GO


CREATE PROCEDURE [dbo].[Select_vehicle]
AS
BEGIN
SELECT Vno,Dur
From LessorVehicle
END
GO

CREATE PROCEDURE [dbo].[Select_vehicle2]
AS
BEGIN
SELECT LicenceNo,Duration,available
From Vehicle
END
GO

CREATE PROCEDURE [dbo].[update_vehicle2]
@Licence_no  int
AS
BEGIN
UPDATE Vehicle
SET available = '0'
WHERE LicenceNo=@Licence_no
END
GO



