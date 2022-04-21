--Creating tables for CCMS Project --
-- table 1 --

drop table employee_work;
drop table employee_address;
drop table employee;
drop table DEPARTMENT;
drop table CUSTOMER_ADDRESS;
drop table payment;
drop table subscription_renewal;
drop table customer_feedback;
drop table case_resolution;
drop table CASE_DETAILS;
drop table imei_info;
drop table product;
drop table parts;
drop table customer;
drop table subscription;
drop table geo_details;



create table department(
Dept_id varchar2(10),
Dept_name varchar2(100),
Dept_Priority_days number(13),
Dept_email varchar2(30),
Dept_phone varchar2(15),
Manager_id varchar2(10),
Dept_Service_cost number(5),
constraint pk_dept primary key (Dept_id)
);

--insert statements for department 


-- table 2---

create table subscription (
    sub_id varchar2(20),
    sub_tier varchar2(65 CHAR),
    sub_period number(20),
    discount number(5),
    primary key(sub_id)
);

ALTER TABLE SHRIYA_PROJECT.subscription
DROP COLUMN discount;


alter table SHRIYA_PROJECT.subscription
add discount decimal(5,2);


--insert subscription


CREATE TABLE GEO_DETAILS(
State_Code varchar2(5), 
State varchar2(200) NOT NULL UNIQUE,
Tax number(5) NOT NULL,
Time_zone varchar2(200) NOT NULL,
PRIMARY KEY(State_code)
);




--insert for geodetails



-- table 3---
CREATE TABLE PARTS (
    PART_ID VARCHAR2(65 CHAR),
    PART_NUMBER varchar2(38) NOT NULL,
    PART_NAME VARCHAR2(65 CHAR),
    AVAILABILITY number(6),
    WARRANTY VARCHAR2(65 CHAR),
    PART_COST number(6),
    PRIMARY KEY(PART_ID)
);


---insert for parts

--alter table employee delete column employee_email;
--alter table employee add employee_email varchar2(100);

create table employee(employee_id varchar2(10),
employee_firstname varchar2(16),
employee_lastname varchar2(14),
employee_email varchar2(50),
employee_phonenbr varchar2(15),
dept_id varchar2(10),
primary key(employee_id),
FOREIGN KEY (dept_id) REFERENCES department(dept_id));

--insert employee


create table employee_address(employee_id varchar2(6),
address_type varchar2(18),
address_1 varchar2(100),
address_2 varchar(100),
employee_city varchar2(30),
employee_statecode varchar2(5),
employee_country varchar2(9),
employee_zip NUMBER(7),
FOREIGN KEY (employee_id) REFERENCES employee(employee_id),
FOREIGN KEY (employee_statecode) REFERENCES geo_details(State_Code) ON DELETE CASCADE);

--insert employeeadress



create table product(
product_number varchar2(50),
product_name varchar2(50),
product_category varchar2(50),
primary key(product_number)
);


---insert product

create table imei_info(
imei varchar2(25),
product_number varchar2(50),
primary key(imei),
FOREIGN KEY (product_number) REFERENCES product(product_number)
);

--insert imei info



CREATE TABLE CUSTOMER(
Customer_id varchar2(10),
First_name varchar2(225) NOT NULL UNIQUE,
Last_name varchar2(225) NOT NULL,
Email varchar2(50) NOT NULL UNIQUE,
Phone_number varchar2(15) NOT NULL,
Customer_onboarddate timestamp NOT NULL,
Sub_id varchar2(20),
PRIMARY KEY(Customer_id),
FOREIGN KEY (Sub_id) References SUBSCRIPTION(Sub_id) ON DELETE CASCADE
);


---insert statements for customer



CREATE TABLE CUSTOMER_ADDRESS(
Customer_id varchar2(10),
Address_type varchar2(200) NOT NULL,
Address_1 varchar2(255) NOT NULL,
Address_2 varchar2(255) ,
City varchar2(255) NOT NULL,
State_code varchar2(6),
Country varchar(65) NOT NULL,
Zip number(10) NOT NULL,
FOREIGN KEY (Customer_id) References CUSTOMER(Customer_id) ON DELETE CASCADE,
FOREIGN KEY (State_code) References GEO_DETAILS(State_code) ON DELETE CASCADE
);

---insert statements for customer_address

CREATE TABLE CASE_DETAILS(
Case_id varchar2(10),
Open_date Timestamp NOT NULL,
Close_date Timestamp ,
Part_id varchar2(20),
IMEI varchar2(25),
Case_subject varchar2(250),
Customer_id varchar2(6),
State_code varchar2(25),
Issue_type varchar2(200) ,
employee_id varchar2(25),
PRIMARY KEY(Case_id),
FOREIGN KEY(Part_id) References PARTS(Part_id) ON DELETE CASCADE,
FOREIGN KEY(IMEI) References IMEI_INFO(IMEI) ON DELETE CASCADE,
FOREIGN KEY(Customer_id) References CUSTOMER(Customer_id) ON DELETE CASCADE,
FOREIGN KEY(State_code) References GEO_DETAILS(State_code) ON DELETE CASCADE
);
--- insert statements for case_details

-- table 4---

CREATE TABLE EMPLOYEE_WORK (
    WORK_ID  VARCHAR2 (65 CHAR), 
    EMPLOYEE_ID varchar2 (6),
    WORK_TYPE VARCHAR2 (65 CHAR),
    START_DATE TIMESTAMP, 
    STATUS VARCHAR2(65 CHAR),
    case_id varchar2(10),
    PRIMARY KEY (WORK_ID),
    FOREIGN KEY (EMPLOYEE_ID) REFERENCES EMPLOYEE(EMPLOYEE_ID) ON DELETE CASCADE,
    FOREIGN KEY (case_id) REFERENCES case_details(case_id) on delete cascade
) ;

--insert employee_work



-- table 10---

CREATE TABLE PAYMENT(
Payment_id varchar2(60),
Customer_id varchar2(10),
discount number(10),
case_id varchar2(10),
PRIMARY KEY(Payment_id),
FOREIGN KEY (case_id) References case_details(case_id) ON DELETE CASCADE
);


--insert payment




-- table 11 --

create table subscription_renewal(
sub_renewal_id varchar2(10),
customer_id varchar2(10),
sub_id varchar2(10),
renewal_tier varchar2(25),
start_date timestamp,
primary key(sub_renewal_id),
FOREIGN KEY (sub_id) References subscription(sub_id) ON DELETE CASCADE
);

--insert sub renewal

-- table 12 --

create table customer_feedback(
feedback_id varchar2(25),
case_id varchar2(10),
feedback_description VARCHAR2(100),
likely_to_retain varchar2(20),
likely_to_recommend number(20),
primary key(feedback_id),
FOREIGN KEY (case_id) REFERENCES case_details(case_id) ON DELETE CASCADE
);
/* alter table query for time taken */


---insert statements for customer_feedback


-- table 15 --


create table case_resolution(
case_id varchar2(20),
resolution_type varchar2(50),
resolution_date timestamp,
comments varchar2(300),
FOREIGN KEY (case_id) REFERENCES case_details(case_id) ON DELETE CASCADE
);


--insert statements fro case resolution


alter table payment add service_cost decimal(20,4);
alter table payment add total decimal(20,4);

update table payment set service_cost = 

select dept_id from 


