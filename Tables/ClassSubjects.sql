CREATE TABLE [dbo].[ClassSubjects]
(
    [Id]               INT IDENTITY (1, 1) NOT NULL,
    [ClassId]          INT NOT NULL,
    [SubjectId]        INT NOT NULL,
    [TeacherEmployeeId] INT NULL,
    CONSTRAINT [PK_ClassSubjects] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [UQ_ClassSubjects] UNIQUE NONCLUSTERED ([ClassId] ASC, [SubjectId] ASC),
    CONSTRAINT [FK_ClassSubjects_Classes] FOREIGN KEY ([ClassId]) REFERENCES [dbo].[Classes] ([Id]),
    CONSTRAINT [FK_ClassSubjects_Subjects] FOREIGN KEY ([SubjectId]) REFERENCES [dbo].[Subjects] ([Id]),
    CONSTRAINT [FK_ClassSubjects_Teacher] FOREIGN KEY ([TeacherEmployeeId]) REFERENCES [dbo].[Employees] ([Id])
);
