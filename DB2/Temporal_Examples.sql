/*

 FormaServe IBM i Training

 For full disclaimer see https://www.formaserve.co.uk/examples.php

 © - FormaServe Systems Ltd.  1990 - 2020
 www.FormaServe.co.uk

*/

Set Schema Temporal ;

/*  Create Temporal Table     */
Create Or Replace Table Contact_Info (
      Name Varchar(50),
      Email Varchar(50),
      Tel_No Varchar(50),
      Sys_Start Timestamp(12) Not Null Generated Always As Row Begin,
      Sys_End Timestamp(12) Not Null Generated Always As Row End,
      Ts_Id Timestamp(12) Not Null Generated Always As Transaction Start Id,
      Period System_Time (Sys_Start, Sys_End)
    ) ;

/*  Create History Table   */
Create Table Hist_Contact_Info Like Contact_Info ;


/* Link the 2 tables together & start temporal versioning  */
Alter Table Contact_Info
  Add Versioning Use History Table Hist_Contact_Info ;


/*  Change an existing table to a temporal table   */
Alter Table Employee
  Add Column Sys_Start Timestamp(12) Not Null Generated Always As Row Begin
  Add Column Sys_End Timestamp(12) Not Null Generated Always As Row End
  Add Column Ts_Id Timestamp(12) Not Null Generated Always As Transaction Start Id
  Add Period System_Time (Sys_Start, Sys_End) ;


/* Create History Table  */
Create Table Hist_Employee Like Employee ;


/*  Start versioning on existing table  */
Alter Table Employee
  Add Versioning Use History Table Hist_Employee ;


/* Create History Table  */
Create Table Hist_Clients Like Clients ;

/*  Change an existing table to a temporal table   */
Alter Table Clients
  Add Versioning Use History Table Hist_Clients ;


/*  Create History Table   */
Create table hist_suppliers like suppliers ;


/* Start Temporal   */
Alter table suppliers
    add versioning use history table hist_suppliers ;


/*  Select employees at a certain time   */
Select * from employee
  for system_time as of '2020-01-10-10.00.00'
  where emid = 86 ;


/*  Select employees between a date range, using from & to   */
Select * from employee
    for system_time from '2020-01-10-00.00.00' to '2020-01-10-17.00.00'
    where emid = 86 ;


/*  Select employees between a date range   */
Select * from employee
    for system_time between '2020-01-10-09.00.00' and '2020-01-10-17.00.00'
    where emid = 86 ;

/*  Stop versioning - Dont need it any more - taking up to much disk!  */
alter table employee
 drop versioning ;





