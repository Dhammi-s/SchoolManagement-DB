CREATE PROCEDURE [dbo].[usp_StudentInterest_GetByStudent]
    @StudentId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT [Id], [StudentId], [InterestType], [InterestName]
    FROM   [dbo].[StudentInterests]
    WHERE  [StudentId] = @StudentId
    ORDER BY [InterestType], [InterestName];
END
