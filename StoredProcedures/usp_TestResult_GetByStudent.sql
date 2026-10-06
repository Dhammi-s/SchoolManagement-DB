-- A student's results across all tests (subject-wise) — for the student portal.
CREATE PROCEDURE [dbo].[usp_TestResult_GetByStudent]
    @StudentId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT  tr.[Id] AS ResultId,
            t.[Id]  AS PerformanceTestId,
            t.[Title],
            t.[TestDate],
            sub.[Name] AS SubjectName,
            t.[MaxMarks],
            tr.[MarksObtained],
            tr.[Grade],
            tr.[Remarks]
    FROM    [dbo].[TestResults] tr
    INNER JOIN [dbo].[PerformanceTests] t   ON t.[Id]   = tr.[PerformanceTestId]
    INNER JOIN [dbo].[Subjects]         sub ON sub.[Id] = t.[SubjectId]
    WHERE   tr.[StudentId] = @StudentId
    ORDER BY t.[TestDate] DESC, sub.[Name];
END
