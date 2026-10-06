CREATE PROCEDURE [dbo].[usp_Timetable_Insert]
    @ClassId           INT,
    @SectionId         INT = NULL,
    @SubjectId         INT,
    @TeacherEmployeeId INT,
    @DayOfWeek         TINYINT,
    @PeriodNumber      TINYINT,
    @StartTime         TIME (0),
    @EndTime           TIME (0),
    @NewId             INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[TimetablePeriods]
        ([ClassId], [SectionId], [SubjectId], [TeacherEmployeeId], [DayOfWeek], [PeriodNumber], [StartTime], [EndTime])
    VALUES
        (@ClassId, @SectionId, @SubjectId, @TeacherEmployeeId, @DayOfWeek, @PeriodNumber, @StartTime, @EndTime);

    SET @NewId = CAST(SCOPE_IDENTITY() AS INT);
END
