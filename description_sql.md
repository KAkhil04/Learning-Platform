Table 1: Languages

This table stores information about languages.
It has four columns: language_id, language_name, country_of_origin, and difficulty_level.
language_id is a primary key with an identity property to ensure that each language has a unique identifier.
There are no functional dependencies or constraints in this table.


Table 2: Users

This table stores information about users.
It has six columns: user_id, first_name, last_name, email, password, and language_id.
user_id is a primary key with an identity property to ensure that each user has a unique identifier.
first_name, last_name, email, and password are not nullable.
language_id is a foreign key that references the language_id in the Languages table.
registration_date has no constraints.
The foreign key constraint specifies that when a language is deleted from the Languages table, any references to that language in the Users table will be set to NULL.


Table 3: Courses

This table stores information about courses.
It has six columns: course_id, course_name, language_id, user_id, course_description, and course_level.
course_id is a primary key with an identity property to ensure that each course has a unique identifier.
course_name, language_id, and user_id are not nullable.
language_id and user_id are foreign keys that reference the language_id in the Languages table and the user_id in the Users table, respectively.
course_description and course_level have no constraints.
The foreign key constraint specifies that when a language or user is deleted from the Languages or Users table, any references to that language or user in the Courses table will be deleted (cascade).


Table 4: Lessons

This table stores information about lessons.
It has four columns: lesson_id, lesson_name, course_id, and lesson_content.
lesson_id is a primary key with an identity property to ensure that each lesson has a unique identifier.
lesson_name and course_id are not nullable.
course_id is a foreign key that references the course_id in the Courses table.
lesson_content has no constraints.
The foreign key constraint specifies that when a course is deleted from the Courses table, any references to that course in the Lessons table will be deleted (cascade).