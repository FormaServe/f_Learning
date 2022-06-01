/*
Sample PostgreSQL database commands for IBM i

See PowerWire Article by Andy Youens on PostgreSQL

© FormaServe Systems Ltd 2021

*/

-- to start server
cl: SBMJOB CMD(QSH CMD('/QOpenSys/pkgs/bin/pg_ctl -D /home/postgres -l logfile start')) JOB(STR_POSTGR) ;

-- to stop server
cl: SBMJOB CMD(QSH CMD('/QOpenSys/pkgs/bin/pg_ctl -D /home/postgres -l logfile stop')) JOB(END_POSTGR) ;

-- Runs on port 5432

-- Create sample database 

-- Create database
Create database HRDATA ;

-- Create employee table
CREATE TABLE employee (
    staff_id integer,
    first_name character varying(45) NOT NULL,
    last_name character varying(45) NOT NULL,
    address_id smallint NOT NULL,
    email character varying(50),
    username character varying(16) NOT NULL,
    last_update timestamp without time zone DEFAULT now() NOT NULL
);

-- insert some stuff
insert into 
    employee (staff_id, first_name, last_name, address_id, email, username)
values
    (1, 'Andy', 'Youens', 331, 'Andy@formaserve.co.uk', 'Andy'),
    (1, 'Jimmy', 'Greaves', 3231, 'Jim@formaserve.co.uk', 'Jimmy'),
    (1, 'Dave', 'McKay', 765, 'Dave@formaserve.co.uk', 'Dave'),
    (1, 'Micky', 'Hazard', 331, 'Micky@formaserve.co.uk', 'Micky'),
    (1, 'Glen', 'Hoddle', 134, 'Glen@formaserve.co.uk', 'Glen') ;

-- Show all employees
select * from employee ;

-- to quit, type \q    
