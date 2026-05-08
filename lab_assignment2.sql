LAB2 - Database Schema : Consider a simple databse with one tables: BankAccount

table : columns : account_id(primary key),account_holder_name,account_balance.
 
mysql> create database bank;
Query OK, 1 row affected (0.02 sec)

mysql> use bank;
Database changed
mysql> create table BankAccount(account_id varchar(20) not null primary key,account_holder_name varchar(20) not null,account_balance double not null);
Query OK, 0 rows affected (0.04 sec)

Task 1: Insert Data

Description: Write an SQL INSERT statement to add records into the BankAccount table. The data should include values for account_id, account_holder_name, and account_balance.
Purpose: To add new account records into the BankAccount table with details such as account ID, account holder name, and account balance.

mysql> insert into BankAccount values('101','Mahendra',89999.90);
Query OK, 1 row affected (0.01 sec)
mysql> insert into BankAccount values('102','Renuka',95000),('103','Samarth',8654.23),('104','Aaditya',65234.00),('105','Daksh',91234.5),('106','Archita',8000),('107','Pranjal',23456.7);
Query OK, 6 rows affected (0.01 sec)
Records: 6  Duplicates: 0  Warnings: 0

Task 2: Retrieving Data

Description: Write an SQL SELECT statement to display the account_holder_name and account_balance of all account holders from the BankAccount table.
Purpose: To display the account holder names and their corresponding account balances from the BankAccount table for viewing account information.

mysql> SELECT account_holder_name,account_balance from BankAccount;
+---------------------+-----------------+
| account_holder_name | account_balance |
+---------------------+-----------------+
| Mahendra            |         89999.9 |
| Renuka              |           95000 |
| Samarth             |         8654.23 |
| Aaditya             |           65234 |
| Daksh               |         91234.5 |
| Archita             |            8000 |
| Pranjal             |         23456.7 |
+---------------------+-----------------+
7 rows in set (0.00 sec)


Task 3: Filtering Data

Description: Write an SQL SELECT statement to retrieve the account_holder_name and account_balance of account holders whose account_balance is greater than 30,000.
Purpose: To retrieve only those account holders whose account balance is greater than 30,000, helping in filtering high-balance accounts.

mysql> SELECT account_holder_name,account_balance from BankAccount WHERE account_balance > 30000;
+---------------------+-----------------+
| account_holder_name | account_balance |
+---------------------+-----------------+
| Mahendra            |         89999.9 |
| Renuka              |           95000 |
| Aaditya             |           65234 |
| Daksh               |         91234.5 |
+---------------------+-----------------+
4 rows in set (0.00 sec)


Task 4: Updating Data

Description: Write an SQL UPDATE statement to modify the account_balance of the account holder whose account_id is 101.
Purpose: To modify or update the account balance of a specific account holder whose account ID is 101 in the BankAccount table.

mysql> SELECT * from BankAccount WHERE account_id = '101';
+------------+---------------------+-----------------+
| account_id | account_holder_name | account_balance |
+------------+---------------------+-----------------+
| 101        | Mahendra            |         89999.9 |
+------------+---------------------+-----------------+
1 row in set (0.00 sec)

mysql> UPDATE BankAccount SET account_balance = 23789.90 WHERE account_id = '101';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * from BankAccount WHERE account_id = '101';
+------------+---------------------+-----------------+
| account_id | account_holder_name | account_balance |
+------------+---------------------+-----------------+
| 101        | Mahendra            |         23789.9 |
+------------+---------------------+-----------------+
1 row in set (0.00 sec)
