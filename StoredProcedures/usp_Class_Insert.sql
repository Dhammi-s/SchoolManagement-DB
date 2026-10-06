CREATE PROCEDURE [dbo].[usp_Class_Insert]
    @Name                    NVARCHAR (50),
    @AcademicYear            NVARCHAR (12),
    @ClassInchargeEmployeeId INT = NULL,
    @NewId                   INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[Classes] ([Name], [AcademicYear], [ClassInchargeEmployeeId])
    VALUES (@Name, @AcademicYear, @ClassInchargeEmployeeId);

    SET @NewId = CAST(SCOPE_IDENTITY() AS INT);
END
