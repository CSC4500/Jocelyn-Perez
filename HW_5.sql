CREATE DATABASE MovieDatabase5;

USE MovieDatabase5;

CREATE TABLE Reservation(
	ReservationID		Int		Not NULL,
    ScreeningID			Int     NULL,
    ReservationTypeID	int		NULL,
    ReservationPaid		char(35)	NOT NULL,
    MovieID				Int		NULL,
    SeatID				Int		NULL,
    AuditoriumID		Int 	NULL,
    CustomerID			Int 	NULL,
    SeatReservationID	Int		NULL,
    CONSTRAINT			Reservation_PK		PRIMARY KEY(ReservationID)
);

CREATE TABLE Employee(
	EmployeeID			INT			not NULL,
	EmployeeFname		Char(25)	NOT NULL,
	EmployeeLname 		Char(25)	NOT NULL,
	EmployeeDOB			datetime	NOT NULL,
	EmployeePosition 	Char(25)	NOT NULL,
	CONSTRAINT			Employee_PK	Primary Key(EmployeeID)
);

CREATE TABLE ReservationType(
	ReservationTypeID	Int 	Not NULL,
    ReservationID		Int     NULL,
    constraint			ReservationType_PK	primary key(ReservationTypeID),
    constraint			RESTYPE_RES_FK		foreign key(ReservationID)
											references Reservation(ReservationID)
);

CREATE TABLE Customer(
	CustomerID			int		Not NULL,
    CustomerFname		char(35) NOT NULL,
    CustomerLname		char(35) NOT NULL,
    ReservationID		int		NULL,
    constraint 			Customer_PK			primary key(CustomerID),
    constraint			CUST_RES_FK			foreign key(ReservationID)
											references Reservation(ReservationID)
);

CREATE TABLE Auditorium(
	AuditoriumID		INT		not NULL,
	AuditoriumSeats		INT		NULL,
	MovieID				INT		NULL,
	ScreeningID			INT		NULL,
	ReservationID		INT		NULL,
	SeatID				INT		NULL,
	EmployeeID			INT		NULL,
	CONSTRAINT			Auditorium_PK	Primary Key(AuditoriumID),
	CONSTRAINT			AUD_EMP_FK		Foreign Key(EmployeeID)
										References Employee(EmployeeID)
);

CREATE TABLE Seat(
	SeatID			INT 	not NULL,
	SeatRows		INT		NULL, 
	SeatNumber		INT		NULL,
	AuditoriumID	INT		NULL,
	ReservationID	INT		NULL,
	CONSTRAINT		Seat_PK			Primary Key(SeatID),
	CONSTRAINT		SEAT_AUD_FK		Foreign Key(AuditoriumID)
									References Auditorium(AuditoriumID)
);

CREATE TABLE SeatReservation(
	SeatReservationID	int		not null,
    SeatID				int		null, 
    ReservationID		int		null,
    ScreeningID			int		null,
    constraint			SeatReservation_PK	primary key(SeatReservationID),
    constraint			SEATRES_RES_FK		foreign key(ReservationID)
											references Reservation(ReservationID),
	constraint 			SEATRES_SEAT_FK		foreign key(SeatID)
											references Seat(SeatID)
);

CREATE TABLE Movie(
	MovieID				INT			not NULL,
	MovieTitle			Char(100)	NOT NULL,
	MovieDirector		Char(35)	NOT NULL,
	MovieCast			Char(35)	NOT NULL,
	MovieDescription 	Char(100)	NOT NULL,
	MovieDuration		INT			NULL,
	ScreeningID			INT			NULL,
	CONSTRAINT			Movie_PK	Primary Key(MovieID)
);

CREATE TABLE Screening(
	ScreeningID			Int		Not NULL,
    MovieID				Int		NULL,
    AuditoriumID		INT		NULL,
    ReservationID		int		NULL,
    constraint			Screening_PK		primary key(ScreeningID),
    constraint			SCREEN_RES_FK		foreign key(ReservationID)
											references Reservation(ReservationID),
	constraint			SCREEN_MOV_FK		foreign key(MovieID)
											references Movie(MovieID),
	constraint			SCREEN_AUD_FK		foreign key(AuditoriumID)
											references Auditorium(AuditoriumID)
);

