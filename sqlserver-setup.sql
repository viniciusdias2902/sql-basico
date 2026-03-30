-- ============================================================
-- BOMBA! Sabrina Carpenter não sabe SQL
-- SQL Server — Criação das tabelas e inserção de dados
-- ============================================================

IF OBJECT_ID('candidaturas', 'U') IS NOT NULL DROP TABLE candidaturas;
IF OBJECT_ID('vagas', 'U') IS NOT NULL DROP TABLE vagas;
IF OBJECT_ID('empresas', 'U') IS NOT NULL DROP TABLE empresas;
GO

CREATE TABLE empresas (
    id      INT PRIMARY KEY,
    nome    NVARCHAR(100) NOT NULL,
    cidade  NVARCHAR(100) NOT NULL,
    setor   NVARCHAR(50)  NOT NULL
);
GO

CREATE TABLE vagas (
    id              INT PRIMARY KEY,
    empresa_id      INT NOT NULL,
    titulo          NVARCHAR(100) NOT NULL,
    salario         DECIMAL(10,2) NOT NULL,
    remoto          BIT NOT NULL,
    data_publicacao DATE NOT NULL,
    CONSTRAINT FK_vagas_empresas FOREIGN KEY (empresa_id) REFERENCES empresas(id)
);
GO

CREATE TABLE candidaturas (
    id         INT PRIMARY KEY,
    vaga_id    INT NOT NULL,
    candidato  NVARCHAR(100) NOT NULL,
    data_envio DATE NOT NULL,
    status     NVARCHAR(20) NOT NULL,
    CONSTRAINT FK_candidaturas_vagas FOREIGN KEY (vaga_id) REFERENCES vagas(id)
);
GO

INSERT INTO empresas (id, nome, cidade, setor) VALUES
(1, N'DataMystic',       N'São Paulo',       N'Tecnologia'),
(2, N'Tarot Analytics',  N'Rio de Janeiro',   N'Misticismo'),
(3, N'CloudNova',        N'Belo Horizonte',   N'Tecnologia'),
(4, N'NexaData',         N'Curitiba',         N'Tecnologia'),
(5, N'ByteForge',        N'São Paulo',        N'Tecnologia'),
(6, N'PipelineHQ',       N'Florianópolis',    N'Consultoria');
GO

INSERT INTO vagas (id, empresa_id, titulo, salario, remoto, data_publicacao) VALUES
(1,  1, N'Analista de Dados Júnior',      3200.00, 1, '2025-01-10'),
(2,  2, N'Leitor de Tarot Júnior',        1800.00, 0, '2025-01-15'),
(3,  1, N'Engenheiro de Dados',           8500.00, 1, '2025-02-01'),
(4,  3, N'DBA Júnior',                    3800.00, 0, '2025-02-10'),
(5,  4, N'Analista de QA Júnior',         2500.00, 1, '2025-02-20'),
(6,  5, N'Desenvolvedor Backend',         7200.00, 1, '2025-03-01'),
(7,  2, N'Cartomante Full Stack',         4200.00, 0, '2025-03-05'),
(8,  6, N'Analista de BI',                5500.00, 1, '2025-03-10'),
(9,  3, N'Estagiário de Dados',           1500.00, 0, '2025-03-15'),
(10, 5, N'Cientista de Dados Sênior',    12000.00, 1, '2025-03-20');
GO

INSERT INTO candidaturas (id, vaga_id, candidato, data_envio, status) VALUES
(1,  1, N'Taylor Swift',      '2025-01-12', N'aprovado'),
(2,  1, N'Sabrina Carpenter', '2025-01-13', N'reprovado'),
(3,  2, N'Eminem',            '2025-01-20', N'em análise'),
(4,  3, N'Beyoncé',           '2025-02-05', N'aprovado'),
(5,  4, N'Dua Lipa',          '2025-02-15', N'reprovado'),
(6,  5, N'Ariana Grande',     '2025-02-22', N'em análise'),
(7,  6, N'Lady Gaga',         '2025-03-02', N'aprovado'),
(8,  7, N'Eminem',            '2025-03-06', N'reprovado'),
(9,  8, N'Rihanna',           '2025-03-12', N'aprovado'),
(10, 9, N'Charli XCX',        '2025-03-16', N'em análise'),
(11, 1, N'Anitta',            '2025-01-14', N'aprovado'),
(12, 3, N'Adele',             '2025-02-06', N'reprovado'),
(13, 6, N'Shakira',           '2025-03-03', N'em análise'),
(14, 10,N'Eminem',            '2025-03-21', N'em análise'),
(15, 2, N'Doja Cat',          '2025-01-22', N'aprovado');
GO
