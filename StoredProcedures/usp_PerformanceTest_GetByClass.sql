CREATE PROCEDURE [dbo].[usp_PerformanceTest_GetByClass]
    @ClassId           INT = NULL,
    @TeacherEmployeeId INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT  t.[Id],
            t.[ClassId],
            c.[Name]   AS ClassName,
            t.[SectionId],
            sec.[Name] AS SectionName,
            t.[SubjectId],
            sub.[Name] AS SubjectName,
            t.[TeacherEmployeeId],
            LTRIM(RTRIM(e.[FirstName] + N' ' + ISNULL(e.[LastName], N''))) AS TeacherName,
            t.[Title],
            t.[TestDate],
            t.[MaxMarks]
    FROM    [dbo].[PerformanceTests] t
    INNER JOIN [dbo].[Classes]   c   ON c.[Id]   = t.[ClassId]
    INNER JOIN [dbo].[Subjects]  sub ON sub.[Id] = t.[SubjectId]
    INNER JOIN [dbo].[Employees] e   ON e.[Id]   = t.[TeacherEmployeeId]
    LEFT  JOIN [dbo].[Sections]  sec ON sec.[Id] = t.[SectionId]
    WHERE   (@ClassId IS NULL OR t.[ClassId] = @ClassId)
      AND   (@TeacherEmployeeId IS NULL OR t.[TeacherEmployeeId] = @TeacherEmployeeId)
    ORDER BY t.[TestDate] DESC, t.[Title];
END
