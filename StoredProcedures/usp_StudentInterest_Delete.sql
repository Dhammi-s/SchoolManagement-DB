CREATE PROCEDURE [dbo].[usp_StudentInterest_Delete]
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM [dbo].[StudentInterests] WHERE [Id] = @Id;
END
