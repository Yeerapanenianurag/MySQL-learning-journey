CREATE DATABASE college_databse;
USE college_databse;

-- Department Table: Stores information about different departments in the college.
CREATE TABLE department (
    department_id INT PRIMARY KEY NOT NULL,
    department_name VARCHAR(20) NOT NULL,
    description VARCHAR(200) NOT NULL
);

-- Courses Table: Contains details of the courses offered by each department.
CREATE TABLE courses (
    course_id INT PRIMARY KEY NOT NULL,
    course_name VARCHAR(20) NOT NULL,
    course_description VARCHAR(255) NOT NULL,
    credit_hours INT NOT NULL,
    department_id INT NOT NULL,
    FOREIGN KEY (department_id) REFERENCES department(department_id)
);

-- HOD Table: Holds information about the heads of departments.
CREATE TABLE hod (
    hod_id INT PRIMARY KEY NOT NULL,
    hod_name VARCHAR(20) NOT NULL,
    hod_dob DATE NOT NULL,
    hod_gender VARCHAR(6) NOT NULL CHECK (hod_gender IN ('Male', 'Female', 'Other')),
    hod_address VARCHAR(100) NOT NULL,
    hod_phonenumber VARCHAR(15) NOT NULL,
    hod_email VARCHAR(50) UNIQUE NOT NULL,
    department_id INT NOT NULL,
    FOREIGN KEY (department_id) REFERENCES department(department_id)
);

-- Branch Table: Represents different branches of study within departments.
CREATE TABLE branch (
    branch_id INT PRIMARY KEY NOT NULL,
    branch_name VARCHAR(20) NOT NULL,
    hod_id INT NOT NULL,
    FOREIGN KEY (hod_id) REFERENCES hod(hod_id)
);

-- Faculty Table: Stores information about faculty members.
CREATE TABLE faculty (
    faculty_id INT PRIMARY KEY NOT NULL,
    faculty_name VARCHAR(20) NOT NULL,
    faculty_dob DATE NOT NULL,
    faculty_gender VARCHAR(6) NOT NULL CHECK (faculty_gender IN ('Male', 'Female', 'Other')),
    faculty_address VARCHAR(100) NOT NULL,
    faculty_phonenumber VARCHAR(15) NOT NULL,
    faculty_email VARCHAR(50) UNIQUE NOT NULL,
    department_id INT NOT NULL,
    FOREIGN KEY (department_id) REFERENCES department(department_id)
);

-- Class Table: Represents classes taught by faculty.
CREATE TABLE class (
    class_id INT PRIMARY KEY NOT NULL,
    class_name VARCHAR(50) NOT NULL,
    faculty_id INT NOT NULL,
    FOREIGN KEY (faculty_id) REFERENCES faculty(faculty_id)
);

-- Student Table: Contains details of enrolled students.
CREATE TABLE student (
    student_id INT PRIMARY KEY NOT NULL,
    student_name VARCHAR(20) NOT NULL,
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

-- Insert data into department table
INSERT INTO department (department_id, department_name, description)
VALUES (1, 'Computer Science', 'Department of Computer Science'),
       (2, 'Electrical Engineering', 'Department of Electrical Engineering'),
       (3, 'Mechanical Engineering', 'Department of Mechanical Engineering');

-- Insert data into courses table
INSERT INTO courses (course_id, course_name, course_description, credit_hours, department_id)
VALUES (1, 'Introduction to Programming', 'Basic programming concepts and techniques', 3, 1),
       (2, 'Database Management Systems', 'Introduction to database design and management', 3, 1),
       (3, 'Electrical Circuits', 'Fundamental principles of electrical circuits', 4, 2);

-- Insert data into hod table
INSERT INTO hod (hod_id, hod_name, hod_dob, hod_gender, hod_address, hod_phonenumber, hod_email, department_id)
VALUES (1, 'John Doe', '1990-05-15', 'Male', '123 Main St, City', '1234567890', 'john.doe@example.com', 1),
       (2, 'Jane Smith', '1985-08-20', 'Female', '456 Elm St, Town', '0987654321', 'jane.smith@example.com', 2);

-- Insert data into branch table
INSERT INTO branch (branch_id, branch_name, hod_id)
VALUES (1, 'Computer Science', 1),
       (2, 'Electrical Engineering', 2);

-- Insert data into faculty table
INSERT INTO faculty (faculty_id, faculty_name, faculty_dob, faculty_gender, faculty_address, faculty_phonenumber, faculty_email, department_id)
VALUES (1, 'David Johnson', '1980-10-25', 'Male', '789 Oak St, Village', '4561237890', 'david.johnson@example.com', 1),
       (2, 'Emily Brown', '1975-03-12', 'Female', '987 Pine St, County', '7893216540', 'emily.brown@example.com', 2);

-- Insert data into class table
INSERT INTO class (class_id, class_name, faculty_id)
VALUES (1, 'Introduction to Programming', 1),
       (2, 'Database Management Systems', 1);

-- Insert data into student table
INSERT INTO student (student_id, student_name, student_dob, student_gender, student_address, student_phonenumber, student_email, branch_id, class_id)
VALUES (1, 'Michael Smith', '2000-02-10', 'Male', '101 Cedar St, Town', '1234567890', 'michael.smith@example.com', 1, 1),
       (2, 'Sophia Johnson', '1999-07-15', 'Female', '202 Maple St, City', '9876543210', 'sophia.johnson@example.com', 2, 2);