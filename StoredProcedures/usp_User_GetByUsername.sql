CREATE PROCEDURE [dbo].[usp_User_GetByUsername]
    @Username NVARCHAR (100)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT  u.[Id],
            u.[Username],
            u.[PasswordHash],
            u.[RoleId],
            r.[Name] AS RoleName,
            u.[EmployeeId],
            u.[StudentId],
            u.[IsActive]
    FROM    [dbo].[Users] u
    INNER JOIN [dbo].[Roles] r ON r.[Id] = u.[RoleId]
    WHERE   u.[Username] = @Username;
END
