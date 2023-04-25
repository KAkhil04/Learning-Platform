##### Sample Database
This is a sample database designed to store information about language courses and users. The database has 4 tables, where each table is in 3NF. Each table has at least 4 fields (including primary keys).

### Tables
The database has the following tables:

Languages
Users
Courses
Lessons
## Languages
The Languages table stores information about the languages that are available for courses. The table has the following fields:

language_id (primary key)
language_name
country_of_origin
difficulty_level
# Functional dependencies (FDs):

language_id → language_name, country_of_origin, difficulty_level
## Users
The Users table stores information about the users who register for courses. The table has the following fields:

user_id (primary key)
first_name
last_name
email
password
language_id (foreign key referencing the Languages table)
registration_date
# Functional dependencies (FDs):

user_id → first_name, last_name, email, password, language_id, registration_date
email → user_id
# Foreign key policy:

The foreign key constraint on the Users table referencing the Languages table has an ON DELETE SET NULL policy.
## Courses
The Courses table stores information about the courses that are available for users. The table has the following fields:

course_id (primary key)
course_name
language_id (foreign key referencing the Languages table)
user_id (foreign key referencing the Users table)
course_description
course_level
# Functional dependencies (FDs):

course_id → course_name, language_id, user_id, course_description, course_level
user_id → language_id
# Foreign key policy:

The foreign key constraint on the Courses table referencing the Languages table has an ON DELETE CASCADE policy.
The foreign key constraint on the Courses table referencing the Users table has an ON DELETE CASCADE policy.
## Lessons
The Lessons table stores information about the lessons that are available for courses. The table has the following fields:

lesson_id (primary key)
lesson_name
course_id (foreign key referencing the Courses table)
lesson_content
lesson_duration
# Functional dependencies (FDs):

lesson_id → lesson_name, course_id, lesson_content, lesson_duration
# Foreign key policy:

The foreign key constraint on the Lessons table referencing the Courses table has an ON DELETE CASCADE policy.
