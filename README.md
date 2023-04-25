# ![SQL Server 2022](https://img.icons8.com/color/48/000000/microsoft-sql-server.png) Learning Platform Database

This is a sample database designed to store information about language courses and users. The database has 4 tables, where each table is in 3NF. Each table has at least 4 fields (including primary keys).

## Tables

The database has the following tables:

Tables    |
----------|
Languages |
Users     |
Courses   |
Lessons   |

### Languages

The Languages table stores information about the languages that are available for courses. The table has the following fields:

1. language_id (primary key) 
2. language_name 
3. country_of_origin 
4. difficulty_level

#### Functional dependencies (FDs):

language_id → language_name, country_of_origin, difficulty_level

### Users

The Users table stores information about the users who register for courses. The table has the following fields:

1. user_id (primary key)
2. first_name
3. last_name
4. email
5. password
6. language_id (foreign key referencing the Languages table)
7. registration_date

#### Functional dependencies (FDs):

user_id → first_name, last_name, email, password, language_id, registration_date
email → user_id

#### Foreign key policy:

The foreign key constraint on the Users table referencing the Languages table has an ON DELETE SET NULL policy.

## Courses

The Courses table stores information about the courses that are available for users. The table has the following fields:

1. course_id (primary key)
2. course_name
3. language_id (foreign key referencing the Languages table)
4. user_id (foreign key referencing the Users table)
5. course_description
6. course_level

#### Functional dependencies (FDs):

course_id → course_name, language_id, user_id, course_description, course_level
user_id → language_id

#### Foreign key policy:

The foreign key constraint on the Courses table referencing the Languages table has an ON DELETE CASCADE policy.
The foreign key constraint on the Courses table referencing the Users table has an ON DELETE CASCADE policy.

## Lessons

The Lessons table stores information about the lessons that are available for courses. The table has the following fields:

1. lesson_id (primary key)
2. lesson_name
3. course_id (foreign key referencing the Courses table)
4. lesson_content
5. lesson_duration

#### Functional dependencies (FDs):

lesson_id → lesson_name, course_id, lesson_content, lesson_duration

#### Foreign key policy:

The foreign key constraint on the Lessons table referencing the Courses table has an ON DELETE CASCADE policy.
