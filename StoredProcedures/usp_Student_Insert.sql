CREATE PROCEDURE [dbo].[usp_Student_Insert]
    @AdmissionNumber       NVARCHAR (30),
    @FirstName             NVARCHAR (100),
    @LastName              NVARCHAR (100) = NULL,
    @Gender                NVARCHAR (10)  = NULL,
    @DateOfBirth           DATE           = NULL,
    @ClassId               INT            = NULL,
    @SectionId             INT            = NULL,
    @RollNumber            NVARCHAR (20)  = NULL,
    @Address               NVARCHAR (500) = NULL,
    @GuardianName          NVARCHAR (150) = NULL,
    @GuardianPhone         NVARCHAR (20)  = NULL,
    @PreviousSchoolName    NVARCHAR (200) = NULL,
    @PreviousSchoolDetails NVARCHAR (MAX) = NULL,
    @UsesBusService        BIT            = 0,
    @BusRouteId            INT            = NULL,
    @AdmissionDate         DATE           = NULL,
    @PhotoUrl              NVARCHAR (500) = NULL,
    @NewId                 INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[Students]
        ([AdmissionNumber], [FirstName], [LastName], [Gender], [DateOfBirth], [ClassId], [SectionId],
         [RollNumber], [Address], [GuardianName], [GuardianPhone], [PreviousSchoolName],
         [PreviousSchoolDetails], [UsesBusService], [BusRouteId], [AdmissionDate], [PhotoUrl])
    VALUES
        (@AdmissionNumber, @FirstName, @LastName, @Gender, @DateOfBirth, @ClassId, @SectionId,
         @RollNumber, @Address, @GuardianName, @GuardianPhone, @PreviousSchoolName,
         @PreviousSchoolDetails, @UsesBusService, @BusRouteId, @AdmissionDate, @PhotoUrl);

    SET @NewId = CAST(SCOPE_IDENTITY() AS INT);
END
