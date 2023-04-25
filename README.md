# ![Project](https://img.icons8.com/color/40/000000/pegasus.png) Learning Platform

## ![Group Icon](https://img.icons8.com/color/25/000000/collaboration.png) Contributors

1. Akhil Kurella (N673R798) - Kurella04
2. Ajith Reddy Baddam (Z563Q949) - ajithreddybaddam
3. Naveen Vanga (G636V632) - NaveenVanga1618

## ![Demo](https://img.icons8.com/color/25/000000/youtube.png) Demo


## ![UI](https://img.icons8.com/color/25/000000/comics-magazine.png) UI Design 

### Frondend
1. HTML
2. CSS
3. JavaScript
4. XML

### Backend
C#

### Framework
.Net

### Tools
1. Visual Studio Code
2. Visual Studio 2022

## ![SQL Server 2022](https://img.icons8.com/color/25/000000/microsoft-sql-server.png) Database Design

### Tools
1. SQL Server 2022
2. SQL Server Management Studio 2022

This is a sample database designed to store information about language courses and users. The database has 4 tables, where each table is in 3NF. Each table has at least 4 fields (including primary keys).

### Tables

The database has the following tables:

Tables    |
----------|
Languages |
Users     |
Courses   |
Lessons   |


#### Languages
---------
The Languages table stores information about the languages that are available for courses. The table has the following fields:

| Field              | Data Type   | Primary Key | Foreign Key | Required | Description                                               |
|--------------------|-------------|-------------|-------------|----------|-----------------------------------------------------------|
| language_id        | int         |     Yes     |             | Yes      | Unique identifier for a language                          |
| language_name      | varchar(50) |             | Yes         | Yes      | Name of the language                                       |
| country_of_origin  | varchar(50) |             | Yes         | Yes      | Country of origin for the language                         |
| difficulty_level   | varchar(20) |             | Yes         | Yes      | Difficulty level of the language (e.g. beginner, intermediate, advanced) |


##### Functional dependencies (FDs):

language_id → language_name, country_of_origin, difficulty_level


#### Users
-----

The Users table stores information about the users who register for courses. The table has the following fields:

| Field            | Data Type   | Primary Key | Foreign Key | Required | Description                                                  |
|------------------|-------------|-------------|-------------|----------|--------------------------------------------------------------|
| user_id          | int         |     Yes     |             |          | Unique identifier for a user                                  |
| first_name       | nvarchar(50)|             |             | Yes      | First name of the user                                        |
| last_name        | nvarchar(50)|             |             | Yes      | Last name of the user                                         |
| email            | nvarchar(100)|            |             | Yes      | Email address of the user                                     |
| password         | nvarchar(100)|            |             | Yes      | Password for the user account                                 |
| language_id      | int         |             | Languages   | No       | Foreign key to the Languages table                            |
| registration_date| date        |             |             | Yes      | Date the user registered on the platform                      |


##### Functional dependencies (FDs):

user_id → first_name, last_name, password, language_id, registration_date, email 

##### Foreign key policy:

The foreign key constraint on the Users table referencing the Languages table has an ON DELETE SET NULL policy.


#### Courses
-------
The Courses table stores information about the courses that are available for users. The table has the following fields:

| Field              | Data Type     | Primary Key | Foreign Key   | Required | Description                                                  |
|--------------------|---------------|-------------|---------------|----------|--------------------------------------------------------------|
| course_id          | int           |     Yes     |               |          | Unique identifier for a course                               |
| course_name        | nvarchar(100) |             |               | Yes      | Name of the course                                           |
| language_id        | int           |             | Languages     | Yes      | Foreign key to the Languages table                           |
| user_id            | int           |             | Users         | Yes      | Foreign key to the Users table                               |
| course_description | nvarchar(MAX) |             |               | No       | Description of the course                                    |
| course_level       | nvarchar(20)  |             |               | No       | Difficulty level of the course (e.g. beginner, intermediate, advanced) |


##### Functional dependencies (FDs):

course_id → course_name, language_id, course_description, course_level, user_id

##### Foreign key policy:

The foreign key constraint on the Courses table referencing the Languages table has an ON DELETE CASCADE policy.
The foreign key constraint on the Courses table referencing the Users table has an ON DELETE CASCADE policy.


#### Lessons
-------
The Lessons table stores information about the lessons that are available for courses. The table has the following fields:

| Field               | Data Type       | Primary Key | Foreign Key | Required | Description                                                     |
|---------------------|----------------|-------------|-------------|----------|-----------------------------------------------------------------|
| course_id           | int            |     Yes     |             | Yes       | Unique identifier for a course                                  |
| course_name         | nvarchar(100)   |             |             | Yes       | Name of the course                                              |
| language_id         | int            |             | Languages  | Yes      | Foreign key to the Languages table                              |
| user_id             | int            |             | Users       | Yes       | Foreign key to the Users table                                   |
| course_description  | nvarchar(MAX)   |             |             | No        | Description of the course                                       |
| course_level        | nvarchar(20)   |             |             | No        | Difficulty level of the course (e.g. beginner, intermediate, advanced) |


##### Functional dependencies (FDs):

lesson_id → lesson_name, course_id, lesson_content, lesson_duration

##### Foreign key policy:

The foreign key constraint on the Lessons table referencing the Courses table has an ON DELETE CASCADE policy.

#### Triggers
--------

1. Trigger to prevent deletion of a language if it is associated with any course.
2. Trigger to prevent deletion of a user if they have any enrolled courses.

#### Policies
--------

1. Policy to prevent insertion or update of a course with a non-existent language ID.
2. Policy to prevent insertion or update of a course with a non-existent user ID.
