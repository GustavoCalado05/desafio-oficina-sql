# 🔧 Sistema de Gerenciamento de Oficina Mecânica

Este projeto faz parte do desafio **"Construindo um Esquema Conceitual para Banco de Dados"** da DIO. O objetivo foi transformar um modelo conceitual de uma oficina mecânica em um esquema lógico relacional, implementá-lo em SQL e realizar consultas complexas para análise de dados.

## 🛠️ Tecnologias Utilizadas
* **Banco de Dados:** MySQL
* **Ferramenta de Modelagem/Script:** MySQL Workbench
* **Linguagem:** SQL

## 📋 Descrição do Desafio
O projeto consiste na criação de um banco de dados para gerenciar as operações de uma oficina mecânica, cobrindo:
1.  **Criação do Esquema (DDL):** Tabelas, chaves primárias e estrangeiras, e constraints.
2.  **Persistência de Dados (DML):** Inserção de dados simulados para Clientes, Veículos, Mecânicos, Peças e Serviços.
3.  **Recuperação de Informações (DQL):** Queries SQL complexas para responder a perguntas de negócio.

### Contexto do Negócio
O sistema controla o fluxo de **Ordens de Serviço (OS)**, onde cada OS pode conter múltiplos serviços (mão de obra) e peças. Uma OS é emitida para um veículo, que pertence a um cliente, e é executada por uma equipe de mecânicos.

## 🗂️ Estrutura do Banco de Dados
As principais tabelas desenvolvidas foram:

* **`Client`**: Cadastro de clientes com CPF/SSN e endereço.
* **`Vehicle`**: Dados dos veículos (Placa, Modelo, Marca) vinculados ao cliente.
* **`Mechanic`**: Cadastro dos mecânicos e suas especialidades.
* **`Team`**: Equipes de trabalho formadas por mecânicos.
* **`ServiceOrder` (OS)**: Tabela central que gerencia o status, datas e valores totais dos trabalhos.
* **`Service` e `Part`**: Catálogo de serviços (mão de obra) e peças disponíveis no estoque.
* **`SO_Service` e `SO_Part`**: Tabelas de relacionamento N:M que detalham os itens de cada Ordem de Serviço.

## 🚀 Queries e Análises Desenvolvidas
O script `oficina_queries.sql` contém consultas que atendem aos seguintes requisitos:

* **Recuperações Simples:** Listagem de Ordens de Serviço finalizadas.
* **Filtros e Ordenação:** Relatório de clientes e veículos ordenados por nome e modelo.
* **Atributos Derivados:** Cálculo do subtotal de peças em uma OS específica.
* **Agregação (HAVING):** Identificação de clientes com mais de um veículo cadastrado.
* **Junções Complexas (JOINs):** Relatório geral integrando Cliente, Veículo, Equipe e Serviços realizados.

### Exemplos de Perguntas Respondidas:
1.  Quais serviços já foram concluídos?
2.  Qual o custo total de peças para uma OS específica?
3.  Quais clientes possuem frota (mais de 1 carro) na oficina?
4.  Qual equipe foi responsável por qual serviço?

## 📂 Como Executar
1.  Certifique-se de ter o **MySQL** instalado.
2.  Clone este repositório ou baixe o arquivo `.sql`.
3.  Abra o arquivo no **MySQL Workbench**.
4.  Execute todo o script para criar o banco de dados (`mechanic_workshop`), criar as tabelas e inserir os dados de teste.

---
*Projeto desenvolvido para fins educacionais no Bootcamp da DIO.*
