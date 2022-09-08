/* UC1 */
create database AddressBookService;
use AddressBookService;

/* UC2 */
create table AddressBook
(
firstName Varchar(255),
lastName varchar(255),
address varchar(255),
city char(255),
state char(255),
zip INT,
phoneNumber BIGINT,
email NVARCHAR(255)
);
SELECT * FROM AddressBook;

/* UC3 */
INSERT INTO AddressBook VALUES('vetri','velan', 'Anbunagar', 'hosur','banglore',635109,1234567815,'vetrivel.kce@gmail.com');
INSERT INTO AddressBook VALUES('gomathi','palanivelu', 'shakthi illam', 'dpuri','tamilnadu',635116,7894561235,'gomathipalanivelu456@gmail.com');
INSERT INTO AddressBook VALUES('lavanya','karthikeyan', 'vijaya homes', 'salem','tamilnadu',635008,4561237895,'lavanyakarthikeyan54@gmail.com');
INSERT INTO AddressBook VALUES('rithun','sakthi', 'Anbunagar',Anbunagar 'Benguluru','Karnatka',635108,7891234568,'rithunsakthi158@gmail.com');

SELECT * FROM AddressBook;

/* UC4 */
--Update AddressBook SET address = 'anbu nagar' WHERE firstName = 'Vetri';
--SELECT * FROM AddressBook;
Alter table AddressBook Drop column phoneNumber;
Alter table AddressBook Add phoneNumber BIGINT;

Drop table AddressBook;

/* UC2 */
create table AddressBook
(
firstName Varchar(255),
lastName varchar(255),
address varchar(255),
city char(255),
state char(255),
zip INT,
phoneNumber BIGINT,
email VARCHAR(255)
)
SELECT * FROM AddressBook;

/* UC 3 */
INSERT INTO AddressBook VALUES('vetri','velan', 'Anbunagar', 'hosur','banglore',635109,1234567815,'vetrivel.kce@gmail.com');
INSERT INTO AddressBook VALUES(''gomathi','palanivelu', 'shakthi illam', 'dpuri','tamilnadu',635116,7894561235,'gomathipalanivelu456@gmail.com'');
INSERT INTO AddressBook VALUES('lavanya','karthikeyan', 'vijaya homes', 'salem','tamilnadu',635008,4561237895,'lavanyakarthikeyan54@gmail.com');
INSERT INTO AddressBook VALUES('rithun','sakthi', 'Anbunagar',Anbunagar 'Benguluru','Karnatka',635108,7891234568,'rithunsakthi158@gmail.com');

SELECT * FROM AddressBook;


/* UC4 */
Update AddressBook SET address = 'vetrivel residence ' WHERE firstName = 'Vetri';
SELECT * FROM AddressBook;

Update AddressBook SET firstName = 'rithun' where email = 'rithunsakthi158@gmail.com';
Update AddressBook SET address = 'sivajinagar' where email = 'rithunsakthi158@gmail.com';
Update AddressBook SET city = 'Benguluru' where email = 'rithunsakthi158@gmail.com';
Update AddressBook SET state = 'Karnatka' where email = 'rithunsakthi158@gmail.com';
SELECT * FROM AddressBook;

/* UC5 */
INSERT INTO AddressBook VALUES('Anusha nanjappa','', 'vijayawada', 'guntur','andhra',513468,9548621458,'anushananjappa123@gmail.com');
DELETE FROM AddressBook WHERE firstName = 'Anushananjappa';
SELECT * FROM AddressBook;

/* UC6 */
SELECT firstName, lastName, address, state, zip, phoneNumber, email from AddressBook where city = 'benguluru';
SELECT firstName, lastName, address, city, zip, phoneNumber, email from AddressBook where state = 'andra';

/* UC7 */
SELECT city, count(city) from AddressBook Group BY city;
SELECT state, count(state) from AddressBook Group BY state;

/* UC8 */
SELECT firstName, lastName, address, city, state, zip, phoneNumber, email from AddressBook where city = 'hosur' ORDER BY firstName;

/* UC9 */
alter table AddressBook Add Type VARCHAR(255);
SELECT * from AddressBook;