/*Reservation Data*/
insert into Reservation (ReservationID, ScreeningID, ReservationTypeID, ReservationPaid, MovieID, SeatID, AuditoriumID, CustomerID, SeatReservationID) values (1, 1, 1, false, 1, 1, 1, 1, 1);
insert into Reservation (ReservationID, ScreeningID, ReservationTypeID, ReservationPaid, MovieID, SeatID, AuditoriumID, CustomerID, SeatReservationID) values (2, 2, 2, false, 2, 2, 2, 2, 2);
insert into Reservation (ReservationID, ScreeningID, ReservationTypeID, ReservationPaid, MovieID, SeatID, AuditoriumID, CustomerID, SeatReservationID) values (3, 3, 3, false, 3, 3, 3, 3, 3);
insert into Reservation (ReservationID, ScreeningID, ReservationTypeID, ReservationPaid, MovieID, SeatID, AuditoriumID, CustomerID, SeatReservationID) values (4, 4, 4, true, 4, 4, 4, 4, 4);
insert into Reservation (ReservationID, ScreeningID, ReservationTypeID, ReservationPaid, MovieID, SeatID, AuditoriumID, CustomerID, SeatReservationID) values (5, 5, 5, false, 5, 5, 5, 5, 5);
insert into Reservation (ReservationID, ScreeningID, ReservationTypeID, ReservationPaid, MovieID, SeatID, AuditoriumID, CustomerID, SeatReservationID) values (6, 6, 6, true, 6, 6, 6, 6, 6);
insert into Reservation (ReservationID, ScreeningID, ReservationTypeID, ReservationPaid, MovieID, SeatID, AuditoriumID, CustomerID, SeatReservationID) values (7, 7, 7, false, 7, 7, 7, 7, 7);
insert into Reservation (ReservationID, ScreeningID, ReservationTypeID, ReservationPaid, MovieID, SeatID, AuditoriumID, CustomerID, SeatReservationID) values (8, 8, 8, true, 8, 8, 8, 8, 8);
insert into Reservation (ReservationID, ScreeningID, ReservationTypeID, ReservationPaid, MovieID, SeatID, AuditoriumID, CustomerID, SeatReservationID) values (9, 9, 9, true, 9, 9, 9, 9, 9);
insert into Reservation (ReservationID, ScreeningID, ReservationTypeID, ReservationPaid, MovieID, SeatID, AuditoriumID, CustomerID, SeatReservationID) values (10, 10, 10, false, 10, 10, 10, 10, 10);
insert into Reservation (ReservationID, ScreeningID, ReservationTypeID, ReservationPaid, MovieID, SeatID, AuditoriumID, CustomerID, SeatReservationID) values (11, 11, 11, false, 11, 11, 11, 11, 11);
insert into Reservation (ReservationID, ScreeningID, ReservationTypeID, ReservationPaid, MovieID, SeatID, AuditoriumID, CustomerID, SeatReservationID) values (12, 12, 12, false, 12, 12, 12, 12, 12);
insert into Reservation (ReservationID, ScreeningID, ReservationTypeID, ReservationPaid, MovieID, SeatID, AuditoriumID, CustomerID, SeatReservationID) values (13, 13, 13, false, 13, 13, 13, 13, 13);
insert into Reservation (ReservationID, ScreeningID, ReservationTypeID, ReservationPaid, MovieID, SeatID, AuditoriumID, CustomerID, SeatReservationID) values (14, 14, 14, false, 14, 14, 14, 14, 14);
insert into Reservation (ReservationID, ScreeningID, ReservationTypeID, ReservationPaid, MovieID, SeatID, AuditoriumID, CustomerID, SeatReservationID) values (15, 15, 15, false, 15, 15, 15, 15, 15);
insert into Reservation (ReservationID, ScreeningID, ReservationTypeID, ReservationPaid, MovieID, SeatID, AuditoriumID, CustomerID, SeatReservationID) values (16, 16, 16, false, 16, 16, 16, 16, 16);
insert into Reservation (ReservationID, ScreeningID, ReservationTypeID, ReservationPaid, MovieID, SeatID, AuditoriumID, CustomerID, SeatReservationID) values (17, 17, 17, false, 17, 17, 17, 17, 17);
insert into Reservation (ReservationID, ScreeningID, ReservationTypeID, ReservationPaid, MovieID, SeatID, AuditoriumID, CustomerID, SeatReservationID) values (18, 18, 18, false, 18, 18, 18, 18, 18);
insert into Reservation (ReservationID, ScreeningID, ReservationTypeID, ReservationPaid, MovieID, SeatID, AuditoriumID, CustomerID, SeatReservationID) values (19, 19, 19, true, 19, 19, 19, 19, 19);
insert into Reservation (ReservationID, ScreeningID, ReservationTypeID, ReservationPaid, MovieID, SeatID, AuditoriumID, CustomerID, SeatReservationID) values (20, 20, 20, false, 20, 20, 20, 20, 20);

