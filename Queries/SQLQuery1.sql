-- List of Borrowed Books: Retrieve all books borrowed by a specific borrower, including those currently unreturned.

DECLARE @BorrowerID INT;
SET @BorrowerID = 5;  

SELECT 
    L.LoanID,
    B.Title,
    B.Author,
    B.ISBN,
    L.DateBorrowed,
    L.DueDate,
    L.DateReturned
FROM Loans L
JOIN Books B ON L.BookID = B.BookID
WHERE L.BorrowerID = @BorrowerID;