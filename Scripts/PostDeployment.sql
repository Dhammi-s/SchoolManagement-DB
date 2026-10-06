/*
 Post-Deployment Script (runs on every tenant-DB publish; must be idempotent)
 -------------------------------------------------------------------------------
 Seeds the baseline reference data every school database needs:
   - Roles
   - A default SchoolSettings row
   - A bootstrap Principal login (username: principal)

 The principal password hash below is a BCrypt hash for the password: Principal@123
 Change the password from the app after first login.
*/

SET NOCOUNT ON;

-------------------------------------------------------------------------------
-- Roles
-------------------------------------------------------------------------------
MERGE INTO [dbo].[Roles] AS target
USING (VALUES
    (N'Principal',  N'School principal / super administrator'),
    (N'HeadMaster', N'Head master'),
    (N'Teacher',    N'Teaching staff'),
    (N'Accountant', N'Accounts / finance staff'),
    (N'Student',    N'Student portal user')
) AS source ([Name], [Description])
    ON target.[Name] = source.[Name]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Name], [Description]) VALUES (source.[Name], source.[Description]);

-------------------------------------------------------------------------------
-- Default school settings (single row, Id = 1)
-------------------------------------------------------------------------------
IF NOT EXISTS (SELECT 1 FROM [dbo].[SchoolSettings] WHERE [Id] = 1)
BEGIN
    INSERT INTO [dbo].[SchoolSettings] ([Id], [SchoolName], [LoginTitle], [LoginSubtitle])
    VALUES (1, N'My School', N'Welcome', N'Sign in to continue');
END

-------------------------------------------------------------------------------
-- Bootstrap Principal user (password: Principal@123)
-------------------------------------------------------------------------------
IF NOT EXISTS (SELECT 1 FROM [dbo].[Users] WHERE [Username] = N'principal')
BEGIN
    DECLARE @PrincipalRoleId INT = (SELECT [Id] FROM [dbo].[Roles] WHERE [Name] = N'Principal');

    INSERT INTO [dbo].[Users] ([Username], [PasswordHash], [RoleId], [IsActive])
    VALUES (N'principal', N'$2a$11$k2uj5Qv./zVn6MaXnjxsvuuVJxriz2n71C2rpz6r4Pf.UZwtzr7NS', @PrincipalRoleId, 1);
END
