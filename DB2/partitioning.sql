/*

 FormaServe IBM i Training

 For full disclaimer see https://www.formaserve.co.uk/examples.php

 © - FormaServe Systems Ltd.  1990 - 2023
 www.FormaServe.co.uk

 */
/*  get the schema set for all SQL statements  */
Set Schema FormaServe;

/*  Partition History table  */
alter table
  hist_accounts partition by range (transaction_date) (
    partition p2016 starting ('01/01/2016') inclusive ending ('01/01/2017') exclusive,
    partition p2017 starting ('01/01/2017') inclusive ending ('01/01/2018') exclusive,
    partition p2018 starting ('01/01/2018') inclusive ending ('01/01/2019') exclusive,
    partition p2019 starting ('01/01/2019') inclusive ending ('01/01/2020') exclusive,
    partition p2020 starting ('01/01/2020') inclusive ending ('01/01/2021') exclusive,
    partition p2021 starting ('01/01/2021') inclusive ending ('01/01/2022') exclusive,
    partition p2022 starting ('01/01/2022') inclusive ending ('01/01/2023') exclusive,
    partition p2023 starting ('01/01/2023') inclusive ending ('01/01/2024') exclusive
  );

/*  Create a new payroll table  */
Create Or Replace Table Payroll (
      Empnum Int,
      Firstname Char(15),
      Surname Char(15),
      Country_Code Char(2),
      Salary Int
    )
  Partition By Hash (Empnum) Into 4 Partitions;

/*  Create an employee table, using the employee number as a partition rule  */
Create Or Replace Table Employee (
      Empno Int,
      Firstname Varchar(50),
      Surname Varchar(50),
      Country_Code Char(2),
      Salary Int,
      Bonus Int
    )
  Partition By Range (Empno) (
      Starting From (Minvalue) Ending At (999) Inclusive,
      Starting From (1000) Ending At (9999) Inclusive,
      Starting From (10000) Ending At (Maxvalue)
    );


/*  insert some test data   */
insert into employee values(1,'Andy','Youens', 35000, 500 ) ;
insert into employee values(11,'Jack','Youens', 35000, 500 ) ;
insert into employee values(2221,'Fred','Youens', 35000, 500 ) ;
insert into employee values(3451,'Bill','Youens', 35000, 500 ) ;
insert into employee values(1444,'George','Youens', 35000, 500 ) ;
insert into employee values(321444,'Ada','Youens', 45000, 500 ) ;

/* what we got now?  */
select * from employee ;
