# 🎓 College DBMS Project

### 📋 **Project Description**
This project implements a **College Database Management System** (DBMS) that organizes and manages data for departments, courses, heads of departments, faculty, classes, and students. It provides structured SQL queries to create tables, insert data, and establish relationships, making it easier to manage academic data effectively.

---

## ⚙️ **Features**
- 📌 **Department Management**: Store and retrieve department details.
- 📌 **Course Allocation**: Assign courses to departments.
- 📌 **HOD & Faculty Records**: Maintain data for heads of departments and faculty.
- 📌 **Branch Details**: Organize different branches of study under departments.
- 📌 **Student Information**: Manage student records, including class and branch associations.
- 📌 **Class Management**: Map classes to faculty for streamlined operations.

---

## 🛠️ **Technologies Used**
- **Database**: MySQL / PostgreSQL (any SQL-based system)
- **Language**: SQL
- **Tools**: DBMS tool (e.g., MySQL Workbench, pgAdmin)
- **Concepts**: Relational Database Management, Primary Keys, Foreign Keys, Constraints

---

## 🚀 **Database Schema**
The following tables and relationships are implemented:

```plaintext
+-------------------+      +------------------+       +-----------------+
|   department      |      |     courses      |       |      hod        |
+-------------------+      +------------------+       +-----------------+
| department_id (PK)|<---->| department_id (FK)|<---->| department_id (FK) 
| department_name   |      | course_id (PK)   |       | hod_id (PK)     |
| description       |      | course_name      |       | hod_name        |
+-------------------+      | credit_hours     |       | hod_email (UQ)  |
                           +------------------+       +-----------------+


🎉 If you liked the project, don't forget to star ⭐ the repository!
