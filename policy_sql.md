-- Policy to prevent insertion or update of a course with a non-existent language ID:
CREATE FUNCTION fn_Check_Language_Exists (@language_id int)
RETURNS bit
AS
BEGIN
    DECLARE @result bit
    SELECT @result = CASE WHEN EXISTS (SELECT 1 FROM Languages WHERE language_id = @language_id) THEN 1 ELSE 0 END
    RETURN @result
END
GO
CREATE POLICY pol_Check_Language_Exists
ADD CHECK (dbo.fn_Check_Language_Exists(language_id) = 1)
ON Courses
WITH (STATE = ON);

-- Policy to prevent insertion or update of a course with a non-existent user ID:
CREATE FUNCTION fn_Check_User_Exists (@user_id int)
RETURNS bit
AS
BEGIN
    DECLARE @result bit
    SELECT @result = CASE WHEN EXISTS (SELECT 1 FROM Users WHERE user_id = @user_id) THEN 1 ELSE 0 END
    RETURN @result
END
GO
CREATE POLICY pol_Check_User_Exists
ADD CHECK (dbo.fn_Check_User_Exists(user_id) = 1)
ON Courses
WITH (STATE = ON);
