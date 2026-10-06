CREATE PROCEDURE [dbo].[usp_Student_GetByClass]
    @ClassId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT  s.[Id],
            s.[AdmissionNumber],
            s.[FirstName],
            s.[LastName],
            s.[Gender],
            s.[RollNumber],
            s.[ClassId],
            s.[SectionId],
            sec.[Name] AS SectionName,
            s.[PhotoUrl],
            s.[GuardianName],
            s.[GuardianPhone]
    FROM    [dbo].[Students] s
    LEFT JOIN [dbo].[Sections] sec ON sec.[Id] = s.[SectionId]
    WHERE   s.[ClassId] = @ClassId
      AND   s.[IsActive] = 1
    ORDER BY s.[RollNumber], s.[FirstName];
END
