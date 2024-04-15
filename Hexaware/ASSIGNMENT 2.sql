CREATE DATABASE  SISDB1;
--TASK 1
-- Create Students table
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    email VARCHAR(100),
    phone_number VARCHAR(15)
);


INSERT INTO Students (student_id, first_name, last_name, date_of_birth, email, phone_number) VALUES
(1, 'Karthik', 'Mani', '2000-05-10', 'karthik.mani@example.com', '1234567890'),
(2, 'Saranya', 'Raj', '2001-02-15', 'saranya.raj@example.com', '2345678901'),
(3, 'Arjun', 'Kumar', '2000-11-20', 'arjun.kumar@example.com', '3456789012'),
(4, 'Priya', 'Sundaram', '2001-08-25', 'priya.sundaram@example.com', '4567890123'),
(5, 'Gowri', 'Balaji', '2000-04-30', 'gowri.balaji@example.com', '5678901234'),
(6, 'Manoj', 'Venkat', '2001-07-05', 'manoj.venkat@example.com', '6789012345'),
(7, 'Deepika', 'Krishnan', '2000-03-12', 'deepika.krishnan@example.com', '7890123456'),
(8, 'Vikram', 'Rao', '2001-06-18', 'vikram.rao@example.com', '8901234567'),
(9, 'Sneha', 'Gupta', '2000-09-23', 'sneha.gupta@example.com', '9012345678'),
(10, 'Harish', 'Pandian', '2001-01-28', 'harish.pandian@example.com', '0123456789');

-- Create Courses table
CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    credits INT,
    teacher_id INT,
    FOREIGN KEY (teacher_id) REFERENCES Teachers(teacher_id)
);

-- Insert data into Courses
INSERT INTO Courses (course_id, course_name, credits, teacher_id) VALUES
(1, 'Mathematics', 4, 1),
(2, 'Physics', 3, 2),
(3, 'Chemistry', 3, 3),
(4, 'Biology', 3, 4);

-- Create Enrollments table
CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- Insert data into Enrollments
INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date) VALUES
(1, 1, 1, '2023-09-01'),
(2, 2, 2, '2023-09-01'),
(3, 3, 3, '2023-09-01'),
(4, 4, 4, '2023-09-01'),
(5, 5, 1, '2023-09-01'),
(6, 6, 2, '2023-09-01'),
(7, 7, 3, '2023-09-01'),
(8, 8, 4, '2023-09-01'),
(9, 9, 1, '2023-09-01'),
(10, 10, 2, '2023-09-01'),
(11, 10, 3, '2023-09-01'),
(12, 9, 4, '2023-09-01'),
(13, 8, 1, '2023-09-01'),
(14, 7, 2, '2023-09-01'),
(15, 6, 3, '2023-09-01'),
(16, 4, 4, '2023-09-01'),
(17, 4, 1, '2023-09-01'),
(18, 3, 2, '2023-09-01'),
(19, 2, 3, '2023-09-01'),
(20, 1, 4, '2023-09-01');

-- Create Teachers table
CREATE TABLE Teachers (
    teacher_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100)
);

-- Insert data into Teachers with Tamil names in English
INSERT INTO Teachers (teacher_id, first_name, last_name, email) VALUES
(1, 'Senthil', 'Kumar', 'senthil.kumar@example.com'),
(2, 'Nithya', 'Raj', 'nithya.raj@example.com'),
(3, 'Aravind', 'Sundaram', 'aravind.sundaram@example.com'),
(4, 'Dhanya', 'Venkat', 'dhanya.venkat@example.com');

-- Create Payments table
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    student_id INT,
    amount DECIMAL(10,2),
    payment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

-- Insert data into Payments
INSERT INTO Payments (payment_id, student_id, amount, payment_date) VALUES
(1, 1, 100.00, '2023-09-15'),
(2, 2, 150.00, '2023-09-15'),
(3, 3, 200.00, '2023-09-15'),
(4, 4, 250.00, '2023-09-15'),
(5, 5, 100.00, '2023-09-15'),
(6, 6, 150.00, '2023-09-15'),
(7, 7, 200.00, '2023-09-15');


SELECT * FROM Students;
SELECT * FROM Teachers;
SELECT * FROM Payments;
SELECT * FROM Courses;
SELECT * FROM Enrollments;

--TASK-2
--Insert a new student into the "Students" table:
INSERT INTO Students (student_id,first_name, last_name, date_of_birth, email, phone_number)  VALUES (11,'John', 'Doe', '1995-08-15', 'john.doe@example.com', '1234567890');

--Enroll a student in a course:

INSERT INTO Enrollments (enrollment_id,student_id, course_id, enrollment_date) VALUES (21,1, 2, '2024-04-12'); 

--Update the email address of a specific teacher:

UPDATE Teachers SET email = 'Kumar@example.com' WHERE teacher_id = 1;

--Delete a specific enrollment record from the "Enrollments" table:

DELETE FROM Enrollments
WHERE student_id = 1 AND course_id = 2;

