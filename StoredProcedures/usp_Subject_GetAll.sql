CREATE PROCEDURE [dbo].[usp_Subject_GetAll]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT [Id], [Name], [Code]
    FROM   [dbo].[Subjects]
    ORDER BY [Name];
END