Update AddressBook SET Type = 'Professional' WHERE firstName = 'khishan';
Update AddressBook SET Type = 'Family' WHERE firstName = 'Anusha';
Update AddressBook SET Type = 'Friend' WHERE firstName = 'viajyakala';
Update AddressBook SET Type = 'Friend' WHERE firstName = 'rithun';

/* UC10 */
SELECT Type, COUNT(Type) FROM AddressBook Group BY Type;  

/* UC11 */
INSERT INTO AddressBook VALUES('Anusha','nanjappa', 'Srivari', 'viajayawada','andhra',721468,9548621458,'anushananjappa5148@gmail.com', 'Family');
INSERT INTO AddressBook VALUES('viajyakala','murugan', 'lakshmi illam', 'echanari','tamilandu',674423,9516284375,'vijayakalmurugan485@gmail.com', 'Friend');
INSERT INTO AddressBook VALUES('khishan','Kumar', '', 'hosur','krishnagiri',767239,7531598464,'khishankumar@gmail.com', 'Professional');
SELECT * FROM AddressBook;
/* UC 12 */
create table AddressBookTable
(
AddressBookID int identity(1,1) primary key,
AddressBookName varchar(255)
);

INSERT INTO AddressBookTable values
('Engineers'),('Doctors');

SELECT * FROM AddressBookTable;

create table PersonType
(
PersonID int identity(1,1) primary key,
PersonType varchar(255)
);

INSERT INTO PersonType values
('Family'),('Friend'),('Profession');

SELECT * FROM PersonType;

create table Person
(
PersonID int identity(1,1) primary key,
AddressBookID int,
PersonType varchar(255),
FirstName varchar(255),
LastName varchar(255),
Address varchar(255),
City varchar(255),
State varchar(255),
Zipcode int,
PhoneNumber bigint,
Email varchar(256)
foreign key (AddressBookID) references AddressBookTable(AddressBookID)
);

INSERT INTO Person values
(1,'Friend','divya','rangan','hebbal','banglore','karnataka',124563,1234567892,'divya1542@gmail.com'),
(2,'Family','Ashish','rithu','bija','uttarkand','uttarkand',548692,7894561235,'ashish2@gmail.com'),
(1,'Professional','madhuri','ghr','avarampallaym','coimbatore','TN',954862,15984263,'madhuri345@gmail.com');

SELECT * FROM Person;

create table MapPersonType
(
PersonID int foreign key references Person(PersonID),
PersonTypeID int foreign key references PersonType(PersonID)
);

INSERT INTO MapPersonType values (1,1),(2,2),(3,3),(2,1);

SELECT * FROM MapPersonType;

/* UC 13 */
/* UC 6 */
select p.PersonID,concat(p.FirstName,p.LastName)as Name,concat(p.Address,',',p.City,',',p.State,',',p.ZipCode) as Address,
p.PhoneNumber,p.Email,pt.PersonID,pt.PersonType,ab.AddressBookID ,ab.AddressBookName
from AddressBookTable ab,Person p,PersonType pt,MapPersonType mpt
where (ab.AddressBookID=p.AddressBookID  and p.PersonID=mpt.PersonID and mpt.PersonTypeID=pt.PersonID) and (City='banglore' or State='karnataka') ;

/* UC 7 */
select count(*),State from Person 
inner join AddressBookTable on Person.AddressBookID= AddressBookTable.AddressBookID group by State;

select count(*),City
from Person 
inner join AddressBookTable on Person.AddressBookID= AddressBookTable.AddressBookID group by City;

/* UC 8*/
select p.PersonID,concat(p.FirstName,p.LastName)as Name,
concat(p.Address,',',p.City,',',p.State,',',p.ZipCode) as Address,p.PhoneNumber,p.Email,
pt.PersonID,pt.PersonType,ab.AddressBookID ,ab.AddressBookName
from AddressBookTable ab,Person p,PersonType pt,MapPersonType mpt
where (ab.AddressBookID=p.AddressBookID  and p.PersonID=mpt.PersonID and mpt.PersonID=pt.PersonID) and (State='karnataka') order by FirstName;

/* UC 10 */
SELECT COUNT(*),pt.PersonType FROM
MapPersonType AS mpt 
inner join PersonType as pt On pt.PersonId = mpt.PersonId
inner join Person as p on p.PersonId = mpt.PersonId GROUP BY pt.PersonType;
