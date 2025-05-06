IF NOT EXISTS (SELECT 1 FROM Borrowers)
BEGIN
	INSERT INTO Borrowers (FirstName, LastName, Email, DateOfBirth, MembershipDate)
	VALUES 
	('Alice', 'Smith', 'alice@example.com', '1990-05-12', '2022-01-15'),
	('Bob', 'Johnson', 'bob@example.com', '1985-03-08', '2021-12-10'),
	('Carol', 'Williams', 'carol@example.com', '2000-09-20', '2023-02-18'),
	('David', 'Brown', 'david@example.com', '1998-01-30', '2022-07-25'),
	('Eve', 'Davis', 'eve@example.com', '1995-11-02', '2023-05-10'),
	('Frank', 'Miller', 'frank@example.com', '1980-04-22', '2021-06-30'),
	('Grace', 'Wilson', 'grace@example.com', '1992-12-14', '2022-10-05'),
	('Henry', 'Moore', 'henry@example.com', '1999-07-03', '2023-01-12'),
	('Ivy', 'Taylor', 'ivy@example.com', '1993-08-25', '2022-04-19'),
	('Jack', 'Anderson', 'jack@example.com', '1988-06-17', '2021-09-21');
END