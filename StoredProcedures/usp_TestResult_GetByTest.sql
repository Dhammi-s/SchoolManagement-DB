-- All students in the test's class, with their result (if entered yet).
CREATE PROCEDURE [dbo].[usp_TestResult_GetByTest]
    @PerformanceTestId INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ClassId INT = (SELECT [ClassId] FROM [dbo].[PerformanceTests] WHERE [Id] = @PerformanceTestId);

    SELECT  s.[Id] AS StudentId,
            LTRIM(RTRIM(s.[FirstName] + N' ' + ISNULL(s.[LastName], N''))) AS StudentName,
            s.[RollNumber],
            tr.[Id] AS ResultId,
            tr.[MarksObtained],
            tr.[Grade],
            tr.[Remarks]
    FROM    [dbo].[Students] s
    LEFT JOIN [dbo].[TestResults] tr
           ON tr.[StudentId] = s.[Id] AND tr.[PerformanceTestId] = @PerformanceTestId
    WHERE   s.[ClassId] = @ClassId
      AND   s.[IsActive] = 1
    ORDER BY s.[RollNumber], s.[FirstName];
END
