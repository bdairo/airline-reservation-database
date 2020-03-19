




Create TABLE AirlineCompany(
 
 AC_ID varchar(5) NOT NULL,
 AC_NAME varchar(20) NOT NULL,
 PRIMARY KEY (AC_ID)

);

Create TABLE Flight(

 Flight_ID varchar(5) NOT NULL,
 Num_Of_Seats numeric(5) NOT NULL,
 AC_ID varchar(5) NOT NULL,

 PRIMARY KEY (Flight_ID),
 FOREIGN KEY (AC_ID) REFERENCES AirlineCompany(AC_ID) 

);


Create Table Airport(

Airport_id varchar(5)  NOT NULL,
Airport_Name varchar(20) NOT NULL,
City varchar(20)  NOT NULL,
Country varchar(20) NOT NULL,

PRIMARY KEY (Airport_id)

);


Create Table Departure(
 
 DEP_DATE DATE NOT NULL,
 DEP_TIME TIME(0) NOT NULL,
 Flight_ID varchar(5) NOT NULL,
 Airport_id varchar(5)  NOT NULL,

 PRIMARY KEY (DEP_DATE,DEP_TIME),
 FOREIGN KEY (Flight_ID) REFERENCES Flight(Flight_ID),
 FOREIGN KEY (Airport_id) REFERENCES Airport(Airport_id) 

);


Create Table Arrival(
 
 Arrival_DATE DATE NOT NULL,
 Arrival_TIME TIME(0) NOT NULL,
 Flight_ID varchar(5) NOT NULL,
 Airport_id varchar(5)  NOT NULL,

 PRIMARY KEY (Arrival_DATE,Arrival_TIME),
 FOREIGN KEY (Flight_ID) REFERENCES Flight(Flight_ID),
 FOREIGN KEY (Airport_id) REFERENCES Airport(Airport_id) 

);

Create Table Ticket(

TicketNo numeric(20) NOT NULL,
SeatNo varchar(5) NOT NULL,
Flight_ID varchar(5) NOT NULL,

PRIMARY KEY (TicketNo),
FOREIGN KEY (Flight_ID) REFERENCES Flight(Flight_ID),
);

Create Table Passenger(
P_Id varchar(5) NOT NULL,
FirstName varchar(20) NOT NULL,
LastName varchar(20) NOT NULL,
Email varchar(30) NOT NULL,
DOB DATE NOT NULL,
ReferredBy varchar(5) NULL,

PRIMARY KEY (P_Id),
Unique(Email),
FOREIGN KEY (ReferredBy) REFERENCES Passenger(P_Id) );



Create Table Phonenumber(

Phonenumber numeric (15) NOT NULL,
P_Id varchar(5) NOT NULL,

PRIMARY KEY (Phonenumber,P_Id),
FOREIGN KEY (P_Id) REFERENCES Passenger(P_Id),


);

Create Table Baggage(

BaggageNo numeric (15) NOT NULL,
P_Id varchar(5) NOT NULL,

PRIMARY KEY (BaggageNo,P_Id),
FOREIGN KEY (P_Id) REFERENCES Passenger(P_Id),

);

Create Table Payment(
Payment_Id varchar(5) NOT NULL,
CardNumber numeric(16) NOT NULL,
Amount numeric(16) NOT NULL,
P_Id varchar(5) NOT NULL,


PRIMARY KEY (Payment_Id),
Unique(CardNumber),
FOREIGN KEY (P_Id) REFERENCES Passenger(P_Id) );


Create Table SoldVia(
 
TicketNo numeric(20) NOT NULL,
Payment_Id varchar(5) NOT NULL,

PRIMARY KEY (TicketNo,Payment_Id),
FOREIGN KEY (TicketNo) REFERENCES Ticket(TicketNo),
FOREIGN KEY (Payment_Id) REFERENCES Payment(Payment_Id)

);



Insert Into AirlineCompany Values ('100A', 'Alaska');
Insert Into AirlineCompany Values ('100B', 'Allegiant');
Insert Into AirlineCompany Values ('100C', 'American');
Insert Into AirlineCompany Values ('100D', 'Delta');
Insert Into AirlineCompany Values ('100E', 'Frontier');
Insert Into AirlineCompany Values ('100F', 'Hawaiian');
Insert Into AirlineCompany Values ('100G', 'JetBlue');
Insert Into AirlineCompany Values ('100H', 'SouthWest');
Insert Into AirlineCompany Values ('100I', 'Spirit');
Insert Into AirlineCompany Values ('100J', 'United');


