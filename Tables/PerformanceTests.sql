CREATE TABLE [dbo].[PerformanceTests]
(
    [Id]                INT            IDENTITY (1, 1) NOT NULL,
    [ClassId]           INT            NOT NULL,
    [SectionId]         INT            NULL,
    [SubjectId]         INT            NOT NULL,
    [TeacherEmployeeId] INT            NOT NULL,
    [Title]             NVARCHAR (200) NOT NULL,
    [TestDate]          DATE           NOT NULL,
    [MaxMarks]          DECIMAL (6, 2) NOT NULL,
    [CreatedAt]         DATETIME2 (0)  NOT NULL CONSTRAINT [DF_PerformanceTests_CreatedAt] DEFAULT (SYSUTCDATETIME()),
    CONSTRAINT [PK_PerformanceTests] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_PerfTests_Classes] FOREIGN KEY ([ClassId]) REFERENCES [dbo].[Classes] ([Id]),
    CONSTRAINT [FK_PerfTests_Sections] FOREIGN KEY ([SectionId]) REFERENCES [dbo].[Sections] ([Id]),
    CONSTRAINT [FK_PerfTests_Subjects] FOREIGN KEY ([SubjectId]) REFERENCES [dbo].[Subjects] ([Id]),
    CONSTRAINT [FK_PerfTests_Teacher] FOREIGN KEY ([TeacherEmployeeId]) REFERENCES [dbo].[Employees] ([Id])
);
