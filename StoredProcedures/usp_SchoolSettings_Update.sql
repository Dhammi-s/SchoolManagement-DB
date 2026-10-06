CREATE PROCEDURE [dbo].[usp_SchoolSettings_Update]
    @SchoolName         NVARCHAR (200) = NULL,
    @LogoUrl            NVARCHAR (500) = NULL,
    @PrimaryColor       NVARCHAR (20)  = NULL,
    @SecondaryColor     NVARCHAR (20)  = NULL,
    @LoginBackgroundUrl NVARCHAR (500) = NULL,
    @LoginTitle         NVARCHAR (200) = NULL,
    @LoginSubtitle      NVARCHAR (300) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM [dbo].[SchoolSettings] WHERE [Id] = 1)
        INSERT INTO [dbo].[SchoolSettings] ([Id]) VALUES (1);

    UPDATE [dbo].[SchoolSettings]
    SET    [SchoolName]         = @SchoolName,
           [LogoUrl]            = @LogoUrl,
           [PrimaryColor]       = @PrimaryColor,
           [SecondaryColor]     = @SecondaryColor,
           [LoginBackgroundUrl] = @LoginBackgroundUrl,
           [LoginTitle]         = @LoginTitle,
           [LoginSubtitle]      = @LoginSubtitle,
           [UpdatedAt]          = SYSUTCDATETIME()
    WHERE  [Id] = 1;
END
