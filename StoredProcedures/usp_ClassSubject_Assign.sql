CREATE PROCEDURE [dbo].[usp_ClassSubject_Assign]
    @ClassId           INT,
    @SubjectId         INT,
    @TeacherEmployeeId INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (SELECT 1 FROM [dbo].[ClassSubjects] WHERE [ClassId] = @ClassId AND [SubjectId] = @SubjectId)
        UPDATE [dbo].[ClassSubjects]
        SET    [TeacherEmployeeId] = @TeacherEmployeeId
        WHERE  [ClassId] = @ClassId AND [SubjectId] = @SubjectId;
    ELSE
        INSERT INTO [dbo].[ClassSubjects] ([ClassId], [SubjectId], [TeacherEmployeeId])
        VALUES (@ClassId, @SubjectId, @TeacherEmployeeId);
END
