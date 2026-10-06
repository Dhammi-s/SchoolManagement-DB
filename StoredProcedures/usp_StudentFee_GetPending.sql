-- Students who still owe fees, with their outstanding total.
CREATE PROCEDURE [dbo].[usp_StudentFee_GetPending]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT  s.[Id]              AS StudentId,
            s.[AdmissionNumber],
            LTRIM(RTRIM(s.[FirstName] + N' ' + ISNULL(s.[LastName], N''))) AS StudentName,
            c.[Name]            AS ClassName,
            SUM(sf.[AmountDue] - sf.[AmountPaid]) AS PendingAmount
    FROM    [dbo].[StudentFees] sf
    INNER JOIN [dbo].[Students] s ON s.[Id] = sf.[StudentId]
    LEFT  JOIN [dbo].[Classes]  c ON c.[Id] = s.[ClassId]
    WHERE   sf.[Status] <> N'Paid'
    GROUP BY s.[Id], s.[AdmissionNumber], s.[FirstName], s.[LastName], c.[Name]
    HAVING  SUM(sf.[AmountDue] - sf.[AmountPaid]) > 0
    ORDER BY PendingAmount DESC;
END
