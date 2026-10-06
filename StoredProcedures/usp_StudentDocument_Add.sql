CREATE PROCEDURE [dbo].[usp_StudentDocument_Add]
    @StudentId    INT,
    @DocumentType NVARCHAR (100),
    @FileName     NVARCHAR (300) = NULL,
    @FileUrl      NVARCHAR (500),
    @PublicId     NVARCHAR (300) = NULL,
    @NewId        INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[StudentDocuments] ([StudentId], [DocumentType], [FileName], [FileUrl], [PublicId])
    VALUES (@StudentId, @DocumentType, @FileName, @FileUrl, @PublicId);

    SET @NewId = CAST(SCOPE_IDENTITY() AS INT);
END
