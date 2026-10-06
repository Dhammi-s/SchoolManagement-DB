-- Assigns a fee structure to a student, creating a StudentFee line (idempotent).
CREATE PROCEDURE [dbo].[usp_StudentFee_Assign]
    @StudentId      INT,
    @FeeStructureId INT,
    @NewId          INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (SELECT 1 FROM [dbo].[StudentFees] WHERE [StudentId] = @StudentId AND [FeeStructureId] = @FeeStructureId)
    BEGIN
        SET @NewId = (SELECT [Id] FROM [dbo].[StudentFees] WHERE [StudentId] = @StudentId AND [FeeStructureId] = @FeeStructureId);
        RETURN;
    END

    DECLARE @Amount DECIMAL (10, 2), @DueDate DATE;
    SELECT @Amount = [Amount], @DueDate = [DueDate] FROM [dbo].[FeeStructures] WHERE [Id] = @FeeStructureId;

    INSERT INTO [dbo].[StudentFees] ([StudentId], [FeeStructureId], [AmountDue], [AmountPaid], [Status], [DueDate])
    VALUES (@StudentId, @FeeStructureId, ISNULL(@Amount, 0), 0, N'Pending', @DueDate);

    SET @NewId = CAST(SCOPE_IDENTITY() AS INT);
END
