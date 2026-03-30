# BOMBA! Sabrina Carpenter não sabe SQL

**10 questões básicas de SQL — do SELECT ao HAVING.**

Banco de dados temático com vagas de emprego — incluindo a icônica vaga de **Leitor de Tarot Júnior** — e candidaturas de divas pop (+ o Eminem, que ninguém sabe como foi parar ali).

> Conteúdo do vídeo no YouTube: *(link do vídeo aqui)*

---

## Estrutura do repositório

Cada banco de dados tem sua própria **branch**:

| Branch | Banco | Observação |
|--------|-------|------------|
| `main` | — | Este README e o arquivo de exercícios |
| `sqlserver` | SQL Server | `NVARCHAR`, `BIT`, `MONTH()`, batches com `GO` |
| `postgresql` | PostgreSQL | `BOOLEAN`, `NUMERIC`, `EXTRACT(MONTH FROM ...)` |
| `mysql` | MySQL | `BOOLEAN`, `DECIMAL`, `MONTH()`, `utf8mb4` |
| `sqlite` | SQLite | `INTEGER`, `TEXT`, `REAL`, `strftime('%m', ...)` |

### Como trocar de branch

```bash
# Ver todas as branches disponíveis
git branch -a

# Mudar para a branch do banco que você usa
git checkout sqlserver
git checkout postgresql
git checkout mysql
git checkout sqlite
```

---

## O que tem em cada branch

```
├── setup.sql          -- Criação das tabelas + inserção de dados
├── exercicios.sql     -- As 10 questões como comentários (pra você resolver)
└── gabarito.sql       -- Respostas de todas as questões
```

---

## Schema

Três tabelas simples:

```
empresas (id, nome, cidade, setor)
    │
    └──< vagas (id, empresa_id, titulo, salario, remoto, data_publicacao)
              │
              └──< candidaturas (id, vaga_id, candidato, data_envio, status)
```

### Empresas de destaque

- **Tarot Analytics** — sim, é real (no banco de dados)
- **DataMystic**, **CloudNova**, **ByteForge** — tech clássica
- **PipelineHQ** — consultoria

### Candidatas de destaque

Taylor Swift, Sabrina Carpenter, Beyoncé, Lady Gaga, Rihanna, Anitta, Doja Cat, Adele, Shakira, Ariana Grande, Dua Lipa, Charli XCX... e o **Eminem**, que se candidatou pra 3 vagas diferentes incluindo Leitor de Tarot Júnior.

---

## As 10 questões

| # | Tema | Conceito |
|---|------|----------|
| 1 | SELECT | Selecionar colunas |
| 2 | WHERE | Filtro numérico |
| 3 | WHERE | Filtro por texto |
| 4 | Expressões Lógicas | AND / OR |
| 5 | Expressões Lógicas | BETWEEN / IN |
| 6 | JOINs | INNER JOIN |
| 7 | JOINs | LEFT JOIN |
| 8 | Agregação | COUNT + GROUP BY |
| 9 | Agregação | AVG, MAX, MIN |
| 10 | Agregação | HAVING |

---

## Como usar

1. Escolha a branch do seu banco de dados
2. Rode o `setup.sql` pra criar as tabelas e inserir os dados
3. Abra o `exercicios.sql` e tente resolver cada questão
4. Confira suas respostas no `gabarito.sql`

---

## Diferença entre bancos

A única questão que muda de sintaxe é a **Questão 5** (extrair mês de uma data):

```sql
-- SQL Server / MySQL
MONTH(data_publicacao)

-- PostgreSQL
EXTRACT(MONTH FROM data_publicacao)

-- SQLite
CAST(strftime('%m', data_publicacao) AS INTEGER)
```

Todo o resto funciona igual nos 4 bancos.

---

## Licença

Uso livre. Se usar em conteúdo, dá um salve.
