CREATE PROCEDURE [dbo].[usp_SchoolSettings_Get]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT TOP (1)
            [Id],
            [SchoolName],
            [LogoUrl],
            [PrimaryColor],
            [SecondaryColor],
            [LoginBackgroundUrl],
            [LoginTitle],
            [LoginSubtitle],
            [UpdatedAt]
    FROM    [dbo].[SchoolSettings]
    WHERE   [Id] = 1;
END
