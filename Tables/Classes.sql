CREATE TABLE [dbo].[Classes]
(
    [Id]                      INT           IDENTITY (1, 1) NOT NULL,
    [Name]                    NVARCHAR (50) NOT NULL,
    [AcademicYear]            NVARCHAR (12) NOT NULL,
    [ClassInchargeEmployeeId] INT           NULL,
    [CreatedAt]               DATETIME2 (0) NOT NULL CONSTRAINT [DF_Classes_CreatedAt] DEFAULT (SYSUTCDATETIME()),
    CONSTRAINT [PK_Classes] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [UQ_Classes_Name_Year] UNIQUE NONCLUSTERED ([Name] ASC, [AcademicYear] ASC),
    CONSTRAINT [FK_Classes_Incharge] FOREIGN KEY ([ClassInchargeEmployeeId]) REFERENCES [dbo].[Employees] ([Id])
);
