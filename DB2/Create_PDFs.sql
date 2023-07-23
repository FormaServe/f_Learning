-- Examples from PowerWire article from July 2023
--
-- Author Andy Youens FormaServe Systems Ltd

-- Do I have any spool files?
Select *
  From Qsys2.Output_Queue_Entries_Basic
  Where Status = 'READY'
        And User_Name = 'ANDY';


-- Do we have any PDFs in there already?
select *
  from table (
      qsys2.ifs_object_statistics(START_PATH_NAME => '/home/andy/PDF', SUBTREE_DIRECTORIES => 'YES')
    );

-- Get all my spool files & generate PDFs into my ~/PDF directory
select job_name, spooled_file_name, file_number, 
  SYSTOOLS.Generate_PDF( 
   job_name            => job_name, 
   spooled_file_name   => spooled_file_name, 
   spooled_file_number => file_number, 
   path_name   => '/home/andy/pdf/' concat regexp_replace(job_name, '/', '_') 
      concat '_' concat spooled_file_name concat '_' concat file_number concat '.pdf') 
      as "pdf_created?",
   '/home/andy/pdf/' concat regexp_replace(job_name, '/', '_') 
      concat '_' concat spooled_file_name concat '_' concat file_number concat '.pdf'
      as pdf_path from qsys2.output_queue_entries_basic 
      where status = 'READY' and user_name = 'ANDY';


-- Better check we have the PDFs now!
select *
  from table (
      qsys2.ifs_object_statistics(START_PATH_NAME => '/home/andy/pdf/', SUBTREE_DIRECTORIES => 'YES')
    );