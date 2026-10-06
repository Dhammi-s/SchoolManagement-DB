CREATE PROCEDURE [dbo].[usp_Subject_Insert]
    @Name  NVARCHAR (100),
    @Code  NVARCHAR (20) = NULL,
    @NewId INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[Subjects] ([Name], [Code])
    VALUES (@Name, @Code);

    SET @NewId = CAST(SCOPE_IDENTITY() AS INT);
END
