# SQL-Task-2
Task 2 : Data Insertion and Handling Nulls
 Objective:    Practice inserting, updating, and deleting data.
 Deliverables: SQL file with INSERT, UPDATE, DELETE statements
 Outcome:  A populated database with clean and consistent data
### 1. `students`
Stores personal and academic information about students.

create table students(
student_id int Primary key auto_increment,
first_name varchar(30) not null,
last_name varchar(30) not null,
email varchar(100) unique not null,
gender ENUM('male', 'female', 'other') not null,
date_of_birth Date not null,
Admission_date Date,
check(date_of_birth<=Admission_date));

## Course 
create table course(
course_id int primary key auto_increment,
course_name varchar(20) Not null unique,
course_code int unique not null,
credit_hours INT NOT NULL CHECK (credit_hours BETWEEN 1 AND 6)
);

## Enrollement

create table enrollments(
enrollment_id int primary key auto_increment,
student_id int not null,
course_id int not null,
enrollment_date date,
grade char(2) default 'NA',
foreign key(student_id) references students(student_id) on delete cascade,
foreign key(course_id) references course(course_id) on delete cascade);
---

## Key Features Implemented

- **Primary & Foreign Keys** to ensure data integrity  
- **ENUM and CHECK constraints** for data validation  
- **DEFAULT values** using `CURRENT_DATE` and `CURRENT_TIMESTAMP`  
- **NULL handling** for missing data  
- **ON DELETE CASCADE** support (if defined) to auto-delete dependencies


### 🔸 Insert with Missing Values
```sql
INSERT INTO students (student_id, first_name, email, gender, date_of_birth)
VALUES (101, 'Riya', 'riya@example.com', 'Female', '2001-01-10');