/*Employee Data*/
insert into Employee (EmployeeID, EmployeeFname, EmployeeLname, EmployeeDOB, EmployeePosition) values (1, 'Grier', 'Oake', '1980/10/20', '35');
insert into Employee (EmployeeID, EmployeeFname, EmployeeLname, EmployeeDOB, EmployeePosition) values (2, 'Verile', 'Hachette', '1962/08/08', '35');
insert into Employee (EmployeeID, EmployeeFname, EmployeeLname, EmployeeDOB, EmployeePosition) values (3, 'Nolie', 'Dayment', '1963/12/18', '35');
insert into Employee (EmployeeID, EmployeeFname, EmployeeLname, EmployeeDOB, EmployeePosition) values (4, 'Nikkie', 'Peschet', '1964/02/13', '35');
insert into Employee (EmployeeID, EmployeeFname, EmployeeLname, EmployeeDOB, EmployeePosition) values (5, 'Kass', 'Gurnell', '1964/11/27', '35');
insert into Employee (EmployeeID, EmployeeFname, EmployeeLname, EmployeeDOB, EmployeePosition) values (6, 'Monty', 'Schmidt', '1973/03/29', '35');
insert into Employee (EmployeeID, EmployeeFname, EmployeeLname, EmployeeDOB, EmployeePosition) values (7, 'Steffie', 'Lundie', '1980/11/08', '35');
insert into Employee (EmployeeID, EmployeeFname, EmployeeLname, EmployeeDOB, EmployeePosition) values (8, 'Rex', 'Duckerin', '1985/01/16', '35');
insert into Employee (EmployeeID, EmployeeFname, EmployeeLname, EmployeeDOB, EmployeePosition) values (9, 'Harriet', 'Tavner', '1988/02/18', '35');
insert into Employee (EmployeeID, EmployeeFname, EmployeeLname, EmployeeDOB, EmployeePosition) values (10, 'Willabella', 'Freckelton', '1988/06/28', '35');
insert into Employee (EmployeeID, EmployeeFname, EmployeeLname, EmployeeDOB, EmployeePosition) values (11, 'Harcourt', 'Moran', '1991/07/11', '35');
insert into Employee (EmployeeID, EmployeeFname, EmployeeLname, EmployeeDOB, EmployeePosition) values (12, 'Sib', 'Commuzzo', '1994/01/23', '35');
insert into Employee (EmployeeID, EmployeeFname, EmployeeLname, EmployeeDOB, EmployeePosition) values (13, 'Hubie', 'Kristoffersson', '1995/01/23', '35');
insert into Employee (EmployeeID, EmployeeFname, EmployeeLname, EmployeeDOB, EmployeePosition) values (14, 'Ronald', 'De Lasci', '1996/05/16', '35');
insert into Employee (EmployeeID, EmployeeFname, EmployeeLname, EmployeeDOB, EmployeePosition) values (15, 'Eulalie', 'Parkhouse', '1998/01/17', '35');
insert into Employee (EmployeeID, EmployeeFname, EmployeeLname, EmployeeDOB, EmployeePosition) values (16, 'Gwenore', 'Scrase', '1999/01/02', '35');
insert into Employee (EmployeeID, EmployeeFname, EmployeeLname, EmployeeDOB, EmployeePosition) values (17, 'Nicoli', 'Booth-Jarvis', '1999/10/10', '35');
insert into Employee (EmployeeID, EmployeeFname, EmployeeLname, EmployeeDOB, EmployeePosition) values (18, 'Wilhelmina', 'Clowes', '2003/12/05', '35');
insert into Employee (EmployeeID, EmployeeFname, EmployeeLname, EmployeeDOB, EmployeePosition) values (19, 'Hercule', 'Buten', '2005/11/15', '35');
insert into Employee (EmployeeID, EmployeeFname, EmployeeLname, EmployeeDOB, EmployeePosition) values (20, 'Zachary', 'Held', '2001/08/27', '35');