Insert Into Flight Values ('F101', '10','100A');
Insert Into Flight Values ('F102', '12','100B');
Insert Into Flight Values ('F103', '14','100C');
Insert Into Flight Values ('F104', '16','100D');
Insert Into Flight Values ('F105', '8','100E');
Insert Into Flight Values ('F106', '10','100F');
Insert Into Flight Values ('F107', '10','100G');
Insert Into Flight Values ('F108', '12','100H');
Insert Into Flight Values ('F109', '10','100I');
Insert Into Flight Values ('F110', '10','100J');


Insert Into Airport Values ('A100','Jackson','Atlanta','America');
Insert Into Airport Values ('A200','Jackson','Atlanta','America');
Insert Into Airport Values ('A300','Dulles','Washington','America');
Insert Into Airport Values ('A400','Newark','New Jersey','America');
Insert Into Airport Values ('A500','Bejing','Bejing','China');
Insert Into Airport Values ('A600','HongKong','HongKong','HongKong');
Insert Into Airport Values ('A700','Dubai','Dubai','Dubai');
Insert Into Airport Values ('A800','Kuala Lumpur','Kuala Lumpur','Malaysia');
Insert Into Airport Values ('A900','Tribuvan','Kathmandu','Nepal');
Insert Into Airport Values ('B100','Denver','Colorado','America');


Insert Into Departure Values ('2019-12-1','08:00:00','F101','A100');
Insert Into Departure Values ('2019-12-2','12:30:00','F102','A200');
Insert Into Departure Values ('2019-12-2','09:45:00','F103','A300');
Insert Into Departure Values ('2019-12-5','22:00:00','F104','A400');
Insert Into Departure Values ('2019-12-6','13:00:00','F105','A500');
Insert Into Departure Values ('2019-12-7','14:00:00','F106','A600');
Insert Into Departure Values ('2019-12-8','20:00:00','F107','A700');
Insert Into Departure Values ('2019-12-10','23:00:00','F108','A800');
Insert Into Departure Values ('2019-12-12','21:00:00','F109','A900');
Insert Into Departure Values ('2019-12-15','17:00:00','F110','B100');


Insert Into Arrival Values ('2019-12-2','11:00:00','F101','A200');
Insert Into Arrival Values ('2019-12-2','18:30:00','F102','A100');
Insert Into Arrival Values ('2019-12-4','10:00:00','F103','A500');
Insert Into Arrival Values ('2019-12-5','23:15:00','F104','A600');
Insert Into Arrival Values ('2019-12-6','19:00:00','F105','A400');
Insert Into Arrival Values ('2019-12-7','18:00:00','F106','A300');
Insert Into Arrival Values ('2019-12-9','07:15:00','F107','A900');
Insert Into Arrival Values ('2019-12-11','11:00:00','F108','A800');
Insert Into Arrival Values ('2019-12-13','06:00:00','F109','B100');
Insert Into Arrival Values ('2019-12-15','23:00:00','F110','A700');


  Insert Into Ticket Values ('1001','1A','F101');
  Insert Into Ticket Values ('1002','1B','F101');
  Insert Into Ticket Values ('1003','1A','F102');
  Insert Into Ticket Values ('1004','1B','F102');
  Insert Into Ticket Values ('1005','1A','F103');
  Insert Into Ticket Values ('1006','1B','F103');
  Insert Into Ticket Values ('1007','1A','F104');
  Insert Into Ticket Values ('1008','1B','F104');
  Insert Into Ticket Values ('1009','1A','F105');
  Insert Into Ticket Values ('1010','1B','F105');
  Insert Into Ticket Values ('1011','1A','F106');
  Insert Into Ticket Values ('1012','1B','F106');
  Insert Into Ticket Values ('1013','1A','F107');
  Insert Into Ticket Values ('1014','1B','F107');
  Insert Into Ticket Values ('1015','1A','F108');
  Insert Into Ticket Values ('1016','1B','F108');
  Insert Into Ticket Values ('1017','1A','F109');
  Insert Into Ticket Values ('1018','1B','F109');
  Insert Into Ticket Values ('1019','1A','F110');
  Insert Into Ticket Values ('1020','1B','F110');


  Insert Into Passenger Values ('1', 'Alien','Gurung','ag@gmail.com','1995-08-20',NULL);
  Insert Into Passenger Values ('2', 'Prasansha','Gurung','pg@gmail.com','1996-08-19','1');
  Insert Into Passenger Values ('3', 'John','Stones','js@gmail.com','1994-03-10',NULL);
  Insert Into Passenger Values ('4', 'Toni','Kroos','tk@gmail.com','1992-11-01',NULL);
  Insert Into Passenger Values ('5', 'Bolu','Dairo','bd@gmail.com','1997-07-12','1');
  Insert Into Passenger Values ('6', 'Lio','Messi','lm@gmail.com','1991-11-03',NULL);
  Insert Into Passenger Values ('7', 'Mark','Huges','mh@gmail.com','1975-12-01',NULL);
  Insert Into Passenger Values ('8', 'David','Silva','ds@gmail.com','1988-07-13','3');
  Insert Into Passenger Values ('9', 'Kevin','Debryune','kd@gmail.com','1993-03-25','3');
  Insert Into Passenger Values ('10', 'John','Terry','jt@gmail.com','1986-01-05',NULL);


