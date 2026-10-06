CREATE PROCEDURE [dbo].[usp_User_UpdateLastLogin]
    @UserId INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE [dbo].[Users]
    SET    [LastLoginAt] = SYSUTCDATETIME()
    WHERE  [Id] = @UserId;
END
