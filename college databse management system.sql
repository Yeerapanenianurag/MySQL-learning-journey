-- Create Database and Use it
CREATE DATABASE IF NOT EXISTS college_database;
USE college_database;

-- Department Table: Stores information about different departments in the college.
CREATE TABLE IF NOT EXISTS Departments (
    department_id INT PRIMARY KEY NOT NULL,
    department_name VARCHAR(100) NOT NULL,
    description VARCHAR(250) NOT NULL
);

-- Courses Table: Contains details of the courses offered by each department.
CREATE TABLE IF NOT EXISTS courses (
    course_id INT PRIMARY KEY NOT NULL,
    course_name VARCHAR(50) NOT NULL,
    course_description VARCHAR(255) NOT NULL,
    credit_hours INT NOT NULL,
    department_id INT NOT NULL,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

-- HOD Table: Holds information about the heads of departments.
CREATE TABLE IF NOT EXISTS hod (
    hod_id INT PRIMARY KEY NOT NULL,
    hod_name VARCHAR(50) NOT NULL,
    hod_dob DATE NOT NULL,
    hod_gender VARCHAR(6) NOT NULL CHECK (hod_gender IN ('Male', 'Female', 'Other')),
    hod_address VARCHAR(100) NOT NULL,
    hod_phonenumber VARCHAR(15) NOT NULL,
    hod_email VARCHAR(50) UNIQUE NOT NULL,
    department_id INT NOT NULL,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

-- Branch Table: Represents different branches of study within departments.
CREATE TABLE IF NOT EXISTS branch (
    branch_id INT PRIMARY KEY NOT NULL,
    branch_name VARCHAR(50) NOT NULL,
    hod_id INT NOT NULL,
    FOREIGN KEY (hod_id) REFERENCES hod(hod_id)
);

-- Faculty Table: Stores information about faculty members.
CREATE TABLE IF NOT EXISTS faculty (
    faculty_id INT PRIMARY KEY NOT NULL,
    faculty_name VARCHAR(50) NOT NULL,
    faculty_dob DATE NOT NULL,
    faculty_gender VARCHAR(6) NOT NULL CHECK (faculty_gender IN ('Male', 'Female', 'Other')),
    faculty_address VARCHAR(100) NOT NULL,
    faculty_phonenumber VARCHAR(15) NOT NULL,
    faculty_email VARCHAR(50) UNIQUE NOT NULL,
    department_id INT NOT NULL,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

-- Class Table: Represents classes taught by faculty.
CREATE TABLE IF NOT EXISTS class (
    class_id INT PRIMARY KEY NOT NULL,
    class_name VARCHAR(100) NOT NULL,
    faculty_id INT NOT NULL,
    FOREIGN KEY (faculty_id) REFERENCES faculty(faculty_id)
);

-- Student Table: Contains details of enrolled students.
CREATE TABLE IF NOT EXISTS student (
    student_id INT PRIMARY KEY NOT NULL,
    student_name VARCHAR(50) NOT NULL,
    student_dob DATE NOT NULL,
    student_gender VARCHAR(6) NOT NULL CHECK (student_gender IN ('Male', 'Female', 'Other')),
    student_address VARCHAR(100) NOT NULL,
    student_phonenumber VARCHAR(15) NOT NULL,
    student_email VARCHAR(50) UNIQUE NOT NULL,
    branch_id INT NOT NULL,
    class_id INT NOT NULL,
    FOREIGN KEY (branch_id) REFERENCES branch(branch_id),
    FOREIGN KEY (class_id) REFERENCES class(class_id)
);

-- Insert data into Departments table
INSERT INTO Departments (department_id, department_name, description)
VALUES 
    (101, 'CSE', 'Department of Computer Science & Engineering'),
    (102, 'ECE', 'Department of Electronics Communications & Engineering'),
    (103, 'AIML', 'Department of Artificial Intelligence and Machine Learning');

-- Insert data into courses table
INSERT INTO courses (course_id, course_name, course_description, credit_hours, department_id)
VALUES 
    (101, 'Introduction to Programming', 'Basic programming concepts & techniques', 3, 101),
    (102, 'Database Management System', 'Introduction to database design and management', 3, 101),
    (103, 'Electric Circuits', 'Explaining concepts of system circuits', 2, 102);

-- Insert data into hod table
INSERT INTO hod (hod_id, hod_name, hod_dob, hod_gender, hod_address, hod_phonenumber, hod_email, department_id) 
VALUES 
    (101, 'Ram', '1980-01-01', 'Male', '1-2-3/5th Street/Hyd', '9876543210', 'ram@gmail.com', 101),
    (102, 'Krishna', '1999-05-06', 'Male', '8-8-3/2nd Street/Hyd', '8786543210', 'krishna@gmail.com', 102),
    (103, 'Sita', '1995-09-12', 'Female', '5-2/11th Street/Hyd', '9876543566', 'sita@gmail.com', 103);

-- Insert data into branch table
INSERT INTO branch (branch_id, branch_name, hod_id)
VALUES 
    (101, 'CSE', 101),
    (102, 'ECE', 102);

-- Insert data into faculty table
INSERT INTO faculty (faculty_id, faculty_name, faculty_dob, faculty_gender, faculty_address, faculty_phonenumber, faculty_email, department_id)
VALUES 
    (1, 'Arjun', '1975-08-31', 'Male', '4th House/2nd Lane Down Street', '9988776655', 'arjun@gmail.com', 101),
    (2, 'Nakul', '1973-11-23', 'Male', '7th House/9th Lane Texas', '9988789895', 'nakul@gmail.com', 102);

-- Insert data into class table
INSERT INTO class (class_id, class_name, faculty_id)
VALUES 
    (1, 'Introduction to Programming', 1),
    (2, 'Database Management System', 1);

-- Insert data into student table
INSERT INTO student (student_id, student_name, student_dob, student_gender, student_address, student_phonenumber, student_email, branch_id, class_id)
VALUES 
    (111, 'Anurag', '2004-04-14', 'Male', '60/A/Bk Guda/Hyd', '9347629999', 'anurag@gmail.com', 101, 1),
    (112, 'Charan', '2004-05-15', 'Male', '60/A/Kodhad/Hyd', '9347629994', 'charan@gmail.com', 101, 1),
    (113, 'Harsha', '2004-06-23', 'Male', '40/A/Kukatpally/Hyd', '9347629993', 'harsha@gmail.com', 101, 1),
    (114, 'Lalith', '2004-06-16', 'Male', '50/A/Moosapet/Hyd', '9347629992', 'lalith@gmail.com', 102, 2),
    (115, 'Hemanth', '2004-01-01', 'Male', '30/A/Film Nagar/Hyd', '9347629991', 'hemanth@gmail.com', 102, 2);
    
    
    
   
