
--> For Exceptions 
DROP TABLE IF EXISTS Loans;
DROP TABLE IF EXISTS Borrowers;
DROP TABLE IF EXISTS Books;

--> Create Books Table
CREATE TABLE Books (
    BookID INT PRIMARY KEY IDENTITY(1,1),
    Title VARCHAR(255) NOT NULL,
    Author VARCHAR(255) NOT NULL,
    ISBN VARCHAR(20) UNIQUE NOT NULL,
    PublishedDate DATE NOT NULL,
    Genre VARCHAR(100) NOT NULL,
    ShelfLocation VARCHAR(50) NOT NULL,
    CurrentStatus VARCHAR(10) NOT NULL
        CHECK (CurrentStatus IN ('Available', 'Borrowed'))
);

--> Create Borrowers Table
CREATE TABLE Borrowers (
    BorrowerID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    DateOfBirth DATE NOT NULL,
    MembershipDate DATE NOT NULL DEFAULT GETDATE()
);

--> Create Loans Table
CREATE TABLE Loans (
    LoanID INT PRIMARY KEY IDENTITY(1,1),
    BookID INT NOT NULL,
    BorrowerID INT NOT NULL,
    DateBorrowed DATE NOT NULL,
    DueDate DATE NOT NULL,
    DateReturned DATE NULL,

    CONSTRAINT FK_Loans_Book FOREIGN KEY (BookID) REFERENCES Books(BookID),
    CONSTRAINT FK_Loans_Borrower FOREIGN KEY (BorrowerID) REFERENCES Borrowers(BorrowerID)
);