*/question : Aggregation , ORDER BY , GROUP BY , HAVING clauses. /*

*/ Answer :  
mysql> show databases;
+--------------------+
| Database           |
+--------------------+            
| bank               |
| customer           |
| ecom               |
| energy_db          |
| information_schema |
| max                |
| mysql              |
| performance_schema |
| sakila             |
| student_management |
| sys                |
| world              |
+--------------------+
13 rows in set (0.02 sec)

mysql> use customer;
Database changed
mysql> show tables;
+--------------------+
| Tables_in_customer |
+--------------------+
| customer           |
| orders             |
+--------------------+
2 rows in set (0.01 sec)

mysql> select * from customer;
+---------+---------+---------------+-------------------+---------------+------------+---------+---------+---------+---------+
| cust_id | name    | city          | email             | address       | phone_no   | pincode | bill_no | state   | country |
+---------+---------+---------------+-------------------+---------------+------------+---------+---------+---------+---------+
| c101    | abc     | kalyan        | abc@gmail.com     | hanuman nagar | 9898765432 |  421306 |      20 | chennai | india   |
| c102    | def     | thane         | def@gmail.com     | bhagwan nagar | 9865743210 |  428709 |      30 | kerala  | india   |
| c103    | ghi     | mumbai        | ghi@gmail.com     | farida gaon   | 9887654319 |  454329 |       4 | tamil   | india   |
| c104    | jkl     | ulhasnagar    | jkl@gmail.com     | katemanivili  | 9876542109 |  423187 |       3 | andra p | india   |
| c105    | mahi    | krishna nagar | mahi@gmail.com    | chinchpada    | 8923745612 |  487354 |       7 | gujarat | india   |
| c106    | daksh   | khadakpada    | daksh@gmail.com   | wayle nagar   | 8712345689 |  421308 |       4 | bengal  | india   |
| c107    | archita | khadakpada    | archita@gmail.com | wayle nagar   | 8745362190 |  410235 |       2 | bengal  | india   |
+---------+---------+---------------+-------------------+---------------+------------+---------+---------+---------+---------+
7 rows in set (0.02 sec)

mysql> select * from orders;
+----------+---------+------------+----------+-------------+---------------+--------------+------------+--------------+
| order_id | cust_id | product_id | quantity | total_price | selling_price | payment_mode | order_date | order_status |
+----------+---------+------------+----------+-------------+---------------+--------------+------------+--------------+
| 101      | c101    | 3456       |        5 |     8900.89 |       7800.45 | G-pay        | 2026-05-01 | completed    |
+----------+---------+------------+----------+-------------+---------------+--------------+------------+--------------+
1 row in set (0.01 sec)

mysql> insert into orders values('102','c102','2312',7,9000.23,8000.23,'G-pay','2026-05-01','completed');
Query OK, 1 row affected (0.02 sec)

mysql> insert into orders values('103','c103','1878',8,5600.90,5000.23,'Cash','2026-05-02','completed');
Query OK, 1 row affected (0.06 sec)

mysql> insert into orders values('104','c104','4541',10,10000.45,9500.90,'Cash','2026-05-02','completed');
Query OK, 1 row affected (0.07 sec)

mysql> insert into orders values('105','c105','1442',6,7200.32,8000.45,'Cash','2026-05-03','completed');
Query OK, 1 row affected (0.01 sec)

mysql> create database aggregation;
Query OK, 1 row affected (0.07 sec)

mysql> use aggregation;
Database changed
mysql> create table orders(order_id varchar(10) not null primary key,product_name varchar(20) not null,original_price double not null, selling_price double not null);
Query OK, 0 rows affected (0.05 sec)

mysql> create table products(product_id varchar(10) not null primary key,product_name varchar(20) not null,original_price double not null, selling_price double not null);
Query OK, 0 rows affected (0.04 sec)

