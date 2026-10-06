CREATE PROCEDURE [dbo].[usp_Class_AssignIncharge]
    @ClassId    INT,
    @EmployeeId INT = NULL  -- NULL clears the incharge
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE [dbo].[Classes]
    SET    [ClassInchargeEmployeeId] = @EmployeeId
    WHERE  [Id] = @ClassId;
END
