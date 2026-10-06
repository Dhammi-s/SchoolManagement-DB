CREATE TABLE [dbo].[Employees]
(
    [Id]              INT            IDENTITY (1, 1) NOT NULL,
    [EmployeeCode]    NVARCHAR (30)  NOT NULL,
    [FirstName]       NVARCHAR (100) NOT NULL,
    [LastName]        NVARCHAR (100) NULL,
    [RoleId]          INT            NOT NULL,
    [Designation]     NVARCHAR (100) NULL,
    [Email]           NVARCHAR (256) NULL,
    [Phone]           NVARCHAR (20)  NULL,
    [Gender]          NVARCHAR (10)  NULL,
    [DateOfBirth]     DATE           NULL,
    [Qualification]   NVARCHAR (200) NULL,
    [Address]         NVARCHAR (500) NULL,
    [DateOfJoining]   DATE           NULL,
    [PhotoUrl]        NVARCHAR (500) NULL,
    [IsActive]        BIT            NOT NULL CONSTRAINT [DF_Employees_IsActive] DEFAULT (1),
    [CreatedAt]       DATETIME2 (0)  NOT NULL CONSTRAINT [DF_Employees_CreatedAt] DEFAULT (SYSUTCDATETIME()),
    CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [UQ_Employees_Code] UNIQUE NONCLUSTERED ([EmployeeCode] ASC),
    CONSTRAINT [FK_Employees_Roles] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[Roles] ([Id])
);
