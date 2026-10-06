CREATE PROCEDURE [dbo].[usp_FeeStructure_GetAll]
    @ClassId INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT  fs.[Id],
            fs.[ClassId],
            c.[Name] AS ClassName,
            fs.[AcademicYear],
            fs.[Title],
            fs.[Amount],
            fs.[DueDate],
            fs.[IsActive]
    FROM    [dbo].[FeeStructures] fs
    LEFT JOIN [dbo].[Classes] c ON c.[Id] = fs.[ClassId]
    WHERE   fs.[IsActive] = 1
      AND   (@ClassId IS NULL OR fs.[ClassId] = @ClassId OR fs.[ClassId] IS NULL)
    ORDER BY fs.[AcademicYear] DESC, c.[Name], fs.[Title];
END
