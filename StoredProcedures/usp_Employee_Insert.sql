CREATE PROCEDURE [dbo].[usp_Employee_Insert]
    @EmployeeCode   NVARCHAR (30),
    @FirstName      NVARCHAR (100),
    @LastName       NVARCHAR (100) = NULL,
    @RoleName       NVARCHAR (50),
    @Designation    NVARCHAR (100) = NULL,
    @Email          NVARCHAR (256) = NULL,
    @Phone          NVARCHAR (20)  = NULL,
    @Gender         NVARCHAR (10)  = NULL,
    @DateOfBirth    DATE           = NULL,
    @Qualification  NVARCHAR (200) = NULL,
    @Address        NVARCHAR (500) = NULL,
    @DateOfJoining  DATE           = NULL,
    @PhotoUrl       NVARCHAR (500) = NULL,
    @NewId          INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @RoleId INT = (SELECT [Id] FROM [dbo].[Roles] WHERE [Name] = @RoleName);
    IF @RoleId IS NULL
        THROW 50001, 'Unknown role name.', 1;

    INSERT INTO [dbo].[Employees]
        ([EmployeeCode], [FirstName], [LastName], [RoleId], [Designation], [Email],
         [Phone], [Gender], [DateOfBirth], [Qualification], [Address], [DateOfJoining], [PhotoUrl])
    VALUES
        (@EmployeeCode, @FirstName, @LastName, @RoleId, @Designation, @Email,
         @Phone, @Gender, @DateOfBirth, @Qualification, @Address, @DateOfJoining, @PhotoUrl);

    SET @NewId = CAST(SCOPE_IDENTITY() AS INT);
END
