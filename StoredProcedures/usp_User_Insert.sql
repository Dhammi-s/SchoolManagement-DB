CREATE PROCEDURE [dbo].[usp_User_Insert]
    @Username     NVARCHAR (100),
    @PasswordHash NVARCHAR (300),
    @RoleName     NVARCHAR (50),
    @EmployeeId   INT = NULL,
    @StudentId    INT = NULL,
    @NewId        INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @RoleId INT = (SELECT [Id] FROM [dbo].[Roles] WHERE [Name] = @RoleName);
    IF @RoleId IS NULL
        THROW 50001, 'Unknown role name.', 1;

    INSERT INTO [dbo].[Users] ([Username], [PasswordHash], [RoleId], [EmployeeId], [StudentId])
    VALUES (@Username, @PasswordHash, @RoleId, @EmployeeId, @StudentId);

    SET @NewId = CAST(SCOPE_IDENTITY() AS INT);
END
