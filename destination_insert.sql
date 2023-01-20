insert into destination (destinationid, destinationname, Openinghours, Phonenumber, City , State, Country, Destination_Rating) values 
(52, 'CBR Mall', '9:29 AM', 9379827079, 'Hyderabad','Telangana', 'India', 2),
(21, 'infinity mall', '12:26 PM', 7196734348, 'Mumbai', 'Maharashtra', 'India', 2),
(2, 'Eifel Tower', '8:20 PM', 7192381584, 'Paris', 'iledefrance', 'France', 2),
(40, 'Brickell City Centre', '5:38 AM', 3057402176, 'Miami', 'Florida', 'United States', 1),
(36, 'NotreDame Cathedral', '2:07 PM', 3367006444, 'Paris', 'Iledefrance', 'France', 4),
(12, 'Vieux Port', '6:45 PM', 2145305229, 'Marseille', 'Provence', 'France', 3),
(65, 'Vieux Lyon', '3:09 PM', 6053549056, 'lyon', 'Rhone Department', 'France', 5),
(37, 'Petite France district', '2:42 AM', 6198064667, 'Corsica', 'CorseduSud', 'France', 5),
(87, 'Roman amphitheatre', '5:25 AM', 3613573980, 'Nimes', 'Occitania', 'France', 4),
(66, 'BeauxArts museum', '4:13 PM', 2519450017, 'Lille', 'Nord Department', 'France', 2),
(45, 'Crocker Art Museuem', '9:01 AM', 9712317760, 'Sacramento', 'California', 'United States', 3),
(80, 'El Paso Museum of Art', '11:48 PM', 3607488328, 'El Paso', 'texas', 'United States', 5),
(8, 'House of Blues Dallas', '4:40 AM', 9368345365, 'Dallas', 'Texas', 'United States', 4),
(9, 'Connecticut River Walk', '9:44 AM', 8601164789, 'Springfield', 'Connecticut', 'United States', 3),
(19, 'Stonestown Galleria', '2:55 PM', 4047918238, 'San Francisco', 'California', 'United States', 3),
(58, 'Faneuil Hall', '1:32 AM', 9088777824, 'Boston', 'Massachusetts', 'United States', 3),
(41, 'Kalamazoo', '2:27 AM', 2691845215, 'Everett', 'Michigan', 'United States', 5),
(34, 'Museum of the American GI', '10:20 AM', 8034232533, 'College Station', 'Texas', 'United States', 2),
(86, 'Times Square', '2:33 AM', 2023458886, 'New York City', 'New York State', 'United States', 4),
(78, 'Mister As Restaurant', '12:45 PM', 6095363677, 'San Diego', 'California', 'United States', 5),
(90, 'The Galleria', '8:10 AM', 7138397408, 'Houston', 'Texas', 'United States', 3),
(48, 'Art Institute of Chicago', '1:30 PM', 3128685948, 'Chicago', 'Illinois', 'United States', 3),
(93, 'Muncie', '12:25 PM', 7655024713, 'Boston', 'Indiana', 'United States', 5),
(57, 'Red Fort', '6:57 AM', 2098364877, 'New Delhi', 'Delhi', 'India', 5),
(27, 'The Chanakya Mall', '6:48 PM', 8642959100, 'New Delhi', 'Delhi', 'India', 5),
(25, 'CityWalk Mall', '2:20 AM', 8584354880, 'New Delhi', 'Delhi', 'India', 2),
(16, 'The Spice Route', '10:25 AM', 3092257856, 'New Delhi', 'Delhi', 'India', 5),
(18, 'Tamra Restaurant', '4:48 AM', 5616589607, 'New Delhi', 'Delhi', 'India', 5),
(46, 'Falaknuma Palace', '12:10 PM', 7703070314, 'Hyderabad','Telangana', 'India', 1),
(26, 'Pista House Restaurant', '8:56 AM', 8124237267, 'Hyderabad','Telangana', 'India', 2),
(75, 'Seven Tombs', '4:14 AM', 9716462277, 'Hyderabad','Telangana', 'India', 4),
(98, 'Inorbit Mall', '3:49 PM', 5051358882, 'Hyderabad','Telangana', 'India', 4),
(24, 'Salarjung Museuem', '4:45 PM', 8065462477, 'Hyderabad','Telangana', 'India', 2),
(5, 'GVK Mall', '8:01 AM', 6785828242, 'Hyderabad','Telangana', 'India', 2),
(7, 'Shah Ghouse Restaurant', '11:37 AM', 5044782375, 'Hyderabad','Telangana', 'India', 5),
(17, 'Great Wall of China', '3:17 PM', 2163239301, 'Beijing', 'Shunyi District', 'China', 1),
(95, 'Villa Montez', '11:22 PM', 8587467701, 'Tyler', 'Texas', 'United States', 4),
(96, 'Happys Fish House', '9:24 PM', 3528670144, 'Tyler', 'Texas', 'United States', 3),
(3, 'Mamas Restaurant', '1:44 PM', 4109645143, 'Tyler', 'Texas', 'United States', 2),
(62, 'Texas Roadhouse', '6:39 PM', 3106478507, 'Tyler', 'Texas', 'United States', 5);
 select * from destination;





 with a as(
select * from travels where destinationid in
(select Destinationid from destination d where  country = 'France'))
, b as (select memberid from a group by memberid having count(*) > = 21)
, c as (select a.Memberid, a.Destinationid, dd.name , dd.state from a, b , destination dd where a.memberid = b.memberid and dd.Destinationid = a.Destinationid
and dd.state in (select distinct state from destination where  country = 'France' group by state))
 , d as (select min((potential_cost)) as Minimum,max((potential_cost)) as Maximum,Avg((potential_cost)) as Average , memberid
from  Trip_Attractions TA, c where c.Destinationid = TA.destinationid and TA.Purpose IN ('sight','restaurant') group by memberid)
select d.*, a.Member_Name, a.username from d , AuthorizedMembers a where d.Memberid = a.Memberid
