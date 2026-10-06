CREATE PROCEDURE [dbo].[usp_FeeStructure_Insert]
    @ClassId      INT = NULL,
    @AcademicYear NVARCHAR (12),
    @Title        NVARCHAR (150),
    @Amount       DECIMAL (10, 2),
    @DueDate      DATE = NULL,
    @NewId        INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[FeeStructures] ([ClassId], [AcademicYear], [Title], [Amount], [DueDate])
    VALUES (@ClassId, @AcademicYear, @Title, @Amount, @DueDate);

    SET @NewId = CAST(SCOPE_IDENTITY() AS INT);
END
