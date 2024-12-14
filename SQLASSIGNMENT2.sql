-- 1. Create a database called "Sales"
create database SALES;
use SALES;

-- 2. Create a table named "Orders" 
CREATE TABLE ORDERS (
    ORDER_ID int auto_increment,
    CUSTOMER_NAME varchar(50) not null ,
    PRODUCT_CATEGORY varchar(50) not null,
    ORDERED_ITEM varchar(100) ,
    CONTACT_NUMBER varchar(10) not null,
    primary key (ORDER_ID)	
  );
  
  

-- 3. Adding a new column named "ORDER_QUANTITY" to the ORDERS table
alter table ORDERS
add ORDER_QUANTITY int not null;
desc ORDERS;

-- 4. Rename the ORDERS table to SALES_ORDERS
alter table ORDERS
rename to SALES_ORDERS;

-- 5. Insert 10 rows into the SALES_ORDERS table
insert into SALES_ORDERS (ORDER_ID, CUSTOMER_NAME, PRODUCT_CATEGORY, ORDERED_ITEM, CONTACT_NUMBER, ORDER_QUANTITY) 
VALUES 
(1, 'Nikhil Babu', 'Electronics', 'Laptop', '2234567891', 1),
(2, 'Nithin Raj', 'Home Appliances', 'Microwave', '8234567891', 2),
(3, 'Adhish Vinod', 'Furniture', 'Chair', '6234567892', 4),
(4, 'Jithin Ram', 'Books', 'Novel', '0234567893', 1),
(5, 'Abijith Unni', 'Clothing', 'T-Shirt', '7234567884', 3),
(6, 'Jatheesh Prakash', 'Toys', 'Puzzle', '8234167895', 5),
(7, 'Amal Raj', 'Groceries', 'Cereal', '6234564896', 2),
(8, 'Sachin Hussain', 'Sports', 'Football', '5234267897', 1),
(9, 'Sarath Krishnan', 'Stationery', 'Notebook', '1234767898', 10),
(10, 'Amal George', 'Cosmetics', 'Facewash', '5254567295', 2);

-- 6. Retrieve CUSTOMER_NAME and ORDERED_ITEM from the SALES_ORDERS table
select CUSTOMER_NAME, ORDERED_ITEM from SALES_ORDERS;

-- 7. Update the name of the product for any row (example: change 'Laptop' to 'Gaming Laptop')
update SALES_ORDERS
set ORDERED_ITEM = 'Gaming Laptop'
where ORDER_ID = 1;

-- 8. Delete the sales_orders table from the database
drop table SALES_ORDERS;
