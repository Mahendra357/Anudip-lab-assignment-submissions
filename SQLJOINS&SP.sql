*/ Question : SQL JOINS and Stored Procedure. /*
*/ ans : /*

mysql> create database joins;
Query OK, 1 row affected (0.01 sec)

mysql> use joins;
Database changed
mysql> create table department(dept_id int not null primary key,dept_name varchar(30) not null);
Query OK, 0 rows affected (0.06 sec)

mysql> desc department;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| dept_id   | int         | NO   | PRI | NULL    |       |
| dept_name | varchar(30) | NO   |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
2 rows in set (0.01 sec)

mysql> insert into department values (1,'HR'),(2,'IT'),(3,'FINANCE'),(4,'MARKETING');
Query OK, 4 rows affected (0.07 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> create table EMPLOYEE(employee_id int not null primary key,employee_name varch r(30) not null,dept_id int , foreign key (dept_id) references department (dept_id));
Query OK, 0 rows affected (0.12 sec)

mysql> desc employee;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| employee_id   | int         | NO   | PRI | NULL    |       |
| employee_name | varchar(30) | NO   |     | NULL    |       |
| dept_id       | int         | YES  | MUL | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> insert into employee values (101,'pranjal',1),(102,'Mahendra',2),(103,'Samarth',3),(104,'Renuka',4),(105,'aaditya',null);
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from employee;
+-------------+---------------+---------+
| employee_id | employee_name | dept_id |
+-------------+---------------+---------+
|         101 | pranjal       |       1 |
|         102 | Mahendra      |       2 |
|         103 | Samarth       |       3 |
|         104 | Renuka        |       4 |
|         105 | aaditya       |    NULL |
+-------------+---------------+---------+
5 rows in set (0.00 sec)

mysql> select * from department;
+---------+-----------+
| dept_id | dept_name |
+---------+-----------+
|       1 | HR        |
|       2 | IT        |
|       3 | FINANCE   |
|       4 | MARKETING |
+---------+-----------+
4 rows in set (0.00 sec)

mysql> select employee_name , dept_name from employee inner join department on employee.dept_id=department.dept_id;
+---------------+-----------+
| employee_name | dept_name |
+---------------+-----------+
| pranjal       | HR        |
| Mahendra      | IT        |
| Samarth       | FINANCE   |
| Renuka        | MARKETING |
+---------------+-----------+
4 rows in set (0.00 sec)

mysql> select employee_name , dept_name from employee left join department on employee.dept_id=department.dept_id;
+---------------+-----------+
| employee_name | dept_name |
+---------------+-----------+
| pranjal       | HR        |
| Mahendra      | IT        |
| Samarth       | FINANCE   |
| Renuka        | MARKETING |
| aaditya       | NULL      |
+---------------+-----------+
5 rows in set (0.00 sec)

mysql> select employee_name , dept_name from employee right join department on employee.dept_id=department.dept_id;
+---------------+-----------+
| employee_name | dept_name |
+---------------+-----------+
| pranjal       | HR        |
| Mahendra      | IT        |
| Samarth       | FINANCE   |
| Renuka        | MARKETING |
+---------------+-----------+
4 rows in set (0.00 sec)

mysql> select employee_name , dept_name from employee full join department;
+---------------+-----------+
| employee_name | dept_name |
+---------------+-----------+
| pranjal       | MARKETING |
| pranjal       | FINANCE   |
| pranjal       | IT        |
| pranjal       | HR        |
| Mahendra      | MARKETING |
| Mahendra      | FINANCE   |
| Mahendra      | IT        |
| Mahendra      | HR        |
| Samarth       | MARKETING |
| Samarth       | FINANCE   |
| Samarth       | IT        |
| Samarth       | HR        |
| Renuka        | MARKETING |
| Renuka        | FINANCE   |
| Renuka        | IT        |
| Renuka        | HR        |
| aaditya       | MARKETING |
| aaditya       | FINANCE   |
| aaditya       | IT        |
| aaditya       | HR        |
+---------------+-----------+
20 rows in set, 1 warning (0.00 sec)

mysql> select employee_name , dept_name from employee cross join department;
+---------------+-----------+
| employee_name | dept_name |
+---------------+-----------+
| pranjal       | MARKETING |
| pranjal       | FINANCE   |
| pranjal       | IT        |
| pranjal       | HR        |
| Mahendra      | MARKETING |
| Mahendra      | FINANCE   |
| Mahendra      | IT        |
| Mahendra      | HR        |
| Samarth       | MARKETING |
| Samarth       | FINANCE   |
| Samarth       | IT        |
| Samarth       | HR        |
| Renuka        | MARKETING |
| Renuka        | FINANCE   |
| Renuka        | IT        |
| Renuka        | HR        |
| aaditya       | MARKETING |
| aaditya       | FINANCE   |
| aaditya       | IT        |
| aaditya       | HR        |
+---------------+-----------+
20 rows in set (0.00 sec)

mysql> select * from employee right join department on employee.dept_id=department.dept_id;
+-------------+---------------+---------+---------+-----------+
| employee_id | employee_name | dept_id | dept_id | dept_name |
+-------------+---------------+---------+---------+-----------+
|         101 | pranjal       |       1 |       1 | HR        |
|         102 | Mahendra      |       2 |       2 | IT        |
|         103 | Samarth       |       3 |       3 | FINANCE   |
|         104 | Renuka        |       4 |       4 | MARKETING |
+-------------+---------------+---------+---------+-----------+
4 rows in set (0.00 sec)

mysql> create database storepro;
Query OK, 1 row affected (0.01 sec)

mysql> use storepro;
Database changed
mysql> create table employee(empid int not null primary key,name varchar(30) not null,dept varchar(10) not null ,salary int);
Query OK, 0 rows affected (0.04 sec)

mysql> desc employee;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| empid  | int         | NO   | PRI | NULL    |       |
| name   | varchar(30) | NO   |     | NULL    |       |
| dept   | varchar(10) | NO   |     | NULL    |       |
| salary | int         | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> insert into employee values (101,'pranjal','HR',23000),(102,'Mahendra','FINANCE',23000),(103,'Samarth','IT',20000),(104,'Renuka','MARKETING',20000),(105,'aaditya','HR',18000);
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> CREATE PROCEDURE GetEmp()
    -> BEGIN
    ->     SELECT * FROM Employee;
    -> END //
Query OK, 0 rows affected (0.01 sec)

mysql>
mysql> DELIMITER ;
mysql>
mysql> call GetEmp();
+-------+----------+-----------+--------+
| empid | name     | dept      | salary |
+-------+----------+-----------+--------+
|   101 | pranjal  | HR        |  23000 |
|   102 | Mahendra | FINANCE   |  23000 |
|   103 | Samarth  | IT        |  20000 |
|   104 | Renuka   | MARKETING |  20000 |
|   105 | aaditya  | HR        |  18000 |
+-------+----------+-----------+--------+
5 rows in set (0.01 sec)

Query OK, 0 rows affected (0.01 sec)

mysql> ALTER TABLE employee rename to employees;
Query OK, 0 rows affected (0.09 sec)

mysql> DELIMITER //
mysql>
mysql> CREATE PROCEDURE GetEmployee(IN dept_name VARCHAR(50))
    -> BEGIN
    ->     SELECT *
    ->     FROM Employees
    ->     WHERE dept = dept_name;
    -> END //
Query OK, 0 rows affected (0.06 sec)

mysql>
mysql> DELIMITER ;
mysql> call GetEmployee('HR');
+-------+---------+------+--------+
| empid | name    | dept | salary |
+-------+---------+------+--------+
|   101 | pranjal | HR   |  23000 |
|   105 | aaditya | HR   |  18000 |
+-------+---------+------+--------+
2 rows in set (0.01 sec)

Query OK, 0 rows affected (0.01 sec)
mysql>
mysql> DELIMITER //
mysql>
mysql> CREATE PROCEDURE GetEmployeeCount(OUT total INT)
    -> BEGIN
    ->     SELECT COUNT(*) INTO total
    ->     FROM Employees;
    -> END //
Query OK, 0 rows affected (0.01 sec)

mysql>
mysql> DELIMITER ;
mysql>
mysql> call getemployeecount(@total);
Query OK, 1 row affected (0.01 sec)

mysql> select @total;
+--------+
| @total |
+--------+
|      5 |
+--------+
1 row in set (0.01 sec)

mysql> DELIMITER //
mysql>
mysql> CREATE PROCEDURE Add12(
    ->     IN  id INT,
    ->     IN name VARCHAR(50),
    ->     IN dept VARCHAR(50),
    ->     IN salary INT
    -> )
    -> BEGIN
    ->     INSERT INTO Employees(empid, name, dept, salary)
    ->     VALUES(id, name, dept, salary);
    -> END //
Query OK, 0 rows affected (0.01 sec)

mysql>
mysql> DELIMITER ;
mysql>
mysql> call add12(106,'harhsali','IT',20000);
Query OK, 1 row affected (0.07 sec)

mysql> select * from employees;
+-------+----------+-----------+--------+
| empid | name     | dept      | salary |
+-------+----------+-----------+--------+
|   101 | pranjal  | HR        |  23000 |
|   102 | Mahendra | FINANCE   |  23000 |
|   103 | Samarth  | IT        |  20000 |
|   104 | Renuka   | MARKETING |  20000 |
|   105 | aaditya  | HR        |  18000 |
|   106 | harhsali | IT        |  20000 |
+-------+----------+-----------+--------+
6 rows in set (0.00 sec)
