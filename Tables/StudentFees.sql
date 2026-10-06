CREATE TABLE [dbo].[StudentFees]
(
    [Id]             INT             IDENTITY (1, 1) NOT NULL,
    [StudentId]      INT             NOT NULL,
    [FeeStructureId] INT             NOT NULL,
    [AmountDue]      DECIMAL (10, 2) NOT NULL,
    [AmountPaid]     DECIMAL (10, 2) NOT NULL CONSTRAINT [DF_StudentFees_Paid] DEFAULT (0),
    [Status]         NVARCHAR (20)   NOT NULL CONSTRAINT [DF_StudentFees_Status] DEFAULT (N'Pending'), -- Pending, Partial, Paid
    [DueDate]        DATE            NULL,
    [PaidDate]       DATE            NULL,
    CONSTRAINT [PK_StudentFees] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_StudentFees_Students] FOREIGN KEY ([StudentId]) REFERENCES [dbo].[Students] ([Id]),
    CONSTRAINT [FK_StudentFees_Structure] FOREIGN KEY ([FeeStructureId]) REFERENCES [dbo].[FeeStructures] ([Id])
);
