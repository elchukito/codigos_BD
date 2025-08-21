-- DROP DAS TABELAS SE EXISTIREM
DROP TABLE IF EXISTS vet_ex_atendimento;
DROP TABLE IF EXISTS vet_ex_pet;
DROP TABLE IF EXISTS vet_ex_raca;

-- TABELA RACA
CREATE TABLE vet_ex_raca (
    id_raca_pk INT AUTO_INCREMENT PRIMARY KEY,
    nome_raca_vet_ex VARCHAR(100) NOT NULL
);

-- TABELA PET
CREATE TABLE vet_ex_pet (
    id_pet_pk INT AUTO_INCREMENT PRIMARY KEY,
    nome_pet_vet_ex VARCHAR(100) NOT NULL,
    nascimento_pet_vet_ex DATE,
    sexo_pet_vet_ex ENUM('M', 'F') NOT NULL,
    id_raca_fk INT NOT NULL,
    CONSTRAINT pet_raca_fk FOREIGN KEY (id_raca_fk) REFERENCES vet_ex_raca(id_raca_pk)
);

-- TABELA ATENDIMENTO
CREATE TABLE vet_ex_atendimento (
    id_atendimento_pk INT AUTO_INCREMENT PRIMARY KEY,
    id_pet_fk INT NOT NULL,
    data_atendimento_vet_ex DATETIME NOT NULL,
    descricao_vet_ex TEXT NOT NULL,
    valor_vet_ex DECIMAL(10,2) NOT NULL,
    retorno_vet_ex BOOLEAN DEFAULT FALSE,
    CONSTRAINT atendimento_pet_fk FOREIGN KEY (id_pet_fk) REFERENCES vet_ex_pet(id_pet_pk)
);

-- INSERÇÃO DE RAÇAS
INSERT INTO vet_ex_raca (nome_raca_vet_ex) VALUES
('Labrador'),
('Poodle'),
('Bulldog'),
('Beagle'),
('Shih Tzu'),
('Golden Retriever'),
('Yorkshire'),
('Dachshund'),
('Pastor Alemão'),
('Boxer');

-- INSERÇÃO DE PETS (30)
INSERT INTO vet_ex_pet (nome_pet_vet_ex, nascimento_pet_vet_ex, sexo_pet_vet_ex, id_raca_fk) VALUES
('Rex','2019-05-12','M',1),
('Bella','2020-08-21','F',2),
('Max','2021-01-10','M',3),
('Luna','2022-03-05','F',4),
('Toby','2018-11-30','M',5),
('Molly','2017-07-14','F',6),
('Charlie','2020-12-25','M',7),
('Daisy','2019-09-02','F',8),
('Rocky','2021-06-18','M',9),
('Lucy','2022-02-11','F',10),
('Bobby','2018-08-08','M',1),
('Lily','2020-04-04','F',2),
('Oscar','2019-10-23','M',3),
('Sophie','2021-12-01','F',4),
('Duke','2020-03-03','M',5),
('Chloe','2019-05-05','F',6),
('Zeus','2022-01-15','M',7),
('Nina','2021-07-07','F',8),
('Sam','2018-06-06','M',9),
('Mia','2020-09-09','F',10),
('Jack','2019-11-11','M',1),
('Lola','2021-03-03','F',2),
('Hunter','2020-02-02','M',3),
('Rosie','2018-12-12','F',4),
('Thor','2017-01-01','M',5),
('Sadie','2019-04-04','F',6),
('Cooper','2022-05-05','M',7),
('Ruby','2021-06-06','F',8),
('Bear','2020-07-07','M',9),
('Gracie','2019-08-08','F',10);

