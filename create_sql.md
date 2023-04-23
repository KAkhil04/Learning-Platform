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