/*ReservationType Data*/
insert into ReservationType (ReservationTypeID, ReservationID) values (1, 1);
insert into ReservationType (ReservationTypeID, ReservationID) values (2, 2);
insert into ReservationType (ReservationTypeID, ReservationID) values (3, 3);
insert into ReservationType (ReservationTypeID, ReservationID) values (4, 4);
insert into ReservationType (ReservationTypeID, ReservationID) values (5, 5);
insert into ReservationType (ReservationTypeID, ReservationID) values (6, 6);
insert into ReservationType (ReservationTypeID, ReservationID) values (7, 7);
insert into ReservationType (ReservationTypeID, ReservationID) values (8, 8);
insert into ReservationType (ReservationTypeID, ReservationID) values (9, 9);
insert into ReservationType (ReservationTypeID, ReservationID) values (10, 10);
insert into ReservationType (ReservationTypeID, ReservationID) values (11, 11);
insert into ReservationType (ReservationTypeID, ReservationID) values (12, 12);
insert into ReservationType (ReservationTypeID, ReservationID) values (13, 13);
insert into ReservationType (ReservationTypeID, ReservationID) values (14, 14);
insert into ReservationType (ReservationTypeID, ReservationID) values (15, 15);
insert into ReservationType (ReservationTypeID, ReservationID) values (16, 16);
insert into ReservationType (ReservationTypeID, ReservationID) values (17, 17);
insert into ReservationType (ReservationTypeID, ReservationID) values (18, 18);
insert into ReservationType (ReservationTypeID, ReservationID) values (19, 19);
insert into ReservationType (ReservationTypeID, ReservationID) values (20, 20);

/*Customer Data*/
insert into Customer (CustomerID, CustomerFname, CustomerLname, ReservationID) values (1, 'Forbes', 'Bernhardsson', 1);
insert into Customer (CustomerID, CustomerFname, CustomerLname, ReservationID) values (2, 'Merrill', 'Finlason', 2);
insert into Customer (CustomerID, CustomerFname, CustomerLname, ReservationID) values (3, 'Marian', 'Jaquet', 3);
insert into Customer (CustomerID, CustomerFname, CustomerLname, ReservationID) values (4, 'Antoinette', 'Franceschelli', 4);
insert into Customer (CustomerID, CustomerFname, CustomerLname, ReservationID) values (5, 'West', 'Tour', 5);
insert into Customer (CustomerID, CustomerFname, CustomerLname, ReservationID) values (6, 'Sherwood', 'Goghin', 6);
insert into Customer (CustomerID, CustomerFname, CustomerLname, ReservationID) values (7, 'Rem', 'Wasiela', 7);
insert into Customer (CustomerID, CustomerFname, CustomerLname, ReservationID) values (8, 'Blisse', 'Juanico', 8);
insert into Customer (CustomerID, CustomerFname, CustomerLname, ReservationID) values (9, 'Mitchael', 'Mattedi', 9);
insert into Customer (CustomerID, CustomerFname, CustomerLname, ReservationID) values (10, 'Antin', 'Johns', 10);
insert into Customer (CustomerID, CustomerFname, CustomerLname, ReservationID) values (11, 'Mischa', 'Coye', 11);
insert into Customer (CustomerID, CustomerFname, CustomerLname, ReservationID) values (12, 'Dulcy', 'Sidden', 12);
insert into Customer (CustomerID, CustomerFname, CustomerLname, ReservationID) values (13, 'Basia', 'Turford', 13);
insert into Customer (CustomerID, CustomerFname, CustomerLname, ReservationID) values (14, 'Antin', 'Crammy', 14);
insert into Customer (CustomerID, CustomerFname, CustomerLname, ReservationID) values (15, 'Freeman', 'Escalante', 15);
insert into Customer (CustomerID, CustomerFname, CustomerLname, ReservationID) values (16, 'Colet', 'Jon', 16);
insert into Customer (CustomerID, CustomerFname, CustomerLname, ReservationID) values (17, 'Lorne', 'Size', 17);
insert into Customer (CustomerID, CustomerFname, CustomerLname, ReservationID) values (18, 'Gwenette', 'Lukovic', 18);
insert into Customer (CustomerID, CustomerFname, CustomerLname, ReservationID) values (19, 'Vivyan', 'Poytres', 19);
insert into Customer (CustomerID, CustomerFname, CustomerLname, ReservationID) values (20, 'Molly', 'Dudding', 20);

