CREATE PROCEDURE [dbo].[usp_Employee_GetByRole]
    @RoleName NVARCHAR (50) = NULL  -- NULL = all employees
AS
BEGIN
    SET NOCOUNT ON;

    SELECT  e.[Id],
            e.[EmployeeCode],
            e.[FirstName],
            e.[LastName],
            e.[RoleId],
            r.[Name] AS RoleName,
            e.[Designation],
            e.[Email],
            e.[Phone],
            e.[Gender],
            e.[DateOfBirth],
            e.[Qualification],
            e.[Address],
            e.[DateOfJoining],
            e.[PhotoUrl],
            e.[IsActive],
            -- Classes this employee is incharge of (comma-separated), if any
            (SELECT STRING_AGG(c.[Name], N', ')
             FROM [dbo].[Classes] c
             WHERE c.[ClassInchargeEmployeeId] = e.[Id]) AS InchargeClasses
    FROM    [dbo].[Employees] e
    INNER JOIN [dbo].[Roles] r ON r.[Id] = e.[RoleId]
    WHERE   (@RoleName IS NULL OR r.[Name] = @RoleName)
      AND   e.[IsActive] = 1
    ORDER BY e.[FirstName], e.[LastName];
END
