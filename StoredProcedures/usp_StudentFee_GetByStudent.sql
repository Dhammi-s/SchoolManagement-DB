CREATE PROCEDURE [dbo].[usp_StudentFee_GetByStudent]
    @StudentId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT  sf.[Id],
            sf.[StudentId],
            sf.[FeeStructureId],
            fs.[Title],
            fs.[AcademicYear],
            sf.[AmountDue],
            sf.[AmountPaid],
            (sf.[AmountDue] - sf.[AmountPaid]) AS Balance,
            sf.[Status],
            sf.[DueDate],
            sf.[PaidDate]
    FROM    [dbo].[StudentFees] sf
    INNER JOIN [dbo].[FeeStructures] fs ON fs.[Id] = sf.[FeeStructureId]
    WHERE   sf.[StudentId] = @StudentId
    ORDER BY sf.[DueDate], fs.[Title];
END
