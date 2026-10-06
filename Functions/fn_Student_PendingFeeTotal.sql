-- Returns the total outstanding (unpaid) fee amount for a given student.
CREATE FUNCTION [dbo].[fn_Student_PendingFeeTotal]
(
    @StudentId INT
)
RETURNS DECIMAL (12, 2)
AS
BEGIN
    DECLARE @Pending DECIMAL (12, 2);

    SELECT @Pending = ISNULL(SUM(sf.[AmountDue] - sf.[AmountPaid]), 0)
    FROM   [dbo].[StudentFees] sf
    WHERE  sf.[StudentId] = @StudentId
      AND  sf.[Status] <> N'Paid';

    RETURN ISNULL(@Pending, 0);
END
