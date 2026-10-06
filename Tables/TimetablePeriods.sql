CREATE TABLE [dbo].[TimetablePeriods]
(
    [Id]                INT          IDENTITY (1, 1) NOT NULL,
    [ClassId]           INT          NOT NULL,
    [SectionId]         INT          NULL,
    [SubjectId]         INT          NOT NULL,
    [TeacherEmployeeId] INT          NOT NULL,
    [DayOfWeek]         TINYINT      NOT NULL, -- 1=Mon ... 7=Sun
    [PeriodNumber]      TINYINT      NOT NULL,
    [StartTime]         TIME (0)     NOT NULL,
    [EndTime]           TIME (0)     NOT NULL,
    CONSTRAINT [PK_TimetablePeriods] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Timetable_Classes] FOREIGN KEY ([ClassId]) REFERENCES [dbo].[Classes] ([Id]),
    CONSTRAINT [FK_Timetable_Sections] FOREIGN KEY ([SectionId]) REFERENCES [dbo].[Sections] ([Id]),
    CONSTRAINT [FK_Timetable_Subjects] FOREIGN KEY ([SubjectId]) REFERENCES [dbo].[Subjects] ([Id]),
    CONSTRAINT [FK_Timetable_Teacher] FOREIGN KEY ([TeacherEmployeeId]) REFERENCES [dbo].[Employees] ([Id])
);
