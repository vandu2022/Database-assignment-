create database industry;
use industry;
Create table employees(
emp_id int not null primary key,
emp_name text not null,
age int check (age>=18),
email text (30),
salary decimal default 30000
);
#Q2 Constraints
# Primary key constraint
#purpose: ensure that each recoed in table has unique identifier, primary key cannot contain null values
create table emp(
emp_id int primary key,
emp_name text not null
);
#foreign key constraints
#purpose: ensures that values in column corresponds to valid entries in another table maintaining the relationship between tables.
create table orders(
order_id int primary key,
emp_id int,
foreign key (emp_id) references emp (emp_id))
# not null, check, default.
Create table emp_info(
emp_id int not null primary key,
emp_name text not null,
age int check (age>=18),
email text (30),
salary decimal default 30000
);
#Q3.
# the not null values is aplies when you want to ensure that every row in the tabel has a valid
# meaningfull value in the column. prevents the columns from containg null values.
# Primary key cannot contain null values.alter
create table emp_record(
emp_id varchar(10),
emp_names char (10) not null,
emp_mail text
);
#Q4 adding constraints
alter table emp;
add constraint not null (emp_id);
#remove constraints
alter table emp;
drop constraint not null;
select * from emp;
# Q5 
# insertion violation: 1) trying to insrt null value into column has not null constraints
# 2) inserting duplicate value in column having constraints primary key or unique.
# 3) inserting data that does not satisfy condition specified by check constraint
# updtae violation: 1) attempting a update columntaht is a foreign key but the new value does not exist in reference table
# 2) attempting to update a column that is violating check constraint
# delete Violations : 1) attemptinf to delete a rows that is referenced by another table's foreign key.
# 2)if the on deete cascade option is not set anda row with referenced fpreign key is deleted the databese will regect 
# the operation unless the foreign key constraint is explicitely handeled
# Q6 
create table products(
product_id int,
product_name varchar(50),
price decimal (10,2)
);
alter table products;
add constraint primary key (product_id;
alter table products;
add constraint default(50)(price);
select * from products;
# Q7
create table students(
student_id int primary key,
student_name varchar(20),
class_id int
);
insert into students( student_id,student_name, class_id)
values (1," Alice",101),
(2,"bob", 102),
(3,"charlie",101);
select * from students
create table classes(
class_id int, 
class_name varchar(20)
);
select *from classes
insert into classes ( class_id, class_name)
values (101, "math"),
(102, "science"),
(103,"history");
select * from classes
select students.student_name, classes.class_name
from students
inner join classes on students.class_id = classes.class_id;
create table sales(
sale_id int,
product_id int,
amount int
);
insert into sales (sale_id, product_id, amount)
value( 1,101,500),
(2,102,300),
(3,103,700);
select * from sales;
#Q.8
create table customers(
customer_id int,
 customer_name varchar(10)
);
insert into customers ( customer_id, customer_name)
values(101, "alice"),
(102,"bob");
create table orders(
order_id int,
order_date date,
customer_id int
);
drop table products;
create table products (
product_id int,
product_name varchar(20),
order_id int
);
select * from customers;
insert into orders( order_id,order_date, customer_id)
values(1,'2024-01-01',101),
(2,'2024-01-03',102);
drop table order_info;
select * from orders;
insert into products ( product_id, product_name, order_id)
values(1,'laptop',1),
(2,'phone');
# Q9
create table product_info(
product_id int, product_name varchar(10)
);
insert into product_info (product_id,product_name)
values (101,"laptop"),
(102, "phone");
# Q 10
select * from orders;
select * from customers;
create table order_details (
order_id int,
product_id int,
quantity int
);
insert into product_details( order_id, product_id, quantity)
values (1,101,2),
(1,102,1),
(2,101,3);
select 
orders.order_id,
customers.customer_name,
sum(order_details.quantity) as toal_quantity
from
orders
inner join customers on orders.customer_id = customers.customer_id
inner join order_details on orders.order_id = order_details.order_id
group by
orders.order_id, customers.customer_name;



