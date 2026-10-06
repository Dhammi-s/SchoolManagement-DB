CREATE PROCEDURE [dbo].[usp_StudentInterest_Add]
    @StudentId    INT,
    @InterestType NVARCHAR (50),
    @InterestName NVARCHAR (100),
    @NewId        INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[StudentInterests] ([StudentId], [InterestType], [InterestName])
    VALUES (@StudentId, @InterestType, @InterestName);

    SET @NewId = CAST(SCOPE_IDENTITY() AS INT);
END
