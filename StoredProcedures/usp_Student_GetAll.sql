CREATE PROCEDURE [dbo].[usp_Student_GetAll]
    @ClassId INT = NULL,   -- optional filter
    @Search  NVARCHAR (100) = NULL
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
            c.[Name]   AS ClassName,
            s.[SectionId],
            sec.[Name] AS SectionName,
            s.[PhotoUrl],
            s.[GuardianName],
            s.[GuardianPhone],
            s.[UsesBusService],
            [dbo].[fn_Student_PendingFeeTotal](s.[Id]) AS PendingFees
    FROM    [dbo].[Students] s
    LEFT JOIN [dbo].[Classes]  c   ON c.[Id]   = s.[ClassId]
    LEFT JOIN [dbo].[Sections] sec ON sec.[Id] = s.[SectionId]
    WHERE   s.[IsActive] = 1
      AND   (@ClassId IS NULL OR s.[ClassId] = @ClassId)
      AND   (@Search IS NULL OR s.[FirstName] LIKE N'%' + @Search + N'%'
                             OR s.[LastName]  LIKE N'%' + @Search + N'%'
                             OR s.[AdmissionNumber] LIKE N'%' + @Search + N'%')
    ORDER BY c.[Name], s.[RollNumber], s.[FirstName];
END
