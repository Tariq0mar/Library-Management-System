IF NOT EXISTS (SELECT 1 FROM Books)
BEGIN
	INSERT INTO Books (Title, Author, ISBN, PublishedDate, Genre, ShelfLocation, CurrentStatus)
	VALUES 
	('The Hobbit', 'J.R.R. Tolkien', '9780261103344', '1937-09-21', 'Fantasy', 'A1', 'Available'),
	('1984', 'George Orwell', '9780451524935', '1949-06-08', 'Dystopian', 'B2', 'Available'),
	('To Kill a Mockingbird', 'Harper Lee', '9780061120084', '1960-07-11', 'Fiction', 'C3', 'Available'),
	('The Great Gatsby', 'F. Scott Fitzgerald', '9780743273565', '1925-04-10', 'Classic', 'D4', 'Available'),
	('Moby Dick', 'Herman Melville', '9780142437247', '1851-11-14', 'Adventure', 'E5', 'Borrowed'),
	('Pride and Prejudice', 'Jane Austen', '9780141439518', '1813-01-28', 'Romance', 'F6', 'Available'),
	('The Catcher in the Rye', 'J.D. Salinger', '9780316769488', '1951-07-16', 'Fiction', 'G7', 'Available'),
	('Brave New World', 'Aldous Huxley', '9780060850524', '1932-01-01', 'Sci-Fi', 'H8', 'Borrowed'),
	('Crime and Punishment', 'Fyodor Dostoevsky', '9780140449136', '1866-01-01', 'Philosophical', 'I9', 'Available'),
	('Frankenstein', 'Mary Shelley', '9780486282114', '1818-01-01', 'Horror', 'J10', 'Available');
END