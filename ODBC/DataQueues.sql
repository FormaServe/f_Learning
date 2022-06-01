--  PowerWire DataQueue Examples
--
--  Published September 2021
--
-- © FormaServe Systems Ltd 2021
--

-- Remove & re-create dataqueue for Orders
cl: dltdtaq POWERWIRE/ORDERS ;
cl: crtdtaq POWERWIRE/ORDERS MAXLEN(100) SEQ(*KEYED) KEYLEN(1) SIZE(*MAX2GB);

-- Send order details to queue for company 1
Call Qsys2.Send_Data_Queue(
  Message_Data => '1425#Screw#105',
  Data_Queue => 'ORDERS',
  Data_Queue_Library => 'POWERWIRE',
  Key_Data => '1'
);

Call Qsys2.Send_Data_Queue(
  Message_Data => '2554#Exhaust Bracket#040',
  Data_Queue => 'ORDERS',
  Data_Queue_Library => 'POWERWIRE',
  Key_Data => '1'
);

Call Qsys2.Send_Data_Queue(
  Message_Data => '8712#Exhaust Manifold#001',
  Data_Queue => 'ORDERS',
  Data_Queue_Library => 'POWERWIRE',
  Key_Data => '1'
);

Call Qsys2.Send_Data_Queue(
  Message_Data => '1548#Radiator Cap#002',
  Data_Queue => 'ORDERS',
  Data_Queue_Library => 'POWERWIRE',
  Key_Data => '1'
);

Call Qsys2.Send_Data_Queue(
  Message_Data => '1555#Seat Cover#001',
  Data_Queue => 'ORDERS',
  Data_Queue_Library => 'POWERWIRE',
  Key_Data => '1'
);


Call Qsys2.Send_Data_Queue(
  Message_Data => '1549#Throttle Cable#002',
  Data_Queue => 'ORDERS',
  Data_Queue_Library => 'POWERWIRE',
  Key_Data => '1'
);

-- Send data to queue for company 2
Call Qsys2.Send_Data_Queue(
  Message_Data => '9925#Brake Pad#004',
  Data_Queue => 'ORDERS',
  Data_Queue_Library => 'POWERWIRE',
  Key_Data => '2'
);

Call Qsys2.Send_Data_Queue(
  Message_Data => '2665#Disc#004',
  Data_Queue => 'ORDERS',
  Data_Queue_Library => 'POWERWIRE',
  Key_Data => '2'
);

Call Qsys2.Send_Data_Queue(
  Message_Data => '1212#Petrol Engine#001',
  Data_Queue => 'ORDERS',
  Data_Queue_Library => 'POWERWIRE',
  Key_Data => '2'
);

Call Qsys2.Send_Data_Queue(
  Message_Data => '111#Radiator#002',
  Data_Queue => 'ORDERS',
  Data_Queue_Library => 'POWERWIRE',
  Key_Data => '2'
);


-- Send data to queue for company 3
Call Qsys2.Send_Data_Queue(
  Message_Data => '2341#Bolt#005',
  Data_Queue => 'ORDERS',
  Data_Queue_Library => 'POWERWIRE',
  Key_Data => '3'
);

Call Qsys2.Send_Data_Queue(
  Message_Data => '9984#Petrol Pump#001',
  Data_Queue => 'ORDERS',
  Data_Queue_Library => 'POWERWIRE',
  Key_Data => '3'
);

Call Qsys2.Send_Data_Queue(
  Message_Data => '9987#Registration Plate#001',
  Data_Queue => 'ORDERS',
  Data_Queue_Library => 'POWERWIRE',
  Key_Data => '3'
);

Call Qsys2.Send_Data_Queue(
  Message_Data => '3243#Spark Plugs#006',
  Data_Queue => 'ORDERS',
  Data_Queue_Library => 'POWERWIRE',
  Key_Data => '3'
);


Call Qsys2.Send_Data_Queue(
  Message_Data => '1425#Screw#105',
  Data_Queue => 'ORDERS',
  Data_Queue_Library => 'POWERWIRE',
  Key_Data => '3'
);

Call Qsys2.Send_Data_Queue(
  Message_Data => '2554#Exhaust Bracket#040',
  Data_Queue => 'ORDERS',
  Data_Queue_Library => 'POWERWIRE',
  Key_Data => '3'
);

Call Qsys2.Send_Data_Queue(
  Message_Data => '8712#Exhaust Manifold#001',
  Data_Queue => 'ORDERS',
  Data_Queue_Library => 'POWERWIRE',
  Key_Data => '3'
);

Call Qsys2.Send_Data_Queue(
  Message_Data => '1548#Radiator Cap#002',
  Data_Queue => 'ORDERS',
  Data_Queue_Library => 'POWERWIRE',
  Key_Data => '3'
);

-- What's on the DQ
Select  Key_Data,
        Message_Data,
        Message_Enqueue_TimeStamp
  From Table (
      Qsys2.Data_Queue_Entries('ORDERS',
        'POWERWIRE', Selection_Type => 'KEY', Key_Data => '1', Key_Order => 'GE')
    );

-- Get all orders for Company 1
Select Key_Data,
       Message_Data
  From Table (
      Qsys2.Receive_Data_Queue(Data_Queue => 'ORDERS',
        Data_Queue_Library => 'POWERWIRE',
        Remove => 'YES', 
        Wait_Time => 0, 
        Key_Data => '1', 
        Key_Order => 'EQ')
    );

-- What remains on the queue?
Select *
  From Table (
      Qsys2.Data_Queue_Entries('ORDERS',
        'POWERWIRE', Selection_Type => 'KEY', Key_Data => '1', Key_Order => 'GE')
    );          

-- What we got left?
Select *
  From Table (
      Qsys2.Data_Queue_Entries('ORDERS', 'POWERWIRE') );
   