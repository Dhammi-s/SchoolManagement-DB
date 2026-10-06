CREATE PROCEDURE [dbo].[usp_Section_Insert]
    @ClassId INT,
    @Name    NVARCHAR (20),
    @NewId   INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[Sections] ([ClassId], [Name])
    VALUES (@ClassId, @Name);

    SET @NewId = CAST(SCOPE_IDENTITY() AS INT);
END
