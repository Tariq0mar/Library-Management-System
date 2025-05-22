CREATE TRIGGER trg_BookStatusChange
ON Books
AFTER UPDATE
AS
BEGIN
    INSERT INTO AuditLog (BookID, StatusChange, ChangeDate)
    SELECT
        i.BookID,
        'Status changed from ' + d.CurrentStatus + ' to ' + i.CurrentStatus,
        GETDATE()
    FROM inserted i
    JOIN deleted d ON i.BookID = d.BookID
    WHERE i.CurrentStatus <> d.CurrentStatus
      AND (d.CurrentStatus IN ('Available', 'Borrowed') AND i.CurrentStatus IN ('Available', 'Borrowed'));
END;