-- INSERÇÃO DE ATENDIMENTOS (cada pet com 1 a 5 atendimentos)
INSERT INTO vet_ex_atendimento (id_pet_fk, data_atendimento_vet_ex, descricao_vet_ex, valor_vet_ex, retorno_vet_ex) VALUES
-- Rex (1)
(1,'2024-01-15 10:00:00','Vacina antirrábica',120.00,FALSE),
(1,'2024-06-10 09:30:00','Consulta geral',80.00,FALSE),
-- Bella (2)
(2,'2024-02-20 11:00:00','Vacina múltipla',150.00,FALSE),
(2,'2024-05-18 14:00:00','Tosa',50.00,FALSE),
(2,'2024-09-05 10:30:00','Consulta geral',80.00,FALSE),
-- Max (3)
(3,'2024-03-15 09:00:00','Vacina antirrábica',120.00,FALSE),
-- Luna (4)
(4,'2024-01-10 08:30:00','Consulta geral',80.00,FALSE),
(4,'2024-04-15 10:00:00','Vermifugação',60.00,FALSE),
(4,'2024-07-22 11:00:00','Vacina múltipla',150.00,FALSE),
(4,'2024-10-05 09:30:00','Consulta geral',80.00,FALSE),
-- Toby (5)
(5,'2024-02-05 09:00:00','Vacina antirrábica',120.00,FALSE),
(5,'2024-06-12 10:30:00','Consulta geral',80.00,FALSE),
-- Molly (6)
(6,'2024-03-03 10:00:00','Vermifugação',60.00,FALSE),
(6,'2024-05-18 09:30:00','Tosa',50.00,FALSE),
(6,'2024-08-25 11:00:00','Consulta geral',80.00,FALSE),
-- Charlie (7)
(7,'2024-04-10 09:30:00','Vacina múltipla',150.00,FALSE),
-- Daisy (8)
(8,'2024-02-14 10:00:00','Consulta geral',80.00,FALSE),
(8,'2024-06-20 11:00:00','Vermifugação',60.00,FALSE),
-- Rocky (9)
(9,'2024-01-25 09:00:00','Vacina antirrábica',120.00,FALSE),
(9,'2024-05-05 10:30:00','Consulta geral',80.00,FALSE),
(9,'2024-09-12 09:30:00','Tosa',50.00,FALSE),
-- Lucy (10)
(10,'2024-03-20 08:30:00','Consulta geral',80.00,FALSE),

-- Pets 11 a 30 (cada um com 1 a 5 atendimentos aleatórios)
(11,'2024-02-01 09:00:00','Consulta geral',80.00,FALSE),
(11,'2024-06-10 11:00:00','Vacina múltipla',150.00,FALSE),
(12,'2024-02-15 10:00:00','Vacina múltipla',150.00,FALSE),
(13,'2024-03-10 09:30:00','Tosa',50.00,FALSE),
(13,'2024-08-20 10:00:00','Consulta geral',80.00,FALSE),
(14,'2024-03-25 08:30:00','Vermifugação',60.00,FALSE),
(14,'2024-07-12 09:30:00','Consulta geral',80.00,FALSE),
(14,'2024-10-01 10:00:00','Tosa',50.00,FALSE),
(15,'2024-04-05 11:00:00','Consulta geral',80.00,FALSE),
(16,'2024-04-20 09:30:00','Vacina antirrábica',120.00,FALSE),
(16,'2024-09-10 10:00:00','Consulta geral',80.00,FALSE),
(17,'2024-05-10 10:00:00','Consulta geral',80.00,FALSE),
(17,'2024-08-15 11:00:00','Vermifugação',60.00,FALSE),
(18,'2024-05-25 11:30:00','Tosa',50.00,FALSE),
(18,'2024-09-20 10:00:00','Vacina múltipla',150.00,FALSE),
(18,'2024-12-01 09:30:00','Consulta geral',80.00,FALSE),
(19,'2024-06-05 09:00:00','Vacina múltipla',150.00,FALSE),
(20,'2024-06-20 10:00:00','Consulta geral',80.00,FALSE),
(20,'2024-10-10 09:00:00','Vermifugação',60.00,FALSE),
(21,'2024-07-05 10:30:00','Tosa',50.00,FALSE),
(21,'2024-09-15 11:00:00','Consulta geral',80.00,FALSE),
(22,'2024-07-20 09:00:00','Vacina antirrábica',120.00,FALSE),
(23,'2024-08-01 10:00:00','Consulta geral',80.00,FALSE),
(23,'2024-12-12 09:30:00','Tosa',50.00,FALSE),
(24,'2024-08-15 11:00:00','Vacina múltipla',150.00,FALSE),
(25,'2024-09-05 09:30:00','Consulta geral',80.00,FALSE),
(25,'2024-11-10 10:00:00','Vermifugação',60.00,FALSE),
(26,'2024-09-20 09:00:00','Tosa',50.00,FALSE),
(27,'2024-10-05 10:30:00','Consulta geral',80.00,FALSE),
(27,'2024-12-15 09:30:00','Vacina antirrábica',120.00,FALSE),
(28,'2024-10-20 11:00:00','Vermifugação',60.00,FALSE),
(29,'2024-11-05 09:00:00','Consulta geral',80.00,FALSE),
(29,'2024-12-20 10:00:00','Tosa',50.00,FALSE),
(30,'2024-11-15 09:30:00','Vacina múltipla',150.00,FALSE);
