CREATE FUNCTION fn_CalculateOverdueFees
(
    @LoanID INT
)
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @DueDate DATE;
    DECLARE @DateReturned DATE;
    DECLARE @OverdueDays INT;
    DECLARE @Fee INT;

    SELECT 
        @DueDate = DueDate,
        @DateReturned = DateReturned
    FROM Loans
    WHERE ID = @LoanID;

    IF @DateReturned IS NULL
        SET @DateReturned = CAST(GETDATE() AS DATE);

    SET @OverdueDays = DATEDIFF(DAY, @DueDate, @DateReturned);

    IF @OverdueDays <= 0
        SET @Fee = 0;
    ELSE IF @OverdueDays <= 30
        SET @Fee = @OverdueDays * 1;
    ELSE
        SET @Fee = (30 * 1) + ((@OverdueDays - 30) * 2); 

    RETURN @Fee;
END
