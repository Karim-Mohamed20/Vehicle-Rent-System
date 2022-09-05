create database VehicleSystem 
Go
use VehicleSystem

create table Employee
(
Fname varchar(20) not null,
Minint char(1) not null,
Lname varchar(20) not null,
ESSN int Primary key,
EmpPhone_no char(11) unique not null ,
EmPPassword varchar(20)  not null ,
EmpAddress varchar(50) not null ,
gender char(1) ,
salary int 
)
create table Dependent
(
Dname varchar(20) not null,
Dgender char(1) ,
BirthDate Date ,
Relationship varchar(15)  ,
EmpSSN int not null ,
foreign key (EmpSSN) references Employee(ESSN) 
on delete cascade 
on update cascade ,
primary key (EmpSSN,Dname)

)
create table Renter
(
RFname varchar(20) not null,
RMinint char(1) not null,
RLname varchar(20) not null,
RSSN int Primary key,
RPhone_no char(11) unique not null ,
RPassword varchar(20)  not null ,
)
create table Lessor
(
LFname varchar(20) not null,
LMinint char(1) not null,
LLname varchar(20) not null,
LSSN int Primary key,
LPhone_no char(11) unique not null ,
LPassword varchar(20)  not null ,
)
create table Vehicle
(
Model varchar(20) not null ,
Type varchar(20) not null ,
LicenceNo int primary key ,
Vyear char(4) ,
Vimage Image ,
Cost int ,
Location varchar(40) not null ,
Duration date ,
rent_SSN INT ,
available char(1) NOT NULL,
foreign key (rent_SSN) references Renter(RSSN)
)
create table LessorVehicle
(
Less_SSN int not null ,
Vno int not null ,
Order_No int not null unique ,
Dur date not null ,
StartDate date  ,
foreign key (Less_SSN) references Lessor(LSSN) 
on delete cascade   
on update cascade ,
foreign key (Vno) references Vehicle(LicenceNo)
on delete cascade   
on update cascade ,
primary key (Less_SSN,Vno,Order_No)
)

create table Report
(
OrderNo int not null ,
Data varchar(500) ,
RepoSSN int not null ,
RorL char(1) not null ,
ReportTitle varchar(15) not null ,
foreign key (OrderNo) references LessorVehicle(Order_No)
on delete cascade   
on update cascade ,
primary key (OrderNo,ReportTitle) 
)

create table RenterVehicle
(
Model varchar(20) not null ,
Type varchar(20) not null ,
LicenceNo int primary key ,
Vyear char(4) ,
Vimage Image,
Cost int ,
Location varchar(40) not null ,
Duration date ,
rent_SSN INT ,
available char(1) NOT NULL,
foreign key (rent_SSN) references Renter(RSSN)
)

