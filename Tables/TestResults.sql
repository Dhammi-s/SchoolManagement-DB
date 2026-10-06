CREATE TABLE [dbo].[TestResults]
(
    [Id]                INT            IDENTITY (1, 1) NOT NULL,
    [PerformanceTestId] INT            NOT NULL,
    [StudentId]         INT            NOT NULL,
    [MarksObtained]     DECIMAL (6, 2) NULL,
    [Grade]             NVARCHAR (5)   NULL,
    [Remarks]           NVARCHAR (300) NULL,
    CONSTRAINT [PK_TestResults] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [UQ_TestResults] UNIQUE NONCLUSTERED ([PerformanceTestId] ASC, [StudentId] ASC),
    CONSTRAINT [FK_TestResults_Test] FOREIGN KEY ([PerformanceTestId]) REFERENCES [dbo].[PerformanceTests] ([Id]),
    CONSTRAINT [FK_TestResults_Students] FOREIGN KEY ([StudentId]) REFERENCES [dbo].[Students] ([Id])
);