/*Auditorium Data*/
insert into Auditorium (AuditoriumID, AuditoriumSeats, MovieID, ScreeningID, ReservationID, SeatID, EmployeeID) values (1, 3, 1, 1, 1, 1, 1);
insert into Auditorium (AuditoriumID, AuditoriumSeats, MovieID, ScreeningID, ReservationID, SeatID, EmployeeID) values (2, 99, 2, 2, 2, 2, 2);
insert into Auditorium (AuditoriumID, AuditoriumSeats, MovieID, ScreeningID, ReservationID, SeatID, EmployeeID) values (3, 33, 3, 3, 3, 3, 3);
insert into Auditorium (AuditoriumID, AuditoriumSeats, MovieID, ScreeningID, ReservationID, SeatID, EmployeeID) values (4, 98, 4, 4, 4, 4, 4);
insert into Auditorium (AuditoriumID, AuditoriumSeats, MovieID, ScreeningID, ReservationID, SeatID, EmployeeID) values (5, 96, 5, 5, 5, 5, 5);
insert into Auditorium (AuditoriumID, AuditoriumSeats, MovieID, ScreeningID, ReservationID, SeatID, EmployeeID) values (6, 41, 6, 6, 6, 6, 6);
insert into Auditorium (AuditoriumID, AuditoriumSeats, MovieID, ScreeningID, ReservationID, SeatID, EmployeeID) values (7, 98, 7, 7, 7, 7, 7);
insert into Auditorium (AuditoriumID, AuditoriumSeats, MovieID, ScreeningID, ReservationID, SeatID, EmployeeID) values (8, 38, 8, 8, 8, 8, 8);
insert into Auditorium (AuditoriumID, AuditoriumSeats, MovieID, ScreeningID, ReservationID, SeatID, EmployeeID) values (9, 64, 9, 9, 9, 9, 9);
insert into Auditorium (AuditoriumID, AuditoriumSeats, MovieID, ScreeningID, ReservationID, SeatID, EmployeeID) values (10, 63, 10, 10, 10, 10, 10);
insert into Auditorium (AuditoriumID, AuditoriumSeats, MovieID, ScreeningID, ReservationID, SeatID, EmployeeID) values (11, 7, 11, 11, 11, 11, 11);
insert into Auditorium (AuditoriumID, AuditoriumSeats, MovieID, ScreeningID, ReservationID, SeatID, EmployeeID) values (12, 36, 12, 12, 12, 12, 12);
insert into Auditorium (AuditoriumID, AuditoriumSeats, MovieID, ScreeningID, ReservationID, SeatID, EmployeeID) values (13, 28, 13, 13, 13, 13, 13);
insert into Auditorium (AuditoriumID, AuditoriumSeats, MovieID, ScreeningID, ReservationID, SeatID, EmployeeID) values (14, 30, 14, 14, 14, 14, 14);
insert into Auditorium (AuditoriumID, AuditoriumSeats, MovieID, ScreeningID, ReservationID, SeatID, EmployeeID) values (15, 78, 15, 15, 15, 15, 15);
insert into Auditorium (AuditoriumID, AuditoriumSeats, MovieID, ScreeningID, ReservationID, SeatID, EmployeeID) values (16, 34, 16, 16, 16, 16, 16);
insert into Auditorium (AuditoriumID, AuditoriumSeats, MovieID, ScreeningID, ReservationID, SeatID, EmployeeID) values (17, 58, 17, 17, 17, 17, 17);
insert into Auditorium (AuditoriumID, AuditoriumSeats, MovieID, ScreeningID, ReservationID, SeatID, EmployeeID) values (18, 67, 18, 18, 18, 18, 18);
insert into Auditorium (AuditoriumID, AuditoriumSeats, MovieID, ScreeningID, ReservationID, SeatID, EmployeeID) values (19, 36, 19, 19, 19, 19, 19);
insert into Auditorium (AuditoriumID, AuditoriumSeats, MovieID, ScreeningID, ReservationID, SeatID, EmployeeID) values (20, 78, 20, 20, 20, 20, 20);

