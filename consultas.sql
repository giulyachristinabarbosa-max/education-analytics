-- Projeto: Education Analytics
-- Objetivo: Queries para extração de métricas de evasão e financeiro

-- 1. Calcular a Receita Total apenas de alunos ativos (Recurring Revenue)
SELECT SUM(mensalidade) as receita_mensal_total
FROM alunos
WHERE status = 'Ativo';

-- 2. Identificar alunos com risco de cancelamento (Frequência < 60%)
SELECT nome, frequencia_media, status
FROM alunos
WHERE frequencia_media < 60;

-- 3. Contagem de alunos por Status (Ativo, Cancelado, Inadimplente)
SELECT status, COUNT(*) as quantidade_alunos
FROM alunos
GROUP BY status;