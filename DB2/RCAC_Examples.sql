/*

 FormaServe IBM i Training

 For full disclaimer see https://www.formaserve.co.uk/examples.php

 © - FormaServe Systems Ltd.  1990 - 2020
 www.FormaServe.co.uk

*/

set schema iODb02 ;

-- Who do we have as DB Admins?
Select Function_Id,
       User_Name,
       Usage,
       User_Type
  From Qsys2.Function_Usage
  Where Function_Id = 'QIBM_DB_SECADM'
  Order By User_Name ;


/* Show Row Permission Masking Examples   */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   */


/* Change table to enable Row Access       */
Alter Table Employee
  Activate Row Access Control;


/* Change table to disable Row Access      */
Alter Table Employee
  Deactivate Row Access Control;


/* Give ALL access to group profile of FormaServe  */
Create Permission Employee_Group_Formaserve
    On Employee For Rows
    Where (Verify_Group_For_User(Current_User, 'FORMASERVE') = 1)
    Enforced For All Access Enable ;


/*  By default, only allow access to rows of <- £25k salary  */
Create or Replace Permission iODb02.Employee_Low_Salary
    On Employee
    For Rows Where Emsal <= 25000
    Enforced For All Access Enable ;


/*  Restrict users to their country data   */
Create Or Replace Permission Employee_Countries On Employee For Rows Where (
    Verify_Group_For_User(Current_User, 'FORMASERVE') = 1)
    Or (Verify_Group_For_User(Current_User, 'HR_UK') = 1) And Emcty = 'UK'
    Or (Verify_Group_For_User(Current_User, 'HR_FR') = 1) And Emcty = 'FR'
    Or (Verify_Group_For_User(Current_User, 'HR_US') = 1) And Emcty = 'US'
    Enforced For All Access
    Enable ;

/* Show Column Masking Examples   */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~   */

/* Change table to enable Column Masking       */
Alter Table iODb02.Employee
  Activate Column Access Control;

/* Change table to disable Column Masking      */
Alter Table iODb02.Employee
  Deactivate Column Access Control;


/* Creating column mask MASK_EMPLOYEE_SALARY on Salary */
Create Or Replace Mask iODb02.Mask_Employee_Salary On iODb02.Employee For Column Emsal Return
Case
  When Verify_Group_For_User(Current_User, 'FORMASERVE') = 1 Then Emsal
  Else 0
End Enable;


/* Creating IODB02.MASK_EMPLOYEE_BONUS on Bonus        */
Create or Replace Mask Iodb02.Mask_Employee_Bonus On Iodb02.Employee For Column EmBon Return
Case
  When Embon > 1000 Then Embon
  Else Null
End Enable;


/* Create column mask MASK_EMPLOYEE_NAT on NatIns No  */
Create Or Replace Mask iODb02.Mask_Employee_Nat On iODb02.Employee For Column Emnat Return
Case
  When Verify_Group_For_User(Current_User, 'FORMASERVE') = 1 Then Emnat
  When Verify_Group_For_User(Current_User, 'HR') = 1 Then 'xxx-xxx-' || Right(Emnat, 3)
  Else 'xxx-xxx-xxx'
End Enable;


/* Only show salary column to the FormaServe Group Profile set */
Create Mask Iodb02.Mask_Employee_Salary On Iodb02.Employee As Employee For Column Emsal Return
Case
  When Qsys2.Verify_Group_For_User(Current_User, 'FORMASERVE') = 1 Then Employee.Emsal
  Else 0
End Enable;



