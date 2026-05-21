Question : INNER JOIN, OUTER JOIN, LEFT OUTER JOIN.

mysql> -- Step 1: Create Database
mysql> CREATE DATABASE StudentManagementSystem;
Query OK, 1 row affected (0.11 sec)

mysql> -- Step 2: Use Database
mysql> USE StudentManagementSystem;
Database changed
mysql> -- Step 3: Create Student Table
mysql> CREATE TABLE Student (StudentId INT PRIMARY KEY,FirstName VARCHAR(50),LastName VARCHAR(50));
Query OK, 0 rows affected (0.09 sec)

mysql> -- Step 4: Create Course Table
mysql> CREATE TABLE Course (CourseId INT PRIMARY KEY,CourseName VARCHAR(100));
Query OK, 0 rows affected (0.03 sec)

mysql> -- Step 5: Create Enrollment Table
mysql> CREATE TABLE Enrollment (EnrollmentID INT PRIMARY KEY,StudentID INT,CourseID INT,FOREIGN KEY (StudentID) REFERENCES Student(StudentId),FOREIGN KEY (CourseID) REFERENCES Course(CourseId));
Query OK, 0 rows affected (0.07 sec)

mysql> DESC Student;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| StudentId | int         | NO   | PRI | NULL    |       |
| FirstName | varchar(50) | YES  |     | NULL    |       |
| LastName  | varchar(50) | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
3 rows in set (0.04 sec)

mysql> DESC Course;
+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| CourseId   | int          | NO   | PRI | NULL    |       |
| CourseName | varchar(100) | YES  |     | NULL    |       |
+------------+--------------+------+-----+---------+-------+
2 rows in set (0.01 sec)

mysql> DESC Enrollment;
+--------------+------+------+-----+---------+-------+
| Field        | Type | Null | Key | Default | Extra |
+--------------+------+------+-----+---------+-------+
| EnrollmentID | int  | NO   | PRI | NULL    |       |
| StudentID    | int  | YES  | MUL | NULL    |       |
| CourseID     | int  | YES  | MUL | NULL    |       |
+--------------+------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> -- Step 6: Insert Data into Student Table
mysql> INSERT INTO Student (StudentId, FirstName, LastName)VALUES(1, 'Mahendra', 'Naidu'),(2, 'Renuka','Salunkhe'),(3,'Pranjal','Nannaware');
Query OK, 3 rows affected (0.03 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> -- Step 7: Insert Data into Course Table
mysql> INSERT INTO Course (CourseId, CourseName)VALUES(101, 'DBMS'),(102, 'Web Development'),(103, 'Data Structures');
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM Student;
+-----------+-----------+----------+
| StudentId | FirstName | LastName |
+-----------+-----------+----------+
|         1 | Mahendra  | Naidu    |
|         2 | Renuka    | Salunkhe |
|         3 | Pranjal   | Nannaware|
+-----------+-----------+----------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM Course;
+----------+---------------------+
| CourseId | CourseName          |
+----------+---------------------+
|      101 | DBMS                |
|      102 | Web Development     |
|      103 | Data Structures     |
+----------+---------------------+
3 rows in set (0.01 sec)

mysql> -- Step 8: Insert Data into Enrollment Table
mysql> INSERT INTO Enrollment (EnrollmentID, StudentID, CourseID)VALUES(1, 1, 101),(2, 1, 102),(3, 2, 103),(4, 3, 101);
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM Enrollment;
+--------------+-----------+----------+
| EnrollmentID | StudentID | CourseID |
+--------------+-----------+----------+
|            1 |         1 |      101 |
|            2 |         1 |      102 |
|            3 |         2 |      103 |
|            4 |         3 |      101 |
+--------------+-----------+----------+
4 rows in set (0.00 sec)

mysql> -- Step 9: INNER JOIN Query
mysql> -- Purpose: Generate list of student-course combinations
mysql> SELECT Student.StudentId,Student.FirstName,Student.LastName,Course.CourseId,Course.CourseName FROM Enrollment INNER JOIN Student ON Enrollment.StudentID = Student.StudentId INNER JOIN Course ON Enrollment.CourseID = Course.CourseId;
+-----------+-----------+----------+----------+---------------------+
| StudentId | FirstName | LastName | CourseId | CourseName          |
+-----------+-----------+----------+----------+---------------------+
|         1 | Mahendra  | Naidu    |      101 | DBMS                |
|         1 | Mahendra  | Naidu    |      102 | Web Development     |
|         2 | Renuka    | Salunkhe |      103 | Data Structures     |
|         3 | Pranjal   | Nannaware|      101 | Database Management |
+-----------+-----------+----------+----------+---------------------+
4 rows in set (0.00 sec)
