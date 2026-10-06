CREATE TABLE [dbo].[Subjects]
(
    [Id]   INT           IDENTITY (1, 1) NOT NULL,
    [Name] NVARCHAR (100) NOT NULL,
    [Code] NVARCHAR (20)  NULL,
    CONSTRAINT [PK_Subjects] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [UQ_Subjects_Name] UNIQUE NONCLUSTERED ([Name] ASC)
);
