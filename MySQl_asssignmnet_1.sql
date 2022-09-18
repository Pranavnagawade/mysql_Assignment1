create database mysql_assignment_1	;
use mysql_assignment_1;
#SALESPEOPLE TABLE
create table SalesPeople (
snum  int Primary key,
sname varchar(100) Unique,
city varchar(100),
comm int);
#INSERT VALUES IN SALESPEOPLE TABLE 
insert  into SalesPeople(snum,sname,city,comm)
VALUES(1001,"Peel","London",12),
            (1002,"Serres","Sanjose",13),
            (1004,"Motika","London",11),
            (1007,"Rifkin","Barelona",15),
		(1003,"Axelrod","Newyork",10);
select * from SalesPeople;

# CUSTOMERS TABLE
create table Customers(cnum int primary key,
cname varchar(100),
 city varchar(100) not null ,
 snum int ,
foreign key (snum) references  SalesPeople(snum));
#INSER VALUES IN CUSTOMERS TABLE
insert into Customers(cnum,cname,city,snum)
values(2001,"Hoffman","London",1001),
       (2002,"Giovanni","Rome",1003),
       (2003,"Liu","Sanjose",1002),
       (2004,"Grass","Berlin",1002),
       (2006,"Clemens","London",1001),
       (2008,"Cisneros","Sanjose",1007),
       (2007,"Pereira","Rome",1004);
select  * from Customers;
# ORDER TABLE
create table Orders 
(onum int primary key,
amt decimal(8,2),
odate date, 
cnum int ,
foreign key(cnum) references Customers(cnum),
snum int ,
foreign key(snum) references SalesPeople(snum));
# INSER VALUES IN ORDER TABLE
insert into Orders(onum,amt,odate,cnum,snum)
values (3001,18.69,'1990-10-3',2008,1007),
	  (3003,767.19,'1990-10-3',2001,1001),
      (3002,1900.10,'1990-10-3',2007,1004),
      (3005,5160.45,'1990-10-3',2003,1002),
      (3006,1098.16,'1990-10-3',2008,1007),
	  (3009,1713.23,'1990-10-4',2002,1003),
      (3007,75.75,'1990-10-4',2004,1002),
      (3008,4273.00,'1990-10-5',2006,1001),
      (3010,1309.95,'1990-10-6',2004,1002),
	  (3011,9891.88,'1990-10-6',2006,1001);
      select * from Orders;
      
/*On the basis of above tables perform given below questions
 Count the number of Salesperson whose name begin with ‘a’/’A’.
 Display all the Salesperson whose all orders worth is more than Rs. 2000.
 Count the number of Salesperson belonging to Newyork.
 Display the number of Salespeople belonging to London and belonging to Paris.
Display the number of orders taken by each Salesperson and their date of orders*/

#1. Count the number of Salesperson whose name begin with ‘a’/’A’.

select count(*) from SalesPeople where sname like 'a%' or 'A%';


#2.Display all the Salesperson whose all orders worth is more than Rs. 2000.

select SalesPeople.snum,sname,Orders.amt
from Orders
 inner join SalesPeople on Orders.Snum = SalesPeople.Snum
where
    Orders.Amt > 2000;
    
#3.Count the number of Salesperson belonging to Newyork.

select count(*) from SalesPeople where city="Newyork" ;

#4.Display the number of Salespeople belonging to London and belonging to Paris.

select city ,count(*) from SalesPeople where city="London" or city="Paris" ;

#5.Display the number of orders taken by each Salesperson and their date of orders

select Salespeople.Snum,Sname,count(*) as "No of orders",group_concat(Odate) as "order_dates"
from Salespeople
inner join Orders
on Salespeople.Snum=Orders.Snum
group by Snum; 



