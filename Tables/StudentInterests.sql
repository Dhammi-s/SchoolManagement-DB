CREATE TABLE [dbo].[StudentInterests]
(
    [Id]           INT            IDENTITY (1, 1) NOT NULL,
    [StudentId]    INT            NOT NULL,
    [InterestType] NVARCHAR (50)  NOT NULL, -- Game, Music, Art, etc.
    [InterestName] NVARCHAR (100) NOT NULL, -- Football, Guitar, etc.
    CONSTRAINT [PK_StudentInterests] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_StudentInterests_Students] FOREIGN KEY ([StudentId]) REFERENCES [dbo].[Students] ([Id])
);
