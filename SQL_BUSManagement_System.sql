
use BMS ;

CREATE TABLE Passengers (
    passengerId INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
	phonenumber VARCHAR(255) NOT NULL
);

CREATE TABLE Admin (
    adminId INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    phonenumber VARCHAR(255) NOT NULL
);
CREATE TABLE StationManager (
    stationManagerId INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    phonenumber VARCHAR(255) NOT NULL
);
CREATE TABLE Station (
    stationId INT PRIMARY KEY AUTO_INCREMENT, 
    name VARCHAR(255) NOT NULL,
    location VARCHAR(255) NOT NULL
);
CREATE TABLE Bus (
    busId INT PRIMARY KEY AUTO_INCREMENT, 
    busNumber VARCHAR(20) NOT NULL,       
    capacity INT NOT NULL,                
    status VARCHAR(50) NOT NULL          
);
CREATE TABLE StationManagerStations (
    id INT PRIMARY KEY AUTO_INCREMENT, 
    stationName VARCHAR(255) NOT NULL,
    stationManagerName VARCHAR(255) NOT NULL
);

CREATE TABLE StationBusAssignments (
    id INT PRIMARY KEY AUTO_INCREMENT, 
    stationName VARCHAR(255) NOT NULL,  
    busNumber VARCHAR(20) NOT NULL   
       
);
-- Create the Tickets table
CREATE TABLE Tickets (
    ticketId INT PRIMARY KEY AUTO_INCREMENT,
    passengerId INT NOT NULL,
    routeId INT NOT NULL,
    busId INT NOT NULL,
    bookingDate DATE NOT NULL,
    seatNumber INT NOT NULL,
    fare DECIMAL(10, 2) NOT NULL DEFAULT 500.00, 
    FOREIGN KEY (passengerId) REFERENCES Passengers(passengerId) ON DELETE CASCADE,
    FOREIGN KEY (routeId) REFERENCES Routes(routeId) ON DELETE CASCADE,
    FOREIGN KEY (busId) REFERENCES Bus(busId) ON DELETE CASCADE
);
CREATE TABLE Payments (
    paymentId INT AUTO_INCREMENT PRIMARY KEY,
    method VARCHAR(20) NOT NULL,
    accountOrCardNumber VARCHAR(50) NOT NULL,
    transactionCode VARCHAR(20) NOT NULL,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE cancelled_tickets (
    ticket_id INT PRIMARY KEY,
    passengerId INT,
    cancellation_status VARCHAR(20) DEFAULT 'Pending', -- 'Pending' or 'Approved'
    FOREIGN KEY (passengerId) REFERENCES passengers(passengerId)
);

CREATE TABLE Routes (
    routeId INT PRIMARY KEY AUTO_INCREMENT,         
    routeName VARCHAR(100) UNIQUE NOT NULL,         
    startStation VARCHAR(100) NOT NULL,              
    endStation VARCHAR(100) NOT NULL,               
    distance DOUBLE NOT NULL,                        
    startTime TIME NOT NULL,                        
    endTime TIME NOT NULL,                           
    busNumber VARCHAR(20)    
);
CREATE TABLE RouteDates (
    routeDateId INT PRIMARY KEY AUTO_INCREMENT,
    routeId INT NOT NULL,
    operationalDate DATE NOT NULL,
    FOREIGN KEY (routeId) REFERENCES Routes(routeId)
);

CREATE TABLE Feedback (
    feedbackId INT PRIMARY KEY AUTO_INCREMENT,
    passengerId INT NOT NULL,
    rating INT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    feedback TEXT NOT NULL,
    FOREIGN KEY (passengerId) REFERENCES Passengers(passengerId)
);

CREATE TABLE Complaints (
    complaintId INT AUTO_INCREMENT PRIMARY KEY, 
    passengerId INT NOT NULL,                  
    complaintType VARCHAR(50) NOT NULL,        
    complaintDescription TEXT NOT NULL,         
    stationManager VARCHAR(100) NOT NULL,     
    complaintDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (passengerId) REFERENCES Passengers(passengerId)
);


use BMS;

Select * from Passengers;
Select * from Admin;
Select * from StationManager;
Select * from Bus;
Select * from Station;
Select * from StationManagerStations;
Select * from StationBusAssignments;
Select * from Routes;
Select * from RouteDates;
SELECT * FROM cancelled_tickets;
SELECT * FROM Feedback;
Select * from Complaints;
SELECT * FROM Tickets;
SELECT * FROM Payments;


DROP TABLE IF EXISTS Passengers;
DROP TABLE IF EXISTS Admin;
DROP TABLE IF EXISTS StationManager;
DROP TABLE IF EXISTS Bus;
DROP TABLE IF EXISTS Station;
DROP TABLE IF EXISTS StationManagerStations;
DROP TABLE IF EXISTS StationBusAssignments;
DROP TABLE IF EXISTS Routes;
DROP TABLE IF EXISTS RouteDates;
DROP TABLE IF EXISTS cancelled_tickets;
DROP TABLE IF EXISTS Feedback;
DROP TABLE IF EXISTS Complaints;
DROP TABLE IF EXISTS Tickets;
DROP TABLE IF EXISTS Payments;


Delete from Routes where routeId = 3;
Delete from RouteDates where routeId = 2;
Delete from Tickets where passengerId = 1;
Delete from cancelled_tickets where ticket_id = 16;
Delete from Passengers where passengerId = 4;
Delete from Bus where busId = 3;
Delete from StationBusAssignments where id = 8;
Delete from Admin where adminId = 3;



INSERT INTO Passengers (name, email, password, phonenumber)
VALUES 
('P1', 'p1@example.com', 'pass123', '1234567890'),
('P2', 'p2@example.com', 'pass123', '1234567891'),
('P3', 'p3@example.com', 'pass123', '1234567892'),
('P4', 'p4@example.com', 'pass123', '1234567893'),
('P5', 'p5@example.com', 'pass123', '1234567894'),
('P6', 'p6@example.com', 'pass123', '1234567895'),
('P7', 'p7@example.com', 'pass123', '1234567896'),
('P8', 'p8@example.com', 'pass123', '1234567897'),
('P9', 'p9@example.com', 'pass123', '1234567898'),
('P10', 'p10@example.com', 'pass123', '1234567899'),
('P11', 'p11@example.com', 'pass123', '1234567800'),
('P12', 'p12@example.com', 'pass123', '1234567801'),
('P13', 'p13@example.com', 'pass123', '1234567802'),
('P14', 'p14@example.com', 'pass123', '1234567803'),
('P15', 'p15@example.com', 'pass123', '1234567804'),
('P16', 'p16@example.com', 'pass123', '1234567805'),
('P17', 'p17@example.com', 'pass123', '1234567806'),
('P18', 'p18@example.com', 'pass123', '1234567807'),
('P19', 'p19@example.com', 'pass123', '1234567808'),
('P20', 'p20@example.com', 'pass123', '1234567809');

-- Insert Station Managers
INSERT INTO StationManager (name, email, password, phonenumber)
VALUES 
('S1', 's1@example.com', 'pass123', '2234567890'),
('S2', 's2@example.com', 'pass123', '2234567890'),
('S3', 's3@example.com', 'pass123', '2234567890'),
('S4', 's4@example.com', 'pass123', '2234567890'),
('S5', 's5@example.com', 'pass123', '2234567890'),
('S6', 's6@example.com', 'pass123', '2234567890'),
('S7', 's7@example.com', 'pass123', '2234567890'),
('S8', 's8@example.com', 'pass123', '2234567890'),
('S9', 's9@example.com', 'pass123', '2234567890'),
('S10', 's10@example.com', 'pass123', '2234567890');

-- Insert Admin
INSERT INTO Admin (name, email, password, phonenumber)
VALUES 
('A1', 'a1@example.com', 'pass123', '2234567890');



-- Insert Stations
INSERT INTO Station (name, location)
VALUES 
('Station1', 'Location1'),
('Station2', 'Location2'),
('Station3', 'Location3'),
('Station4', 'Location4'),
('Station5', 'Location5'),
('Station6', 'Location6'),
('Station7', 'Location7'),
('Station8', 'Location8'),
('Station9', 'Location9'),
('Station10', 'Location10'),
('Station11', 'Location11'),
('Station12', 'Location12'),
('Station13', 'Location13'),
('Station14', 'Location14'),
('Station15', 'Location15'),
('Station16', 'Location16'),
('Station17', 'Location17'),
('Station18', 'Location18'),
('Station19', 'Location19'),
('Station20', 'Location20');

-- Insert Buses
INSERT INTO Bus (busNumber, capacity, status)
VALUES 
(10, 50, 'Available'),
(20, 50, 'Available'),
(30, 50, 'Available'),
(40, 50, 'Available'),
(50, 50, 'Available'),
(60, 50, 'Available'),
(70, 50, 'Available'),
(80, 50, 'Available'),
(90, 50, 'Available'),
(100, 50, 'Available'),
(110, 50, 'Available'),
(120, 50, 'Available'),
(130, 50, 'Available'),
(140, 50, 'Available'),
(150, 50, 'Available'),
(160, 50, 'Available'),
(170, 50, 'Available'),
(180, 50, 'Available'),
(190, 50, 'Available'),
(200, 50, 'Available');

-- StationManagerStations
INSERT INTO StationManagerStations(stationName,stationManagerName) 
Values
('Station1','S1'),
('Station2','S2'),
('Station3','S3'),
('Station4','S4'),
('Station5','S5'),
('Station6','S6'),
('Station7','S7'),
('Station8','S8'),
('Station9','S9'),
('Station10','S10');

-- Station Bus Assignments
INSERT INTO StationBusAssignments (stationName,busNumber)
Values
('Station1',10),
('Station2',10),
('Station3',10),

('Station1',20),
('Station2',20),
('Station3',20),

('Station2',30),
('Station3',30),
('Station4',30),


('Station2',40),
('Station3',40),
('Station4',40),

('Station3',50),
('Station4',50),
('Station5',50),

('Station3',60),
('Station4',60),
('Station5',60),


('Station6',70),
('Station7',70),

('Station8',80),
('Station9',80),

('Station9',90),
('Station10',90),

('Station9',100),
('Station10',100);


-- Route 1: From Station1 to Station2, Bus 10
INSERT INTO Routes (routeName, startStation, endStation, distance, startTime, endTime, busNumber)
VALUES ('Route1', 'Station1', 'Station2', 50.0, '08:00:00', '10:00:00', '10');

-- Route 2: From Station2 to Station3, Bus 20
INSERT INTO Routes (routeName, startStation, endStation, distance, startTime, endTime, busNumber)
VALUES ('Route2', 'Station2', 'Station3', 60.0, '09:00:00', '11:00:00', '20');

-- Route 3: From Station1 to Station3, Bus 30
INSERT INTO Routes (routeName, startStation, endStation, distance, startTime, endTime, busNumber)
VALUES ('Route3', 'Station1', 'Station3', 70.0, '10:00:00', '12:00:00', '30');

-- Route 4: From Station2 to Station4, Bus 40
INSERT INTO Routes (routeName, startStation, endStation, distance, startTime, endTime, busNumber)
VALUES ('Route4', 'Station2', 'Station4', 80.0, '11:00:00', '13:00:00', '40');

-- Route 5: From Station3 to Station5, Bus 50
INSERT INTO Routes (routeName, startStation, endStation, distance, startTime, endTime, busNumber)
VALUES ('Route5', 'Station3', 'Station5', 90.0, '12:00:00', '14:00:00', '50');

-- Route 6: From Station4 to Station6, Bus 60
INSERT INTO Routes (routeName, startStation, endStation, distance, startTime, endTime, busNumber)
VALUES ('Route6', 'Station4', 'Station6', 100.0, '13:00:00', '15:00:00', '60');


-- Route Dates for Route1
INSERT INTO RouteDates (routeId, operationalDate)
VALUES (1, '2024-11-26'),
       (1, '2024-11-27'),
       (1, '2024-11-28');

-- Route Dates for Route2
INSERT INTO RouteDates (routeId, operationalDate)
VALUES (2, '2024-11-26'),
       (2, '2024-11-27'),
       (2, '2024-11-28');

-- Route Dates for Route3
INSERT INTO RouteDates (routeId, operationalDate)
VALUES (3, '2024-11-26'),
       (3, '2024-11-27'),
       (3, '2024-11-28');

-- Route Dates for Route4
INSERT INTO RouteDates (routeId, operationalDate)
VALUES (4, '2024-11-26'),
       (4, '2024-11-27'),
       (4, '2024-11-28');

-- Route Dates for Route5
INSERT INTO RouteDates (routeId, operationalDate)
VALUES (5, '2024-11-26'),
       (5, '2024-11-27'),
       (5, '2024-11-28');

-- Route Dates for Route6
INSERT INTO RouteDates (routeId, operationalDate)
VALUES (6, '2024-11-26'),
       (6, '2024-11-27'),
       (6, '2024-11-28');


-- JAB ROUTE KO DEFINE KRO GY TOU YE BAAD MEI KRNA HAI KIYUN KEH UN BUSES KO RENTED KRNA HAI
-- taky deletion mei show na hoon 

UPDATE Bus
SET status = 'Rented'
WHERE busId = 22;


UPDATE Bus
SET status = 'Rented'
WHERE busId = 23;


UPDATE Bus
SET status = 'Rented'
WHERE busId = 24;

UPDATE Bus
SET status = 'Rented'
WHERE busId = 25;

UPDATE Bus
SET status = 'Rented'
WHERE busId = 26;       
       
 Select * from Bus;
 
-- Feedback 
INSERT INTO Feedback (passengerId, rating, feedback)
VALUES
(1, 5, 'Excellent service, very satisfied!'),
(2, 4, 'Good experience, but can improve on timing.'),
(3, 3, 'Average experience, the bus was delayed.'),
(4, 2, 'Not satisfied with the cleanliness.'),
(5, 1, 'Very poor service, bus broke down.');

-- Complaints
INSERT INTO Complaints (passengerId, complaintType, complaintDescription, stationManager)
VALUES
(1, 'Bus Delay', 'The bus was delayed by over 30 minutes.', 'S1'),
(1, 'Timmings Issues', 'The bus has not arrived on time.', 'S1'),
(2, 'Cleanliness', 'The bus was dirty and unhygienic.', 'S2'),
(3, 'Staff Behavior', 'The bus conductor was rude.', 'S3'),
(4, 'Broken Seat', 'The seat assigned to me was broken.', 'S4'),
(4, 'Bus-related', 'The environment of bus was not good', 'S4'),
(5, 'Overcharging', 'I was charged extra without justification.', 'S5');