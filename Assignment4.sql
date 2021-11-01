CREATE DATABASE MovieTheaterDatabase;

DROP TABLE IF EXISTS `Reservation`;
FLUSH TABLE `Reservation`;
DROP TABLE IF EXISTS `Employee`;
FLUSH TABLES `Employee`;

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
	EmployeeDOB			INT			NULL,
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
	MovieTitle			Char(25)	NOT NULL,
	MovieDirector		Char(25)	NOT NULL,
	MovieCast			Char(25)	NOT NULL,
	MovieDescription 	Char(100)	NOT NULL,
	MovieDuration		INT			NULL,
	ScreeningID			INT			NULL,
	CONSTRAINT			Movie_PK	Primary Key(MovieID)
);

CREATE TABLE Screening(
	ScreeningID			Int		Not NULL,
    MovieID				Int		NULL,
    AuditoriumID		INT		NULL,
    constraint			Screening_PK		primary key(ScreeningID),
    constraint			SCREEN_RES_FK		foreign key(ReservationID)
											references Reservation(ReservationID),
	constraint			SCREEN_MOV_FK		foreign key(MovieID)
											references Movie(MovieID),
	constraint			SCREEN_AUD_FK		foreign key(AuditoriumID)
											references Auditorium(AuditoriumID)
);