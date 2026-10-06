-- Per-school branding / appearance. Editable by the Principal.
-- Single-row table (enforced by a check constraint on a fixed Id).
CREATE TABLE [dbo].[SchoolSettings]
(
    [Id]                  INT            NOT NULL CONSTRAINT [DF_SchoolSettings_Id] DEFAULT (1),
    [SchoolName]          NVARCHAR (200) NULL,
    [LogoUrl]             NVARCHAR (500) NULL,
    [PrimaryColor]        NVARCHAR (20)  NULL CONSTRAINT [DF_SchoolSettings_Primary] DEFAULT (N'#2563eb'),
    [SecondaryColor]      NVARCHAR (20)  NULL CONSTRAINT [DF_SchoolSettings_Secondary] DEFAULT (N'#1e293b'),
    [LoginBackgroundUrl]  NVARCHAR (500) NULL,
    [LoginTitle]          NVARCHAR (200) NULL,
    [LoginSubtitle]       NVARCHAR (300) NULL,
    [UpdatedAt]           DATETIME2 (0)  NOT NULL CONSTRAINT [DF_SchoolSettings_UpdatedAt] DEFAULT (SYSUTCDATETIME()),
    CONSTRAINT [PK_SchoolSettings] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [CK_SchoolSettings_SingleRow] CHECK ([Id] = 1)
);
