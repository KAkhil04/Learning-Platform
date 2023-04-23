Create database LearningPlatform

-- Table 1: Languages
CREATE TABLE Languages (
    language_id INT Identity(1,1) PRIMARY KEY,
    language_name VARCHAR(50),
    country_of_origin VARCHAR(50),
    difficulty_level VARCHAR(20)
);

-- Table 2: Users
CREATE TABLE Users (
  user_id int Identity(1,1) PRIMARY KEY,
  first_name NVARCHAR(50) NOT NULL,
  last_name NVARCHAR(50) NOT NULL,
  email NVARCHAR(100) NOT NULL,
  password NVARCHAR(100) NOT NULL,
  language_id INT,
  registration_date DATE,
  FOREIGN KEY (language_id) REFERENCES Languages(language_id) ON DELETE SET NULL
);


-- Table 3: Courses
CREATE TABLE Courses (
  course_id int Identity(1,1) PRIMARY KEY,
  course_name NVARCHAR(100) NOT NULL,
  language_id INT NOT NULL,
  user_id INT NOT NULL,
  course_description NVARCHAR(MAX),
  course_level NVARCHAR(20),
  FOREIGN KEY (language_id) REFERENCES Languages(language_id) ON DELETE CASCADE,
  FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

-- Table 4: Lessons
CREATE TABLE Lessons (
  lesson_id int Identity(1,1) PRIMARY KEY,
  lesson_name NVARCHAR(100) NOT NULL,
  course_id INT NOT NULL,
  lesson_content NVARCHAR(MAX),
  lesson_duration INT,
  FOREIGN KEY (course_id) REFERENCES Courses(course_id) ON DELETE CASCADE
);












-- Insert 5 rows into Languages table
INSERT INTO Languages (language_name, country_of_origin, difficulty_level)
VALUES ('English', 'United States', 'Intermediate'),
       ('Spanish', 'Spain', 'Beginner'),
       ('French', 'France', 'Advanced'),
       ('German', 'Germany', 'Intermediate'),
       ('Chinese', 'China', 'Beginner');


-- Insert 5 rows into Users table
INSERT INTO Users (first_name, last_name, email, password, language_id, registration_date)
VALUES ('John', 'Doe', 'john.doe@example.com', 'mypassword1', 1, '2021-01-01'),
       ('Jane', 'Smith', 'jane.smith@example.com', 'mypassword2', 2, '2021-01-02'),
       ('Michael', 'Brown', 'michael.brown@example.com', 'mypassword3', 1, '2021-01-03'),
       ('Sarah', 'Johnson', 'sarah.johnson@example.com', 'mypassword4', 2, '2021-01-04'),
       ('David', 'Wilson', 'david.wilson@example.com', 'mypassword5', 1, '2021-01-05');



-- Insert 5 rows into Courses table
INSERT INTO Courses (course_name, language_id, user_id, course_description, course_level)
VALUES ('English Grammar', 1, 1, 'Learn English grammar rules.', 'Intermediate'),
       ('Spanish for Beginners', 2, 2, 'Learn basic Spanish phrases and vocabulary.', 'Beginner'),
       ('French Conversation', 3, 3, 'Improve your French speaking skills.', 'Advanced'),
       ('German Writing', 4, 4, 'Enhance your German writing skills.', 'Intermediate'),
       ('Chinese Pronunciation', 5, 5, 'Master Chinese pronunciation and tones.', 'Beginner');

-- Insert 5 rows into Lessons table
INSERT INTO Lessons (lesson_name, course_id, lesson_content, lesson_duration)
VALUES ('Nouns and Pronouns', 1, 'Lesson content for English Grammar', 60),
       ('Greetings and Introductions', 2, 'Lesson content for Spanish for Beginners', 30),
       ('At the Restaurant', 3, 'Lesson content for French Conversation', 45),
       ('Writing Techniques', 4, 'Lesson content for German Writing', 60),
       ('Tones and Pinyin', 5, 'Lesson content for Chinese Pronunciation', 30);
	   
	   
	   
	   
	SELECT * FROM Languages WHERE difficulty_level = 'Intermediate' ORDER BY country_of_origin DESC;
	
	SELECT * FROM Users WHERE registration_date >= '2021-01-03' ORDER BY last_name ASC;
	
	SELECT * FROM Courses WHERE language_id = 1 ORDER BY course_level ASC;
	
	SELECT * FROM Lessons WHERE course_id = 2 ORDER BY lesson_duration DESC;




	UPDATE Languages SET difficulty_level = 'Intermediate' WHERE language_id = 2;

	UPDATE Users SET registration_date = '2021-02-01' WHERE user_id = 3;

	UPDATE Courses SET course_level = 'Advanced' WHERE course_id = 4;
	
	UPDATE Lessons SET lesson_content = 'New lesson content for French Conversation' WHERE lesson_id = 3;
	
	
	
	
	DELETE FROM Languages WHERE language_id = 5 AND NOT EXISTS (SELECT * FROM Courses WHERE Courses.language_id = Languages.language_id);

	DELETE FROM Users WHERE user_id = 2 AND NOT EXISTS (SELECT * FROM Courses WHERE Courses.user_id = Users.user_id);

	DELETE FROM Courses WHERE course_id = 3 AND NOT EXISTS (SELECT * FROM Lessons WHERE Lessons.course_id = Courses.course_id);

	DELETE FROM Lessons WHERE lesson_id = 4;





