CREATE TABLE [dbo].[FeeStructures]
(
    [Id]           INT             IDENTITY (1, 1) NOT NULL,
    [ClassId]      INT             NULL,
    [AcademicYear] NVARCHAR (12)   NOT NULL,
    [Title]        NVARCHAR (150)  NOT NULL, -- Tuition, Admission, Transport, etc.
    [Amount]       DECIMAL (10, 2) NOT NULL,
    [DueDate]      DATE            NULL,
    [IsActive]     BIT             NOT NULL CONSTRAINT [DF_FeeStructures_IsActive] DEFAULT (1),
    CONSTRAINT [PK_FeeStructures] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_FeeStructures_Classes] FOREIGN KEY ([ClassId]) REFERENCES [dbo].[Classes] ([Id])
);
