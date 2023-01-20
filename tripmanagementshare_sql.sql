create table destination(
Destinationid int Primary key,
destinationname varchar(50),
Openinghours time,
Phonenumber int,
City varchar(20),
State  varchar(20),
Country varchar(20),
Destination_Rating INT CHECK (Destination_Rating BETWEEN 1 AND 5),
);



create table AuthorizedMembers(
Memberid int primary key,
Member_Name varchar(50),
username varchar(40) NOT NULL unique,
emailaddress varchar(50),
password varchar(50),
member_Address varchar(50),
memberranking int,
date_of_birth DATETIME,
number_of_followers int,
number_of_people_followed int,
member_status varchar(40),
Destinationid int,
FOREIGN KEY (DestinationID) REFERENCES Destination(DestinationID));

create table sight( 
ticketprice int,
Weblink varchar(100),
destinationid int primary key,
FOREIGN KEY (DestinationID) REFERENCES Destination(DestinationID)
);

create table restaurant( 
Weblink varchar(40),
Consumption_per_capita int,
Restaurant_Rating INT CHECK (Restaurant_Rating BETWEEN 1 AND 5),
destinationid int primary key,
FOREIGN KEY (DestinationID) REFERENCES Destination(DestinationID));

select * from destination;

create table shopping( 
weblink varchar(30),
destinationid int primary key,
FOREIGN KEY (DestinationID) REFERENCES Destination(DestinationID));

create table BusinessPartner(
BpID int primary key,
BusinessName varchar(50),
BusinessType varchar(50),
destinationid int,
Contact_Person varchar(40),
business_contact_number varchar(20),
FOREIGN KEY (DestinationID) REFERENCES Destination(DestinationID));

select * from destination;

create table Comments(
commentid int primary key,
Memberid int,
Destinationid int,
posted_date DATETIME,
posted_time DATETIME,
Content varchar(1000),
Rating INT CHECK (Rating BETWEEN 1 AND 5),
LikeDislike VARCHAR(10) CHECK (LikeDislike IN('Like','Dislike')),
reply_content varchar(50),
foreign key(Memberid) References AuthorizedMembers(Memberid),
FOREIGN KEY (DestinationID) REFERENCES Destination(DestinationID));

create table images(
Memberid int,
Destinationid int,
destinationname varchar(50),
imageid int primary key,
imagelink varchar(50),
foreign key(Memberid) References AuthorizedMembers(Memberid),
FOREIGN KEY (DestinationID) REFERENCES Destination(DestinationID));

create table destinationdescription(
memberid int primary key,
destinationid int,
ModifiedDate DATETIME,
Foreign key (memberid) references authorizedmembers(memberid),
FOREIGN KEY (DestinationID) REFERENCES Destination(DestinationID)
);

create table regular_members( 
MemberID int primary key,
number_of_followers int,
FOREIGN KEY (MemberID) REFERENCES AuthorizedMembers(MemberID),
);


create table associated(
bpid int,
Destinationid int,
primary key(bpid, Destinationid),
FOREIGN KEY (DestinationID) REFERENCES Destination(DestinationID),
FOREIGN KEY (BPID) REFERENCES BusinessPartner(BPID)
);


create table preferred_members( 
MemberID int primary key,
number_of_followers int,
FOREIGN KEY (MemberID) REFERENCES AuthorizedMembers(MemberID),
);

create table waysoftravel( 
Destinationid int primary key,
waytravel varchar(50)
FOREIGN KEY (DestinationID) REFERENCES Destination(DestinationID));

create table wish_Destination(
Memberid int,
wishlist varchar(1000),
foreign key(Memberid) References AuthorizedMembers(Memberid));


create table visited_Destination(
Memberid int,
visitedlist varchar(1000),
foreign key(Memberid) References AuthorizedMembers(Memberid));

create table travels(
memberid int,
Destinationid int,
primary key(memberid, Destinationid),
FOREIGN KEY (DestinationID) REFERENCES Destination(DestinationID),
foreign key(Memberid) References AuthorizedMembers(Memberid)
);

create table TripPlan(
Planid int primary key,
Memberid int,
Destinationid int,
plan_name varchar(50),
purpose_of_visit varchar(50),
Start_Date_Time DATETIME,
End_Date_Time DATETIME,
Duration varchar(20),
Arrival_time DATETIME,
Departure_time DATETIME,
Potential_Cost int,
foreign key(Memberid) References AuthorizedMembers(Memberid),
FOREIGN KEY (DestinationID) REFERENCES Destination(DestinationID));

create table Attractions(
Attractionid int primary key,
type_of_attraction varchar(50),
Memberid int,
Arrival_time DATETIME,
Departure_time DATETIME,
Destinationid int,
Potential_Cost DECIMAL(7,2),
foreign key(Memberid) References AuthorizedMembers(Memberid),
FOREIGN KEY (DestinationID) REFERENCES Destination(DestinationID));



create table Rates( 
MemberID int,
destinationID int,
Planid int,
rateid int primary key,
plan_rating INT CHECK (plan_rating BETWEEN 1 AND 5),
FOREIGN KEY (MemberID) REFERENCES AuthorizedMembers(MemberID),
FOREIGN KEY (DestinationID) REFERENCES Destination(DestinationID)
);





