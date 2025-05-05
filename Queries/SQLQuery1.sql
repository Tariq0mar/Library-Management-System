-- List of Borrowed Books: Retrieve all books borrowed by a specific borrower, including those currently unreturned.

DECLARE @BorrowerID INT;
SET @BorrowerID = 5;  

SELECT 
    LoanID,
    BookID,
    BorrowerID,
    DateBorrowed,
    DueDate,
    DateReturned
FROM Loans
WHERE BorrowerID = @BorrowerID;