CREATE PROCEDURE [dbo].[usp_StudentFee_RecordPayment]
    @StudentFeeId INT,
    @Amount       DECIMAL (10, 2)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE [dbo].[StudentFees]
    SET    [AmountPaid] = [AmountPaid] + @Amount,
           [PaidDate]   = CAST(SYSUTCDATETIME() AS DATE),
           [Status]     = CASE
                              WHEN ([AmountPaid] + @Amount) >= [AmountDue] THEN N'Paid'
                              WHEN ([AmountPaid] + @Amount) > 0 THEN N'Partial'
                              ELSE N'Pending'
                          END
    WHERE  [Id] = @StudentFeeId;
END
