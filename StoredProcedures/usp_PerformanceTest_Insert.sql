CREATE PROCEDURE [dbo].[usp_PerformanceTest_Insert]
    @ClassId           INT,
    @SectionId         INT = NULL,
    @SubjectId         INT,
    @TeacherEmployeeId INT,
    @Title             NVARCHAR (200),
    @TestDate          DATE,
    @MaxMarks          DECIMAL (6, 2),
    @NewId             INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[PerformanceTests]
        ([ClassId], [SectionId], [SubjectId], [TeacherEmployeeId], [Title], [TestDate], [MaxMarks])
    VALUES
        (@ClassId, @SectionId, @SubjectId, @TeacherEmployeeId, @Title, @TestDate, @MaxMarks);

    SET @NewId = CAST(SCOPE_IDENTITY() AS INT);
END