/*Seat Data*/
insert into Seat (SeatID, SeatRows, SeatNumber, AuditoriumID, ReservationID) values (1, 1, 2, 1, 1);
insert into Seat (SeatID, SeatRows, SeatNumber, AuditoriumID, ReservationID) values (2, 2, 32, 2, 2);
insert into Seat (SeatID, SeatRows, SeatNumber, AuditoriumID, ReservationID) values (3, 3, 51, 3, 3);
insert into Seat (SeatID, SeatRows, SeatNumber, AuditoriumID, ReservationID) values (4, 4, 92, 4, 4);
insert into Seat (SeatID, SeatRows, SeatNumber, AuditoriumID, ReservationID) values (5, 5, 69, 5, 5);
insert into Seat (SeatID, SeatRows, SeatNumber, AuditoriumID, ReservationID) values (6, 6, 53, 6, 6);
insert into Seat (SeatID, SeatRows, SeatNumber, AuditoriumID, ReservationID) values (7, 7, 55, 7, 7);
insert into Seat (SeatID, SeatRows, SeatNumber, AuditoriumID, ReservationID) values (8, 8, 57, 8, 8);
insert into Seat (SeatID, SeatRows, SeatNumber, AuditoriumID, ReservationID) values (9, 9, 91, 9, 9);
insert into Seat (SeatID, SeatRows, SeatNumber, AuditoriumID, ReservationID) values (10, 10, 22, 10, 10);
insert into Seat (SeatID, SeatRows, SeatNumber, AuditoriumID, ReservationID) values (11, 11, 1, 11, 11);
insert into Seat (SeatID, SeatRows, SeatNumber, AuditoriumID, ReservationID) values (12, 12, 94, 12, 12);
insert into Seat (SeatID, SeatRows, SeatNumber, AuditoriumID, ReservationID) values (13, 13, 83, 13, 13);
insert into Seat (SeatID, SeatRows, SeatNumber, AuditoriumID, ReservationID) values (14, 14, 77, 14, 14);
insert into Seat (SeatID, SeatRows, SeatNumber, AuditoriumID, ReservationID) values (15, 15, 82, 15, 15);
insert into Seat (SeatID, SeatRows, SeatNumber, AuditoriumID, ReservationID) values (16, 16, 63, 16, 16);
insert into Seat (SeatID, SeatRows, SeatNumber, AuditoriumID, ReservationID) values (17, 17, 28, 17, 17);
insert into Seat (SeatID, SeatRows, SeatNumber, AuditoriumID, ReservationID) values (18, 18, 26, 18, 18);
insert into Seat (SeatID, SeatRows, SeatNumber, AuditoriumID, ReservationID) values (19, 19, 47, 19, 19);
insert into Seat (SeatID, SeatRows, SeatNumber, AuditoriumID, ReservationID) values (20, 20, 44, 20, 20);

