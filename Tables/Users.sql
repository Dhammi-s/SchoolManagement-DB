CREATE TABLE [dbo].[Users]
(
    [Id]           INT            IDENTITY (1, 1) NOT NULL,
    [Username]     NVARCHAR (100) NOT NULL,
    [PasswordHash] NVARCHAR (300) NOT NULL,
    [RoleId]       INT            NOT NULL,
    [EmployeeId]   INT            NULL,
    [StudentId]    INT            NULL,
    [IsActive]     BIT            NOT NULL CONSTRAINT [DF_Users_IsActive] DEFAULT (1),
    [LastLoginAt]  DATETIME2 (0)  NULL,
    [CreatedAt]    DATETIME2 (0)  NOT NULL CONSTRAINT [DF_Users_CreatedAt] DEFAULT (SYSUTCDATETIME()),
    CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [UQ_Users_Username] UNIQUE NONCLUSTERED ([Username] ASC),
    CONSTRAINT [FK_Users_Roles] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[Roles] ([Id]),
    CONSTRAINT [FK_Users_Employees] FOREIGN KEY ([EmployeeId]) REFERENCES [dbo].[Employees] ([Id]),
    CONSTRAINT [FK_Users_Students] FOREIGN KEY ([StudentId]) REFERENCES [dbo].[Students] ([Id])
);
