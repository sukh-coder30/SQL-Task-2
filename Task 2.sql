Create Database studentDB;
use studentDB;
create table students(
student_id int Primary key auto_increment,
first_name varchar(30) not null,
last_name varchar(30) not null,
email varchar(100) unique not null,
gender ENUM('male', 'female', 'other') not null,
date_of_birth Date not null,
Admission_date Date,
check(date_of_birth<=Admission_date));

insert into students
values(101, 'Arun', 'kumar','arun@gmail.com', 'male', '2022-01-01', '2025-01-01');
insert into students
values(102, 'varun', 'kumar','varun@gmail.com', 'male', '2022-02-01', '2025-01-02'),
(103, 'Mina', 'kumari','Mina@gmail.com', 'female', '2022-02-15', '2025-01-03'),
(104, 'rahul', 'Singh','rahul@gmail.com', 'male', '2022-02-25', '2025-01-04'),
(105, 'Sima', 'Singh','Sima@gmail.com', 'Female', '2022-03-02', '2025-01-05'),
(106, 'Vikas', 'kumar','vikas@gmail.com', 'male', '2022-03-10', '2025-01-06');

select * from students;

create table course(
course_id int primary key auto_increment,
course_name varchar(20) Not null unique,
course_code int unique not null,
credit_hours INT NOT NULL CHECK (credit_hours BETWEEN 1 AND 6)
);
insert into course
values(1001, 'English', 201, 5),
(1002, 'EVS', 202, 2 ),
(1003,'Maths', 203, 6),
(1004 , 'Art', 204, 5),
(1005, 'Mental Healt', 205, 4),
(1006, 'Dance', 206, 4);


create table enrollments(
enrollment_id int primary key auto_increment,
student_id int not null,
course_id int not null,
enrollment_date date,
grade char(2) default 'NA',
foreign key(student_id) references students(student_id) on delete cascade,
foreign key(course_id) references course(course_id) on delete cascade);


insert into enrollments
values  (2001, 101, 1001, '2025-01-01', 'A'),
(2002, 102, 1002, '2025-01-02', 'B'),
(2003, 103, 1003, '2025-01-03', 'A'),
(2004, 104, 1004, '2025-01-04', ''),
(2005, 105, 1005, '2025-01-05', 'C'),
(2006, 106, 1006, '2025-01-06', 'A');
select *from enrollments;

update enrollments
Set grade='B'
where enrollment_id=2004;

select * from course;


DELETE FROM course
WHERE course_id = 1001;

select * from course;

INSERT INTO students (student_id, first_name, email, gender, date_of_birth)
VALUES (107, 'Riya', 'riya@gmail.com', 'Female', '2001-01-10');