mysql> alter table products add column category varchar(20) not null;
Query OK, 0 rows affected (0.09 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table products add column stock int not null;
Query OK, 0 rows affected (0.07 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc products;
+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| product_id     | varchar(10) | NO   | PRI | NULL    |       |
| product_name   | varchar(20) | NO   |     | NULL    |       |
| original_price | double      | NO   |     | NULL    |       |
| selling_price  | double      | NO   |     | NULL    |       |
| category       | varchar(20) | NO   |     | NULL    |       |
| stock          | int         | NO   |     | NULL    |       |
+----------------+-------------+------+-----+---------+-------+
6 rows in set (0.01 sec)

mysql> insert into products values('p101','Study Table',7000.90,6000.21,'furniture',2),('p102','Colgate',320.12,300.10,'daily essentials',4),('p103','mobile phone',25000.90,20000.21,'electronics',10),('p104','jeans',3000,2500.86,'clothing',10),('p105','book',450.00,400,'study material',10);
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from products;
+------------+--------------+----------------+---------------+------------------+-------+
| product_id | product_name | original_price | selling_price | category         | stock |
+------------+--------------+----------------+---------------+------------------+-------+
| p101       | Study Table  |         7000.9 |       6000.21 | furniture        |     2 |
| p102       | Colgate      |         320.12 |         300.1 | daily essentials |     4 |
| p103       | mobile phone |        25000.9 |      20000.21 | electronics      |    10 |
| p104       | jeans        |           3000 |       2500.86 | clothing         |    10 |
| p105       | book         |            450 |           400 | study material   |    10 |
+------------+--------------+----------------+---------------+------------------+-------+
5 rows in set (0.00 sec)

mysql> select sum(selling_price) from products;
+--------------------+
| sum(selling_price) |
+--------------------+
|           29201.38 |
+--------------------+
1 row in set (0.01 sec)

mysql> select avg(selling_price) from products;
+--------------------+
| avg(selling_price) |
+--------------------+
|           5840.276 |
+--------------------+
1 row in set (0.00 sec)

mysql> select max(stock) from products;
+------------+
| max(stock) |
+------------+
|         10 |
+------------+
1 row in set (0.00 sec)

mysql> select min(stock) from products;
+------------+
| min(stock) |
+------------+
|          2 |
+------------+
1 row in set (0.00 sec)

mysql> select count(selling_price) from products;
+----------------------+
| count(selling_price) |
+----------------------+
|                    5 |
+----------------------+
1 row in set (0.06 sec)

mysql> select count(*) from products;
+----------+
| count(*) |
+----------+
|        5 |
+----------+
1 row in set (0.01 sec)

mysql> select * from products order by stock;
+------------+--------------+----------------+---------------+------------------+-------+
| product_id | product_name | original_price | selling_price | category         | stock |
+------------+--------------+----------------+---------------+------------------+-------+
| p101       | Study Table  |         7000.9 |       6000.21 | furniture        |     2 |
| p102       | Colgate      |         320.12 |         300.1 | daily essentials |     4 |
| p103       | mobile phone |        25000.9 |      20000.21 | electronics      |    10 |
| p104       | jeans        |           3000 |       2500.86 | clothing         |    10 |
| p105       | book         |            450 |           400 | study material   |    10 |
+------------+--------------+----------------+---------------+------------------+-------+
5 rows in set (0.00 sec)

mysql> select * from products order by stock desc limit 3;
+------------+--------------+----------------+---------------+----------------+-------+
| product_id | product_name | original_price | selling_price | category       | stock |
+------------+--------------+----------------+---------------+----------------+-------+
| p103       | mobile phone |        25000.9 |      20000.21 | electronics    |    10 |
| p104       | jeans        |           3000 |       2500.86 | clothing       |    10 |
| p105       | book         |            450 |           400 | study material |    10 |
+------------+--------------+----------------+---------------+----------------+-------+
3 rows in set (0.00 sec)

mysql> create table employee(employee_id varchar(10) not null primary key,employee_name varchar(20) not null,dept varchar(20) not null, salary double not null);
Query OK, 0 rows affected (0.10 sec)

mysql> insert into employee values('E101','Mahi','Finance',50000),('E102','Samarth','IT',30000.10),('E103','Aaditya','HR',20000.21),('E104','Renuka','IT',30000),('E105','Pranjal','HR',18000.90);
Query OK, 5 rows affected (0.07 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select dept,count(*) AS Total_employees FROM employee GROUP BY dept;
+---------+-----------------+
| dept    | Total_employees |
+---------+-----------------+
| Finance |               1 |
| IT      |               2 |
| HR      |               2 |
+---------+-----------------+
3 rows in set (0.00 sec)

mysql> select dept,sum(salary) AS Total_salary FROM employee GROUP BY dept;
+---------+--------------+
| dept    | Total_salary |
+---------+--------------+
| Finance |        50000 |
| IT      |      60000.1 |
| HR      |     38001.11 |
+---------+--------------+
3 rows in set (0.00 sec)

mysql> select dept,avg(salary) AS avg_salary FROM employee GROUP BY dept;
+---------+------------+
| dept    | avg_salary |
+---------+------------+
| Finance |      50000 |
| IT      |   30000.05 |
| HR      |  19000.555 |
+---------+------------+
3 rows in set (0.00 sec)

mysql> select dept,salary,count(*) FROM employee GROUP BY dept,salary;
+---------+----------+----------+
| dept    | salary   | count(*) |
+---------+----------+----------+
| Finance |    50000 |        1 |
| IT      |  30000.1 |        1 |
| HR      | 20000.21 |        1 |
| IT      |    30000 |        1 |
| HR      |  18000.9 |        1 |
+---------+----------+----------+
5 rows in set (0.00 sec)

mysql> select * from employee;
+-------------+---------------+---------+----------+
| employee_id | employee_name | dept    | salary   |
+-------------+---------------+---------+----------+
| E101        | Mahi          | Finance |    50000 |
| E102        | Samarth       | IT      |  30000.1 |
| E103        | Aaditya       | HR      | 20000.21 |
| E104        | Renuka        | IT      |    30000 |
| E105        | Pranjal       | HR      |  18000.9 |
+-------------+---------------+---------+----------+
5 rows in set (0.00 sec)

mysql> select dept,count(*) as total_employee from employee group by dept having count(*)>1;
+------+----------------+
| dept | total_employee |
+------+----------------+
| IT   |              2 |
| HR   |              2 |
+------+----------------+
2 rows in set (0.00 sec)

mysql> select dept,sum(salary) as total_salary from employee group by dept having sum(salary)>20000;
+---------+--------------+
| dept    | total_salary |
+---------+--------------+
| Finance |        50000 |
| IT      |      60000.1 |
| HR      |     38001.11 |
+---------+--------------+
3 rows in set (0.00 sec)

mysql> select dept,sum(salary) as total_salary from employee group by dept having sum(salary)>50000;
+------+--------------+
| dept | total_salary |
+------+--------------+
| IT   |      60000.1 |
+------+--------------+
1 row in set (0.00 sec)

mysql> select dept,avg(salary) as avg_salary from employee group by dept having avg(salary)>20000;
+---------+------------+
| dept    | avg_salary |
+---------+------------+
| Finance |      50000 |
| IT      |   30000.05 |
+---------+------------+
2 rows in set (0.00 sec)

mysql> alter table employee rename to employees;
Query OK, 0 rows affected (0.10 sec)

mysql> select * from employee;
ERROR 1146 (42S02): Table 'aggregation.employee' doesn't exist
mysql> select * from employees;
+-------------+---------------+---------+----------+
| employee_id | employee_name | dept    | salary   |
+-------------+---------------+---------+----------+
| E101        | Mahi          | Finance |    50000 |
| E102        | Samarth       | IT      |  30000.1 |
| E103        | Aaditya       | HR      | 20000.21 |
| E104        | Renuka        | IT      |    30000 |
| E105        | Pranjal       | HR      |  18000.9 |
+-------------+---------------+---------+----------+
5 rows in set (0.00 sec)