--Update the "Courses" table to assign a specific teacher to a course:

UPDATE Courses SET teacher_id = 1 WHERE course_id = 1;


--Delete a specific student from the "Students" table and remove all their enrollment records:

DELETE FROM Students WHERE student_id = 1;
DELETE FROM Enrollments WHERE student_id = 1;


--Update the payment amount for a specific payment record in the "Payments" table:

UPDATE Payments SET amount = 200.00 WHERE payment_id = 1;


--TASK 3
--Calculate the total payments made by a specific student:
SELECT Payments.student_id, SUM(amount) AS total_payments FROM Payments WHERE student_id = 2 GROUP BY Payments.student_id;

--Retrieve a list of courses along with the count of students enrolled in each course:
SELECT Courses.course_name, COUNT(Enrollments.student_id) AS enrolled_students_count FROM Courses LEFT JOIN Enrollments ON Courses.course_id = Enrollments.course_id GROUP BY Courses.course_name;

--Find the names of students who have not enrolled in any course:
SELECT Students.first_name, Students.last_name
FROM Students
LEFT JOIN Enrollments ON Students.student_id = Enrollments.student_id
WHERE Enrollments.student_id IS NULL;

--Retrieve the first name, last name of students, and the names of the courses they are enrolled in:
SELECT Students.first_name, Students.last_name, Courses.course_name
FROM Students
JOIN Enrollments ON Students.student_id = Enrollments.student_id
JOIN Courses ON Enrollments.course_id = Courses.course_id;

--List the names of teachers and the courses they are assigned to:
SELECT Teachers.first_name, Teachers.last_name, Courses.course_name
FROM Teachers
JOIN Courses ON Teachers.teacher_id = Courses.teacher_id;

--Retrieve a list of students and their enrollment dates for a specific course:
SELECT Students.first_name, Students.last_name, Enrollments.enrollment_date FROM Students
JOIN Enrollments ON Students.student_id = Enrollments.student_id JOIN Courses ON Enrollments.course_id = Courses.course_id
WHERE Courses.course_id = 2;

--Find the names of students who have not made any payments:
SELECT Students.first_name, Students.last_name FROM Students LEFT JOIN Payments ON Students.student_id = Payments.student_id
WHERE Payments.payment_id IS NULL;

--Identify courses that have no enrollments:
SELECT Courses.course_name FROM Courses LEFT JOIN Enrollments ON Courses.course_id = Enrollments.course_id WHERE Enrollments.enrollment_id IS NULL;

--Find teachers who are not assigned to any courses:
SELECT Teachers.first_name, Teachers.last_name FROM Teachers LEFT JOIN Courses ON Teachers.teacher_id = Courses.teacher_id
WHERE Courses.course_id IS NULL;

--TASK 3
--1
SELECT AVG(StudentCount) AS AverageStudentsEnrolled
FROM (
    SELECT COUNT(*) AS StudentCount
    FROM Enrollments
    GROUP BY course_id
) AS CourseStudentCounts;
--2
SELECT student_id, MAX(Amount) AS HighestPaymentAmount FROM Payments GROUP BY student_id HAVING MAX(Amount) = (SELECT MAX(Amount) FROM Payments);

--3

SELECT course_id, COUNT(*) AS EnrollmentCount
FROM Enrollments
GROUP BY course_id
HAVING COUNT(*) = (SELECT MAX(EnrollmentCount) FROM (SELECT COUNT(*) AS EnrollmentCount FROM Enrollments GROUP BY course_id) AS MaxEnrollments);

--5
SELECT student_id
FROM Enrollments
GROUP BY student_id
HAVING COUNT(DISTINCT course_id) = (SELECT COUNT(DISTINCT course_id) FROM Courses);

--7
SELECT AVG(StudentAge) AS AverageAge FROM (SELECT DATEDIFF(YEAR, date_of_birth, GETDATE()) AS StudentAge FROM Students) AS StudentAges;

--8
SELECT course_id, course_name FROM Courses WHERE course_id NOT IN (SELECT course_id FROM Enrollments);

--9
SELECT Enrollments.enrollment_id,Enrollments.course_id,(SELECT sum(amount)  FROM Payments JOIN Enrollments ON Payments.student_id=Enrollments.student_id) AS TOTALAMOUNT FROM Enrollments;

--10
SELECT student_id FROM ( SELECT student_id, COUNT(*) AS payment_count FROM Payments GROUP BY student_id) AS payment_counts WHERE payment_count > 1;

--11
SELECT student_id, first_name, last_name, (SELECT SUM(amount) FROM Payments WHERE Payments.student_id = Students.student_id ) AS TotalPayments FROM Students;
--12
SELECT course_name,(SELECT COUNT(*) FROM Enrollments WHERE Courses.course_id = Enrollments.course_id) AS EnrollmentCount FROM Courses;
--13
SELECT (SELECT AVG(amount)FROM Payments) AS AveragePaymentAmount;
