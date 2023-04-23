


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
	   
	   
	   