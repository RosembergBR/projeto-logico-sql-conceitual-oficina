-- CRIAÇÃO DO BANCO DE DADOS CONCEITUAL PARA O CENÁRIO DE OFICINA

CREATE DATABASE oficina_mecanica;
USE oficina_mecanica;

-- Criação da tabela CLIENTES
CREATE TABLE clients (
	idClient INT AUTO_INCREMENT PRIMARY KEY,
    Fname VARCHAR(10),
    Minit CHAR(3),
    Lname VARCHAR(20),
    bDate DATE,
    CPF CHAR(11) NOT NULL,
    Address VARCHAR(30),
    city VARCHAR(50),
    UF CHAR(2),
    CEP VARCHAR(9),
    fone VARCHAR(11),
    email VARCHAR(50),
    CONSTRAINT unique_cpf_client UNIQUE (CPF)
);

-- Criação da tabela OS
CREATE TABLE os (
	idOs INT AUTO_INCREMENT PRIMARY KEY,
    idOsClient INT,
    statusOs VARCHAR(45),
    dataInicio DATE,
    dataFim DATE,
    valorOs FLOAT(10,2),
    CONSTRAINT fk_os_client FOREIGN KEY (idOsClient) REFERENCES clients(idClient)
);

-- Criação da tabela PAGAMENTO
CREATE TABLE payment(
	idClient INT,
    idPayment INT,
    cash FLOAT,
    typePayment ENUM ('Boleto','Cartão','Dois cartões'),
    PRIMARY KEY(idClient, idPayment)
    );

-- Criação da tabela VEICULO
CREATE TABLE vehicle(
	idVehicle INT AUTO_INCREMENT PRIMARY KEY,
    idClientVehicle INT,
    placa VARCHAR(8),
    ano DATE,
    renavam VARCHAR(30),
    marca VARCHAR(20),
    modelo VARCHAR(20),
    CONSTRAINT fk_vehicle_client FOREIGN KEY (idClientVehicle) REFERENCES clients(idClient)
);

-- Criação da tabela SERVIÇO
CREATE TABLE service(
	idService INT AUTO_INCREMENT PRIMARY KEY,
    idVehicle INT,
    typeService VARCHAR(45),
    CONSTRAINT fk_service_vehicle FOREIGN KEY (idVehicle) REFERENCES vehicle(idVehicle)
);

-- Criação da tabela REVISAO
CREATE TABLE revisao(
	idRevisao INT AUTO_INCREMENT PRIMARY KEY,
    idRevService INT,
    dateEntry DATE,
    hourStart TIME,
    valor FLOAT(10,2),
    CONSTRAINT fk_revisao_service FOREIGN KEY (idRevService) REFERENCES service(idService)
);

-- Criação da tabela CONSERTO
CREATE TABLE conserto(
	idConserto INT AUTO_INCREMENT PRIMARY KEY,
    idConService INT,
    dateEntry DATE,
    hourStart TIME,
    valor FLOAT(10,2),
    CONSTRAINT fk_conserto_service FOREIGN KEY (idConService) REFERENCES service(idService)
    );

-- Criação da tabela MECANICO
CREATE TABLE mechanical(
	idMechanical INT AUTO_INCREMENT PRIMARY KEY,
    idService INT,
    Fname VARCHAR(10),
    Minit CHAR(3),
    Lname VARCHAR(20),
    CPF CHAR(11) NOT NULL,
    Address VARCHAR(30),
    fone VARCHAR(9),
    CONSTRAINT unique_mechanical UNIQUE (CPF)
);

-- Criação da tabela PEÇAS
CREATE TABLE part(
	idPart INT AUTO_INCREMENT PRIMARY KEY,
    partName VARCHAR(255) NOT NULL,
    peçaTrocada CHAR(1),
    valorPeca FLOAT(10,2)
);