Insert Into Baggage Values  ('111','1');
Insert Into Baggage Values  ('222','1');
Insert Into Baggage Values  ('111','2');
Insert Into Baggage Values  ('111','3');
Insert Into Baggage Values  ('111','4');
Insert Into Baggage Values  ('111','5');
Insert Into Baggage Values  ('222','5');
Insert Into Baggage Values  ('333','5');
Insert Into Baggage Values  ('111','9');
Insert Into Baggage Values  ('111','10');


Insert Into Phonenumber Values ('3343729081','1');
Insert Into Phonenumber Values ('1234567879','1');
Insert Into Phonenumber Values ('1329492040','2');
Insert Into Phonenumber Values ('3343723343','3');
Insert Into Phonenumber Values ('3343729009','4');
Insert Into Phonenumber Values ('3343723442','5');
Insert Into Phonenumber Values ('3343729434','6');
Insert Into Phonenumber Values ('3343729083','7');
Insert Into Phonenumber Values ('3343729344','8');
Insert Into Phonenumber Values ('3343729044','9');
Insert Into Phonenumber Values ('3343722221','9');
Insert Into Phonenumber Values ('3343722123','9');
Insert Into Phonenumber Values ('3343721212','10');


Insert Into Payment Values ('P1','1234123412341234','1300','1');
Insert Into Payment Values ('P2','1234123422214567','1100','2');
Insert Into Payment Values ('P3','1234123412343333','400','3');
Insert Into Payment Values ('P4','1234123412341212','1700','4');
Insert Into Payment Values ('P5','1234123412345656','1400','5');
Insert Into Payment Values ('P6','1234123412348989','1800','6');
Insert Into Payment Values ('P7','1234123412341000','600','7');
Insert Into Payment Values ('P8','1234123412341111','1250','8');
Insert Into Payment Values ('P9','1234123412356353','1790','9');
Insert Into Payment Values ('P10','1234123412341789','2200','10');


Insert Into SoldVia Values('1001','P1');
Insert Into SoldVia Values('1003','P2');
Insert Into SoldVia Values('1004','P3');
Insert Into SoldVia Values('1005','P4');
Insert Into SoldVia Values('1006','P5');
Insert Into SoldVia Values('1009','P6');
Insert Into SoldVia Values('1010','P7');
Insert Into SoldVia Values('1016','P8');
Insert Into SoldVia Values('1018','P9');
Insert Into SoldVia Values('1019','P10');






Select * From AirlineCompany;
Select * From Airport;
Select * From Flight;
Select * From Departure;
Select * From Arrival;
Select * From Ticket;
Select * From Passenger;
Select * From Phonenumber;
Select * From Baggage;
Select * From Payment;
Select * From SoldVia;






/*Creating non-clustered indexes */


Create NONCLUSTERED INDEX noncluster_acname
On AirlineCompany(AC_NAME)
Go

Create NONCLUSTERED INDEX noncluster_airportname
On Airport(Airport_Name)
Go

Create NONCLUSTERED INDEX noncluster_acid
On Flight(AC_ID)
Go

Create NONCLUSTERED INDEX noncluster_flightid
On Departure(Flight_ID)
Go

Create NONCLUSTERED INDEX noncluster_flightid
On Arrival(Flight_ID)
Go

Create NONCLUSTERED INDEX noncluster_flightid
On Ticket(Flight_ID)
Go

Create NONCLUSTERED INDEX noncluster_paymentid
On Soldvia(Payment_Id)
Go

Create NONCLUSTERED INDEX noncluster_passengerid
On Payment(P_id)
Go

Create NONCLUSTERED INDEX noncluster_fullname
On Passenger(FirstName,LastName)
Go


Create NONCLUSTERED INDEX noncluster_passengerid
On Baggage(P_Id)
Go


Create NONCLUSTERED INDEX noncluster_passengerid
On Phonenumber(P_Id)
Go