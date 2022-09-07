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
