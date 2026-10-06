-- Upserts a student's result for a test.
CREATE PROCEDURE [dbo].[usp_TestResult_Save]
    @PerformanceTestId INT,
    @StudentId         INT,
    @MarksObtained     DECIMAL (6, 2) = NULL,
    @Grade             NVARCHAR (5)   = NULL,
    @Remarks           NVARCHAR (300) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (SELECT 1 FROM [dbo].[TestResults] WHERE [PerformanceTestId] = @PerformanceTestId AND [StudentId] = @StudentId)
        UPDATE [dbo].[TestResults]
        SET    [MarksObtained] = @MarksObtained,
               [Grade]         = @Grade,
               [Remarks]       = @Remarks
        WHERE  [PerformanceTestId] = @PerformanceTestId AND [StudentId] = @StudentId;
    ELSE
        INSERT INTO [dbo].[TestResults] ([PerformanceTestId], [StudentId], [MarksObtained], [Grade], [Remarks])
        VALUES (@PerformanceTestId, @StudentId, @MarksObtained, @Grade, @Remarks);
END
