Create database mechanical_workshop;

use  mechanical_workshop;

Create table Clients (
    idClient INT AUTO_INCREMENT PRIMARY KEY,
    FName VARCHAR(45) NOT NULL,
    Lname VARCHAR(45), 
    CPF CHAR(11) NOT NULL UNIQUE,
    Contact VARCHAR(15),
    Address VARCHAR(255)
);

CREATE TABLE Mechanic (
    idMechanic INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(45) NOT NULL,
    Address VARCHAR(255),
    Specialty VARCHAR(45) NOT NULL
 );   
CREATE TABLE Team (
    idTeam INT AUTO_INCREMENT PRIMARY KEY,
    TeamName VARCHAR(45) NOT NULL
);

CREATE TABLE Mechanic_Team (
    idMechanic INT,
    idTeam INT,
    PRIMARY KEY (idMechanic, idTeam),
    CONSTRAINT fk_mechanic FOREIGN KEY (idMechanic) REFERENCES Mechanic(idMechanic),
    CONSTRAINT fk_team_mechanic FOREIGN KEY (idTeam) REFERENCES Team(idTeam)
);


CREATE TABLE Vehicle (
    idVehicle INT AUTO_INCREMENT PRIMARY KEY,
    idClient INT,
    LicensePlate CHAR(7) NOT NULL UNIQUE,
    Model VARCHAR(45),
    Brand VARCHAR(45),
    Year CHAR(4),
    CONSTRAINT fk_vehicle_clients FOREIGN KEY (idClient) REFERENCES Clients(idClient)
);



CREATE TABLE Service (
    idService INT AUTO_INCREMENT PRIMARY KEY,
    Description VARCHAR(45) NOT NULL,
    LaborCost FLOAT NOT NULL
);

CREATE TABLE Part (
    idPart INT AUTO_INCREMENT PRIMARY KEY,
    Description VARCHAR(45) NOT NULL,
    UnitPrice FLOAT NOT NULL,
    Stock INT DEFAULT 0
);

CREATE TABLE ServiceOrder (
    idSO INT auto_increment PRIMARY KEY,
    idVehicle INT,
    idTeam INT, 
    IssueDate DATE,
    CompletionDate DATE,
    TotalValue FLOAT DEFAULT 0,
    Status_Order ENUM('Em análise', 'Aprovado', 'Em andamento', 'Concluído', 'Cancelado') DEFAULT 'Em análise',
    CONSTRAINT fk_so_vehicle FOREIGN KEY (idVehicle) REFERENCES Vehicle(idVehicle),
    CONSTRAINT fk_so_team FOREIGN KEY (idTeam) REFERENCES Team(idTeam)
);




CREATE TABLE SO_Service (
    idSO INT,
    idService INT,
    Quantity INT DEFAULT 1,
    PRIMARY KEY (idSO, idService),
    CONSTRAINT fk_so_service_so FOREIGN KEY (idSO) REFERENCES ServiceOrder(idSO),
    CONSTRAINT fk_so_service_service FOREIGN KEY (idService) REFERENCES Service(idService)
);


CREATE TABLE SO_Part (
    idSO INT,
    idPart INT,
    Quantity INT DEFAULT 1,
    PRIMARY KEY (idSO, idPart),
    CONSTRAINT fk_so_part_so FOREIGN KEY (idSO) REFERENCES ServiceOrder(idSO),
    CONSTRAINT fk_so_part_part FOREIGN KEY (idPart) REFERENCES Part(idPart)
);
