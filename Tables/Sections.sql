CREATE TABLE [dbo].[Sections]
(
    [Id]      INT           IDENTITY (1, 1) NOT NULL,
    [ClassId] INT           NOT NULL,
    [Name]    NVARCHAR (20) NOT NULL,
    CONSTRAINT [PK_Sections] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [UQ_Sections_Class_Name] UNIQUE NONCLUSTERED ([ClassId] ASC, [Name] ASC),
    CONSTRAINT [FK_Sections_Classes] FOREIGN KEY ([ClassId]) REFERENCES [dbo].[Classes] ([Id])
);
