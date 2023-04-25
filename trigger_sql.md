-- Trigger to prevent deletion of a language if it is associated with any course:
CREATE TRIGGER tr_Delete_Language
ON Languages
FOR DELETE
AS
IF EXISTS (SELECT 1 FROM deleted d JOIN Courses c ON d.language_id = c.language_id)
BEGIN
    RAISERROR ('Cannot delete a language that is associated with a course.', 16, 1)
    ROLLBACK TRANSACTION
END

-- Trigger to prevent deletion of a user if they have any enrolled courses:
CREATE TRIGGER tr_Delete_User
ON Users
FOR DELETE
AS
IF EXISTS (SELECT 1 FROM deleted d JOIN Courses c ON d.user_id = c.user_id)
BEGIN
    RAISERROR ('Cannot delete a user that has enrolled in a course.', 16, 1)
    ROLLBACK TRANSACTION
END
