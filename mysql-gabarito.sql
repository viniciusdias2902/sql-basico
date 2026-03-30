-- ============================================================
-- BOMBA! Sabrina Carpenter não sabe SQL
-- MySQL — Gabarito
-- ============================================================

-- Q1: Selecione o nome e a cidade de todas as empresas.
SELECT nome, cidade
FROM empresas;

-- Q2: Vagas que pagam mais de R$ 5.000.
SELECT titulo, salario
FROM vagas
WHERE salario > 5000;

-- Q3: Empresas do setor 'Tecnologia'.
SELECT nome, cidade
FROM empresas
WHERE setor = 'Tecnologia';

-- Q4: Vagas remotas E que pagam mais de R$ 4.000.
SELECT titulo, salario
FROM vagas
WHERE remoto = TRUE
  AND salario > 4000;

-- Q5: Vagas com salário entre 3.000 e 6.000, de janeiro ou fevereiro.
SELECT titulo, salario, data_publicacao
FROM vagas
WHERE salario BETWEEN 3000 AND 6000
  AND MONTH(data_publicacao) IN (1, 2);

-- Q6: Título da vaga e nome da empresa (INNER JOIN).
SELECT v.titulo, e.nome AS empresa
FROM vagas v
INNER JOIN empresas e ON v.empresa_id = e.id;

-- Q7: Todas as vagas com candidatos, incluindo vagas sem candidaturas (LEFT JOIN).
SELECT v.titulo, c.candidato
FROM vagas v
LEFT JOIN candidaturas c ON v.id = c.vaga_id;

-- Q8: Quantas candidaturas cada vaga recebeu?
SELECT v.titulo, COUNT(c.id) AS total_candidaturas
FROM vagas v
LEFT JOIN candidaturas c ON v.id = c.vaga_id
GROUP BY v.titulo;

-- Q9: Salário médio, maior e menor por setor.
SELECT e.setor,
       ROUND(AVG(v.salario), 2) AS salario_medio,
       MAX(v.salario)           AS maior_salario,
       MIN(v.salario)           AS menor_salario
FROM vagas v
INNER JOIN empresas e ON v.empresa_id = e.id
GROUP BY e.setor;

-- Q10: Vagas com mais de 2 candidaturas.
SELECT v.titulo, COUNT(c.id) AS total_candidaturas
FROM vagas v
INNER JOIN candidaturas c ON v.id = c.vaga_id
GROUP BY v.titulo
HAVING COUNT(c.id) > 2;
