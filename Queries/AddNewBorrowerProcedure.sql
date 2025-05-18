CREATE PROCEDURE sp_AddNewBorrower
    @FirstName VARCHAR(100),
    @LastName VARCHAR(100),
    @Email VARCHAR(255),
    @DateOfBirth DATE,
    @MembershipDate DATE,
    @BorrowerID INT OUTPUT,
    @Message NVARCHAR(255) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (SELECT 1 FROM Borrowers WHERE Email = @Email)
    BEGIN
        SET @BorrowerID = NULL;
        SET @Message = 'Error: A borrower with this email already exists.';
        RETURN;
    END

    INSERT INTO Borrowers (FirstName, LastName, Email, DateOfBirth, MembershipDate)
    VALUES (
        @FirstName,
        @LastName,
        @Email,
        @DateOfBirth,
        ISNULL(@MembershipDate, GETDATE())
    );

    SET @BorrowerID = SCOPE_IDENTITY();
    SET @Message = 'Success: New borrower added.';
END;