/*SeatReservation Data*/
insert into SeatReservation (SeatReservationID, SeatID, ReservationID, ScreeningID) values (1, 1, 1, 1);
insert into SeatReservation (SeatReservationID, SeatID, ReservationID, ScreeningID) values (2, 2, 2, 2);
insert into SeatReservation (SeatReservationID, SeatID, ReservationID, ScreeningID) values (3, 3, 3, 3);
insert into SeatReservation (SeatReservationID, SeatID, ReservationID, ScreeningID) values (4, 4, 4, 4);
insert into SeatReservation (SeatReservationID, SeatID, ReservationID, ScreeningID) values (5, 5, 5, 5);
insert into SeatReservation (SeatReservationID, SeatID, ReservationID, ScreeningID) values (6, 6, 6, 6);
insert into SeatReservation (SeatReservationID, SeatID, ReservationID, ScreeningID) values (7, 7, 7, 7);
insert into SeatReservation (SeatReservationID, SeatID, ReservationID, ScreeningID) values (8, 8, 8, 8);
insert into SeatReservation (SeatReservationID, SeatID, ReservationID, ScreeningID) values (9, 9, 9, 9);
insert into SeatReservation (SeatReservationID, SeatID, ReservationID, ScreeningID) values (10, 10, 10, 10);
insert into SeatReservation (SeatReservationID, SeatID, ReservationID, ScreeningID) values (11, 11, 11, 11);
insert into SeatReservation (SeatReservationID, SeatID, ReservationID, ScreeningID) values (12, 12, 12, 12);
insert into SeatReservation (SeatReservationID, SeatID, ReservationID, ScreeningID) values (13, 13, 13, 13);
insert into SeatReservation (SeatReservationID, SeatID, ReservationID, ScreeningID) values (14, 14, 14, 14);
insert into SeatReservation (SeatReservationID, SeatID, ReservationID, ScreeningID) values (15, 15, 15, 15);
insert into SeatReservation (SeatReservationID, SeatID, ReservationID, ScreeningID) values (16, 16, 16, 16);
insert into SeatReservation (SeatReservationID, SeatID, ReservationID, ScreeningID) values (17, 17, 17, 17);
insert into SeatReservation (SeatReservationID, SeatID, ReservationID, ScreeningID) values (18, 18, 18, 18);
insert into SeatReservation (SeatReservationID, SeatID, ReservationID, ScreeningID) values (19, 19, 19, 19);
insert into SeatReservation (SeatReservationID, SeatID, ReservationID, ScreeningID) values (20, 20, 20, 20);

/*Movie Data*/
insert into Movie (MovieID, MovieTitle, MovieDirector, MovieCast, MovieDescription, MovieDuration, ScreeningID) values (1, 'Godzilla and Mothra: The Battle for Earth (Gojira vs. Mosura)', '35', '35', '100', '35', 1);
insert into Movie (MovieID, MovieTitle, MovieDirector, MovieCast, MovieDescription, MovieDuration, ScreeningID) values (2, 'Man Who Couldn''t Say No, The (Mies joka ei osannut sanoa EI)', '35', '35', '100', '35', 2);
insert into Movie (MovieID, MovieTitle, MovieDirector, MovieCast, MovieDescription, MovieDuration, ScreeningID) values (3, 'Waiting For Armageddon', '35', '35', '100', '35', 3);
insert into Movie (MovieID, MovieTitle, MovieDirector, MovieCast, MovieDescription, MovieDuration, ScreeningID) values (4, 'Pekka ja Pätkä lumimiehen jäljillä', '35', '35', '100', '35', 4);
insert into Movie (MovieID, MovieTitle, MovieDirector, MovieCast, MovieDescription, MovieDuration, ScreeningID) values (5, 'Home of the Brave', '35', '35', '100', '35', 5);
insert into Movie (MovieID, MovieTitle, MovieDirector, MovieCast, MovieDescription, MovieDuration, ScreeningID) values (6, 'To Hell and Back', '35', '35', '100', '35', 6);
insert into Movie (MovieID, MovieTitle, MovieDirector, MovieCast, MovieDescription, MovieDuration, ScreeningID) values (7, 'Scarlet Letter, The', '35', '35', '100', '35', 7);
insert into Movie (MovieID, MovieTitle, MovieDirector, MovieCast, MovieDescription, MovieDuration, ScreeningID) values (8, 'C.R.A.Z.Y.', '35', '35', '100', '35', 8);
insert into Movie (MovieID, MovieTitle, MovieDirector, MovieCast, MovieDescription, MovieDuration, ScreeningID) values (9, 'Yu-Gi-Oh!', '35', '35', '100', '35', 9);
insert into Movie (MovieID, MovieTitle, MovieDirector, MovieCast, MovieDescription, MovieDuration, ScreeningID) values (10, 'Faith Like Potatoes', '35', '35', '100', '35', 10);
insert into Movie (MovieID, MovieTitle, MovieDirector, MovieCast, MovieDescription, MovieDuration, ScreeningID) values (11, 'Riley Rewind', '35', '35', '100', '35', 11);
insert into Movie (MovieID, MovieTitle, MovieDirector, MovieCast, MovieDescription, MovieDuration, ScreeningID) values (12, 'Sorority Wars', '35', '35', '100', '35', 12);
insert into Movie (MovieID, MovieTitle, MovieDirector, MovieCast, MovieDescription, MovieDuration, ScreeningID) values (13, 'Getting It Right', '35', '35', '100', '35', 13);
insert into Movie (MovieID, MovieTitle, MovieDirector, MovieCast, MovieDescription, MovieDuration, ScreeningID) values (14, 'Great Stone Face, The', '35', '35', '100', '35', 14);
insert into Movie (MovieID, MovieTitle, MovieDirector, MovieCast, MovieDescription, MovieDuration, ScreeningID) values (15, 'The Missionaries', '35', '35', '100', '35', 15);
insert into Movie (MovieID, MovieTitle, MovieDirector, MovieCast, MovieDescription, MovieDuration, ScreeningID) values (16, 'Never on Sunday (Pote tin Kyriaki)', '35', '35', '100', '35', 16);
insert into Movie (MovieID, MovieTitle, MovieDirector, MovieCast, MovieDescription, MovieDuration, ScreeningID) values (17, 'Longtime Companion', '35', '35', '100', '35', 17);
insert into Movie (MovieID, MovieTitle, MovieDirector, MovieCast, MovieDescription, MovieDuration, ScreeningID) values (18, 'Masque of the Red Death, The', '35', '35', '100', '35', 18);
insert into Movie (MovieID, MovieTitle, MovieDirector, MovieCast, MovieDescription, MovieDuration, ScreeningID) values (19, 'Wrong Turn at Tahoe', '35', '35', '100', '35', 19);
insert into Movie (MovieID, MovieTitle, MovieDirector, MovieCast, MovieDescription, MovieDuration, ScreeningID) values (20, 'Twice Upon a Yesterday (a.k.a. Man with Rain in His Shoes, The)', '35', '35', '100', '35', 20);

