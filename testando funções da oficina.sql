-- 1. Recuperações simples com SELECT e Filtros com WHERE
-- Pergunta: Quais são as Ordens de Serviço que já foram finalizadas?

use mechanical_workshop;

SELECT idSO, IssueDate, CompletionDate, Status_Order 
FROM ServiceOrder
WHERE Status_Order = 'Em análise';

-- 2. Junções (JOIN) e Atributos Derivados
-- Pergunta: Detalhe o custo de peças para a OS número 1. Quero saber o nome da peça, quantidade, valor unitário e o subtotal

SELECT 
    p.Description AS Part,
    sop.Quantity,
    p.UnitPrice,
    (sop.Quantity * p.UnitPrice) AS Part_Subtotal
FROM SO_Part sop
INNER JOIN Part p ON sop.idPart = p.idPart
WHERE sop.idSO = 1;

-- 3. Junção Complexa com Ordenação (ORDER BY)
-- Pergunta: Liste todos os clientes e seus veículos, ordenados pelo nome do cliente e depois pelo modelo do carro.

SELECT 
    c.Name AS Clients,
    v.Modelo,
    v.Placa,
    v.Marca
FROM Clients c
INNER JOIN Vehicle v ON c.idClient = v.idClient
ORDER BY c.Name ASC, v.Modelo ASC;

-- 4. Agregação e Filtro de Grupos (HAVING)
-- Pergunta: Quais clientes possuem mais de 1 veículo cadastrado na oficina?

SELECT 
    c.Nome,
    COUNT(v.idVeiculo) AS Qtd_Veiculos
FROM Cliente c
INNER JOIN Veiculo v ON c.idCliente = v.idCliente
GROUP BY c.idCliente
HAVING Qtd_Veiculos > 1;

-- 5. Perspectiva Complexa (Múltiplos Joins)
-- Pergunta: Relatório Geral de Serviços: Quem é o cliente, qual o carro, qual equipe atendeu e qual serviço foi realizado nas OSs finalizadas?

SELECT 
    so.idSO,
    c.Name AS Client,
    concat(v.Model, ' - ', v.LicensePlate) AS Vehicle,
    t.TeamName AS Responsible_Team,
    s.Description AS Service_Performed,
    so.Status_Order
FROM ServiceOrder so
INNER JOIN Vehicle v ON so.idVehicle = v.idVehicle
INNER JOIN Client c ON v.idClient = c.idClient
INNER JOIN Team t ON so.idTeam = t.idTeam
INNER JOIN SO_Service sos ON so.idSO = sos.idSO
INNER JOIN Service s ON sos.idService = s.idService
WHERE so.Status_Order = 'Em análise';