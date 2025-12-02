use mechanical_workshop;

INSERT INTO Clients (Fname, Lname, CPF, Contact, Address) VALUES
('Carlos', 'Silva', '12345678901', '11999999999', 'Rua das Flores, 10'),
('Ana', 'Pereira', '98765432100', '11888888888', 'Av. Brasil, 500'),
('Roberto', 'Costa', '45678912345', '11777777777', 'Rua do Porto, 88');

INSERT INTO Vehicle (idClient, LicensePlate, Model, Brand, Year) VALUES
(1, 'ABC1234', 'Civic', 'Honda', '2020'),
(2, 'XYZ9876', 'Gol', 'Volkswagen', '2015'),
(3, 'DEF5678', 'Cruze', 'Chevrolet', '2019'),
(1, 'GHI9012', 'Fit', 'Honda', '2018');


INSERT INTO Mechanic (Name, Specialty) VALUES
('José Lima', 'Motor'),
('Marcos Souza', 'Elétrica'),
('André Dias', 'Suspensão');

INSERT INTO Team (TeamName) VALUES
('Equipe Alfa'), 
('Equipe Beta');

INSERT INTO Mechanic_Team (idMechanic, idTeam) VALUES
(1, 1), 
(2, 1), 
(3, 2);

INSERT INTO Service (Description, LaborCost) VALUES
('Troca de Óleo', 50.00),
('Alinhamento e Balanceamento', 120.00),
('Retífica de Motor', 1500.00),
('Troca de Pastilha de Freio', 80.00);

INSERT INTO Part (Description, UnitPrice, Stock) VALUES
('Óleo Sintético 5W30', 45.00, 100),
('Filtro de Óleo', 25.00, 50),
('Pastilha de Freio', 150.00, 30),
('Amortecedor', 300.00, 20);

INSERT INTO ServiceOrder (idVehicle, idTeam, IssueDate, CompletionDate, Status_Order, TotalValue) VALUES
(1, 1, '2023-10-01', '2023-10-02', 'Concluído', 270.00), 
(2, 2, '2023-10-05', NULL, 'Em andamento', 0),         
(3, 1, '2023-10-10', '2023-10-12', 'Concluído', 1500.00), 
(4, 2, '2023-10-15', NULL, 'Em análise', 0);    
INSERT INTO SO_Service (idSO, idService, Quantity) VALUES (5, 1, 1);
INSERT INTO SO_Part (idSO, idPart, Quantity) VALUES 
(6, 3, 4), 
(7, 4, 1);


