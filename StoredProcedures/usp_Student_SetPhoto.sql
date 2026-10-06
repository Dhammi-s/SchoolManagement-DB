CREATE PROCEDURE [dbo].[usp_Student_SetPhoto]
    @StudentId INT,
    @PhotoUrl  NVARCHAR (500)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE [dbo].[Students]
    SET    [PhotoUrl] = @PhotoUrl
    WHERE  [Id] = @StudentId;
END
