-- ============================================================
-- BOMBA! Sabrina Carpenter não sabe SQL
-- PostgreSQL — Criação das tabelas e inserção de dados
-- ============================================================

DROP TABLE IF EXISTS candidaturas;
DROP TABLE IF EXISTS vagas;
DROP TABLE IF EXISTS empresas;

CREATE TABLE empresas (
    id      INT PRIMARY KEY,
    nome    VARCHAR(100) NOT NULL,
    cidade  VARCHAR(100) NOT NULL,
    setor   VARCHAR(50)  NOT NULL
);

CREATE TABLE vagas (
    id              INT PRIMARY KEY,
    empresa_id      INT NOT NULL REFERENCES empresas(id),
    titulo          VARCHAR(100) NOT NULL,
    salario         NUMERIC(10,2) NOT NULL,
    remoto          BOOLEAN NOT NULL,
    data_publicacao DATE NOT NULL
);

CREATE TABLE candidaturas (
    id         INT PRIMARY KEY,
    vaga_id    INT NOT NULL REFERENCES vagas(id),
    candidato  VARCHAR(100) NOT NULL,
    data_envio DATE NOT NULL,
    status     VARCHAR(20) NOT NULL
);

INSERT INTO empresas (id, nome, cidade, setor) VALUES
(1, 'DataMystic',       'São Paulo',       'Tecnologia'),
(2, 'Tarot Analytics',  'Rio de Janeiro',  'Misticismo'),
(3, 'CloudNova',        'Belo Horizonte',  'Tecnologia'),
(4, 'NexaData',         'Curitiba',        'Tecnologia'),
(5, 'ByteForge',        'São Paulo',       'Tecnologia'),
(6, 'PipelineHQ',       'Florianópolis',   'Consultoria');

INSERT INTO vagas (id, empresa_id, titulo, salario, remoto, data_publicacao) VALUES
(1,  1, 'Analista de Dados Júnior',      3200.00, TRUE,  '2025-01-10'),
(2,  2, 'Leitor de Tarot Júnior',        1800.00, FALSE, '2025-01-15'),
(3,  1, 'Engenheiro de Dados',           8500.00, TRUE,  '2025-02-01'),
(4,  3, 'DBA Júnior',                    3800.00, FALSE, '2025-02-10'),
(5,  4, 'Analista de QA Júnior',         2500.00, TRUE,  '2025-02-20'),
(6,  5, 'Desenvolvedor Backend',         7200.00, TRUE,  '2025-03-01'),
(7,  2, 'Cartomante Full Stack',         4200.00, FALSE, '2025-03-05'),
(8,  6, 'Analista de BI',                5500.00, TRUE,  '2025-03-10'),
(9,  3, 'Estagiário de Dados',           1500.00, FALSE, '2025-03-15'),
(10, 5, 'Cientista de Dados Sênior',    12000.00, TRUE,  '2025-03-20');

INSERT INTO candidaturas (id, vaga_id, candidato, data_envio, status) VALUES
(1,  1, 'Taylor Swift',      '2025-01-12', 'aprovado'),
(2,  1, 'Sabrina Carpenter', '2025-01-13', 'reprovado'),
(3,  2, 'Eminem',            '2025-01-20', 'em análise'),
(4,  3, 'Beyoncé',           '2025-02-05', 'aprovado'),
(5,  4, 'Dua Lipa',          '2025-02-15', 'reprovado'),
(6,  5, 'Ariana Grande',     '2025-02-22', 'em análise'),
(7,  6, 'Lady Gaga',         '2025-03-02', 'aprovado'),
(8,  7, 'Eminem',            '2025-03-06', 'reprovado'),
(9,  8, 'Rihanna',           '2025-03-12', 'aprovado'),
(10, 9, 'Charli XCX',        '2025-03-16', 'em análise'),
(11, 1, 'Anitta',            '2025-01-14', 'aprovado'),
(12, 3, 'Adele',             '2025-02-06', 'reprovado'),
(13, 6, 'Shakira',           '2025-03-03', 'em análise'),
(14, 10,'Eminem',            '2025-03-21', 'em análise'),
(15, 2, 'Doja Cat',          '2025-01-22', 'aprovado');
