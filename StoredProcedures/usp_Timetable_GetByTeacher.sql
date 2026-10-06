CREATE PROCEDURE [dbo].[usp_Timetable_GetByTeacher]
    @TeacherEmployeeId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT  t.[Id],
            t.[ClassId],
            c.[Name]     AS ClassName,
            t.[SectionId],
            sec.[Name]   AS SectionName,
            t.[SubjectId],
            s.[Name]     AS SubjectName,
            t.[TeacherEmployeeId],
            t.[DayOfWeek],
            t.[PeriodNumber],
            t.[StartTime],
            t.[EndTime]
    FROM    [dbo].[TimetablePeriods] t
    INNER JOIN [dbo].[Classes]  c   ON c.[Id]   = t.[ClassId]
    INNER JOIN [dbo].[Subjects] s   ON s.[Id]   = t.[SubjectId]
    LEFT  JOIN [dbo].[Sections] sec ON sec.[Id] = t.[SectionId]
    WHERE   t.[TeacherEmployeeId] = @TeacherEmployeeId
    ORDER BY t.[DayOfWeek], t.[PeriodNumber];
END
