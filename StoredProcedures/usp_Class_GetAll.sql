CREATE PROCEDURE [dbo].[usp_Class_GetAll]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT  c.[Id],
            c.[Name],
            c.[AcademicYear],
            c.[ClassInchargeEmployeeId],
            CASE WHEN e.[Id] IS NULL THEN NULL
                 ELSE LTRIM(RTRIM(e.[FirstName] + N' ' + ISNULL(e.[LastName], N''))) END AS ClassInchargeName,
            (SELECT COUNT(1) FROM [dbo].[Students] s
             WHERE s.[ClassId] = c.[Id] AND s.[IsActive] = 1)  AS StudentCount,
            c.[CreatedAt]
    FROM    [dbo].[Classes] c
    LEFT JOIN [dbo].[Employees] e ON e.[Id] = c.[ClassInchargeEmployeeId]
    ORDER BY c.[Name];
END