/*Screening Data*/
insert into Screening (ScreeningID, MovieID, AuditoriumID) values (1, 1, 1);
insert into Screening (ScreeningID, MovieID, AuditoriumID) values (2, 2, 2);
insert into Screening (ScreeningID, MovieID, AuditoriumID) values (3, 3, 3);
insert into Screening (ScreeningID, MovieID, AuditoriumID) values (4, 4, 4);
insert into Screening (ScreeningID, MovieID, AuditoriumID) values (5, 5, 5);
insert into Screening (ScreeningID, MovieID, AuditoriumID) values (6, 6, 6);
insert into Screening (ScreeningID, MovieID, AuditoriumID) values (7, 7, 7);
insert into Screening (ScreeningID, MovieID, AuditoriumID) values (8, 8, 8);
insert into Screening (ScreeningID, MovieID, AuditoriumID) values (9, 9, 9);
insert into Screening (ScreeningID, MovieID, AuditoriumID) values (10, 10, 10);
insert into Screening (ScreeningID, MovieID, AuditoriumID) values (11, 11, 11);
insert into Screening (ScreeningID, MovieID, AuditoriumID) values (12, 12, 12);
insert into Screening (ScreeningID, MovieID, AuditoriumID) values (13, 13, 13);
insert into Screening (ScreeningID, MovieID, AuditoriumID) values (14, 14, 14);
insert into Screening (ScreeningID, MovieID, AuditoriumID) values (15, 15, 15);
insert into Screening (ScreeningID, MovieID, AuditoriumID) values (16, 16, 16);
insert into Screening (ScreeningID, MovieID, AuditoriumID) values (17, 17, 17);
insert into Screening (ScreeningID, MovieID, AuditoriumID) values (18, 18, 18);
insert into Screening (ScreeningID, MovieID, AuditoriumID) values (19, 19, 19);
insert into Screening (ScreeningID, MovieID, AuditoriumID) values (20, 20, 20);
