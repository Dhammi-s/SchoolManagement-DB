CREATE PROCEDURE [dbo].[usp_Section_GetByClass]
    @ClassId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT [Id], [ClassId], [Name]
    FROM   [dbo].[Sections]
    WHERE  [ClassId] = @ClassId
    ORDER BY [Name];
END
