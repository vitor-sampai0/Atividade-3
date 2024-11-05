CREATE DATABASE postinho ;

\c postinho

CREATE TABLE pacientes (
id_paciente SERIAL PRIMARY KEY,
nome VARCHAR(50) NOT NULL,
email VARCHAR(100) NOT NULL,
atendido BOOLEAN NOT NULL
);

INSERT INTO pacientes (nome, email, atendido) VALUES 
('João Silva', 'joao.silva@example.com', TRUE),
('Maria Oliveira', 'maria.oliveira@example.com', TRUE),
('Pedro Souza', 'pedro.souza@example.com', FALSE),
('Ana Costa', 'ana.costa@example.com', TRUE),
('Luiz Lima', 'luiz.lima@example.com', TRUE);

CREATE TABLE medicos (
id_medico SERIAL PRIMARY KEY,
nome VARCHAR(50) NOT NULL,
especialidade VARCHAR(50) NOT NULL,
atendeu BOOLEAN NOT NULL
);

INSERT INTO medicos (nome, especialidade, atendeu) VALUES 
('Dr. Carlos Almeida', 'Cardiologista', TRUE),
('Dra. Fernanda Santos', 'Dermatologista', TRUE),
('Dr. Rafael Teixeira', 'Neurologista', TRUE),
('Dra. Juliana Souza', 'Pediatra', TRUE),
('Dr. Paulo Carvalho', 'Ortopedista', FALSE);


CREATE TABLE consultas (
id_consulta SERIAL PRIMARY KEY,
id_paciente INT NOT NULL,
id_medico INT NOT NULL,
tipo_consulta VARCHAR(50),
data_consulta DATE
);

INSERT INTO consultas (id_paciente, id_medico, tipo_consulta, data_consulta) VALUES 
(1, 3, 'Consulta Neurológica', '2024-11-05'),
(2, 1, 'Consulta Cardiológica', '2024-11-05'),
(4, 2, 'Consulta Dermatológica', '2024-11-04'),
(5, 4, 'Consulta de Rotina', '2025-01-15');
INSERT INTO consultas (id_paciente, id_medico) VALUES 
(3, 5);


SELECT p.nome AS paciente, m.nome AS médico, c.data_consulta, c.tipo_consulta AS Motivo, m.especialidade AS especialidade
FROM consultas c
JOIN pacientes p ON c.id_paciente = p.id_paciente
JOIN medicos m ON c.id_medico = m.id_medico
WHERE c.data_consulta < '2024-11-06';


SELECT p.nome AS paciente, c.data_consulta AS data_marcada, c.tipo_consulta AS Motivo
FROM consultas c
JOIN pacientes p ON c.id_paciente = p.id_paciente
JOIN medicos m ON c.id_medico = m.id_medico
WHERE p.atendido IS FALSE;

SELECT m.nome AS médico, c.data_consulta AS data_marcada, c.tipo_consulta AS Motivo
FROM consultas c
JOIN pacientes p ON c.id_paciente = p.id_paciente
JOIN medicos m ON c.id_medico = m.id_medico
WHERE m.atendeu IS FALSE;


