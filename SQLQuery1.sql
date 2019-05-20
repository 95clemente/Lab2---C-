CREATE TABLE School 
(SchoolID INTEGER NOT NULL PRIMARY KEY, 
SchoolName VarCHAR(50) NOT NULL, 
SchoolNickname VarCHAR(30)NOT NULL, 
SchoolAddress VarCHAR(60) NOT NULL, 
LastUpdated DATE NOT NULL, 
LastUpdatedBy VARCHAR(50) NOT NULL)

 CREATE TABLE Activity
(ActivityID INTEGER PRIMARY KEY, 
ActivityDescription VarCHAR(100)NOT NULL, 
LastUpdated DATE NOT NULL, 
LastUpdatedBy VARCHAR(50) NOT NULL)

CREATE TABLE Student 
(StudentID INTEGER NOT NULL PRIMARY KEY, 
FirstName VarCHAR(25)NOT NULL, 
MiddleName VarCHAR(30),
LastName VarCHAR(30) NOT NULL, 
HouseNumber CHAR(10), 
Street VarCHAR(20) NOT NULL, 
CityCounty VarCHAR(30), 
HomeState CHAR(25), 
Country CHAR(35)NOT NULL, 
Zip CHAR (9)NOT NULL,
DateOfBirth DATE NOT NULL,
AcademicYear VARCHAR (15)NOT NULL, 
LastUpdated Date NOT NULL, 
LastUpdatedBy VARCHAR(50) NOT NULL, 
SchoolID integer references School(SchoolID))

CREATE TABLE SchoolActivity
(StudentID INTEGER NOT NULL,
ActivityID INTEGER NOT NULL,
LastUpdated DATE NOT NULL, 
LastUpdatedBy VARCHAR(50) NOT NULL,
CONSTRAINT pkSchoolActivity PRIMARY KEY (StudentID,ActivityID),
CONSTRAINT fkSchoolActivity FOREIGN KEY (ActivityID) references Activity,
CONSTRAINT fkSchoolStudent FOREIGN KEY (StudentID) references Student);

select * from Student