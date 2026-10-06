CREATE PROCEDURE [dbo].[usp_Employee_SetPhoto]
    @EmployeeId INT,
    @PhotoUrl   NVARCHAR (500)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE [dbo].[Employees]
    SET    [PhotoUrl] = @PhotoUrl
    WHERE  [Id] = @EmployeeId;
END
