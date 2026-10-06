CREATE PROCEDURE [dbo].[usp_Student_GetById]
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT  s.[Id],
            s.[AdmissionNumber],
            s.[FirstName],
            s.[LastName],
            s.[Gender],
            s.[DateOfBirth],
            s.[ClassId],
            c.[Name]   AS ClassName,
            s.[SectionId],
            sec.[Name] AS SectionName,
            s.[RollNumber],
            s.[Address],
            s.[GuardianName],
            s.[GuardianPhone],
            s.[PreviousSchoolName],
            s.[PreviousSchoolDetails],
            s.[UsesBusService],
            s.[BusRouteId],
            br.[RouteName] AS BusRouteName,
            s.[AdmissionDate],
            s.[PhotoUrl],
            s.[IsActive],
            [dbo].[fn_Student_PendingFeeTotal](s.[Id]) AS PendingFees
    FROM    [dbo].[Students] s
    LEFT JOIN [dbo].[Classes]   c   ON c.[Id]   = s.[ClassId]
    LEFT JOIN [dbo].[Sections]  sec ON sec.[Id] = s.[SectionId]
    LEFT JOIN [dbo].[BusRoutes] br  ON br.[Id]  = s.[BusRouteId]
    WHERE   s.[Id] = @Id;
END
