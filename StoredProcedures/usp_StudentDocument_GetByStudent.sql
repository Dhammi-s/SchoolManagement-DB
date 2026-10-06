CREATE PROCEDURE [dbo].[usp_StudentDocument_GetByStudent]
    @StudentId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT [Id], [StudentId], [DocumentType], [FileName], [FileUrl], [PublicId], [UploadedAt]
    FROM   [dbo].[StudentDocuments]
    WHERE  [StudentId] = @StudentId
    ORDER BY [UploadedAt] DESC;
END
