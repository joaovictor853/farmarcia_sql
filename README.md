 Projeto: Modelagem e Análise de Vendas - Farmácia
 Visão Geral do Projeto
Este projeto consiste na modelagem de um banco de dados relacional para a gestão de uma rede de farmácias, cobrindo o cadastro de clientes, colaboradores, estoque e o registro das transações financeiras.

 Tecnologias Utilizadas
    • SGBD: MySQL
    • Linguagem: SQL (DDL, DML, DQL)
    • Recursos Avançados: Window Functions (LAG), CTEs, Joins (LEFT JOIN, INNER JOIN), CASE e Views.

 Análises de Negócio & Insights
1. Evolução Mensal do Faturamento (Month-over-Month)
Consulta SQL Executada:
WITH faturamento_mensal AS (
    SELECT 
		DATE_FORMAT(data_hora_venda, '%Y-%m') AS mes_ano,
		COUNT(id_venda) AS total_vendas,
		SUM(valor_total) AS faturamento,
		ROUND(AVG(valor_total), 2) AS ticket_medio
	FROM venda
	GROUP BY DATE_FORMAT(data_hora_venda, '%Y-%m')
)
SELECT
	mes_ano,
    total_vendas,
    faturamento,
    ticket_medio,
    LAG(faturamento, 1) OVER (ORDER BY mes_ano) AS faturamento_mes_anterior,
    ROUND(
		((faturamento - LAG(faturamento, 1) OVER (ORDER BY mes_ano))
        / LAG(faturamento, 1) OVER (ORDER BY mes_ano)) * 100, 2
    ) AS porcentagem_crescimento
FROM faturamento_mensal
ORDER BY mes_ano ASC;

Análise do Analista:
    • Pico de Vendas: Junho e Janeiro tiveram os melhores desempenho
    • Queda de Vendas: Em Abril, houve redução nas vendas 



3. Análise de Giro de Estoque, Produtos Menos Vendidos e Capital Parado

Consulta SQL Executada:
SELECT
	p.id_produto,
    p.nome AS nome_produto,
    p.categoria,
    p.quantidade_estoque AS estoque_atual,
    COALESCE(SUM(iv.quantidade), 0) AS unidades_vendidas,
    ROUND(COALESCE(SUM(iv.quantidade * iv.valor_unitario), 0), 2) AS receita_gerada,
    ROUND(p.preco * p.quantidade_estoque, 2) AS capital_parado_estoque,
    CASE
		WHEN COALESCE(SUM(iv.quantidade), 0) = 0 THEN 'Critico: Sem Vendas'
        WHEN COALESCE(SUM(iv.quantidade), 0) <= 5 THEN 'ALERTA: Baixo Giro'
        WHEN COALESCE(SUM(iv.quantidade), 0) <= 12 THEN 'Giro Médio'
        ELSE 'Alto Giro'
	END AS status_estrategico
FROM produto AS p
LEFT JOIN item_venda AS iv ON p.id_produto = iv.id_produto
GROUP BY p.id_produto, p.nome, p.categoria, p.quantidade_estoque, p.preco
ORDER BY unidades_vendidas ASC, capital_parado_estoque DESC;

Análise do Analista:
    • Risco de Estoque: Produtos como Protetor Solar FPS 50 e Curativo Gel de Silicone apresentaram baixo giro de saída com valor unitário elevado, representando capital parado que exige ações de liquidação antes do vencimento.

3. Ranking de Desempenho e Comissão de Funcionários
Consulta SQL Executada:
SELECT
	f.id_funcionarios,
    f.nome_completo AS funcionario,
    COUNT(v.id_venda) AS total_vendas_realizadas,
    ROUND(SUM(v.valor_total), 2) AS faturamento_gerado,
    ROUND(AVG(v.valor_total), 2) AS ticket_medio_atendimento,
    ROUND(SUM(v.valor_total) * 0.03, 2) AS comissao_estimada_3_porcento
FROM funcionarios AS f
INNER JOIN venda AS v ON f.id_funcionarios = v.id_funcionarios
GROUP BY f.id_funcionarios, f.nome_completo
ORDER BY faturamento_gerado DESC;

Análise do Analista:
Objetivo: Mapear o faturamento por colaborador, avaliar o ticket médio individual e calcular a comissão de 3%.

4. Visão Reutilizável (VIEW) para Dashboard de Categoria
Consulta SQL Executada:
SELECT
	f.id_funcionarios,
    f.nome_completo AS funcionario,
    COUNT(v.id_venda) AS total_vendas_realizadas,
    ROUND(SUM(v.valor_total), 2) AS faturamento_gerado,
    ROUND(AVG(v.valor_total), 2) AS ticket_medio_atendimento,
    ROUND(SUM(v.valor_total) * 0.03, 2) AS comissao_estimada_3_porcento
FROM funcionarios AS f
INNER JOIN venda AS v ON f.id_funcionarios = v.id_funcionarios
GROUP BY f.id_funcionarios, f.nome_completo
ORDER BY faturamento_gerado DESC;

-- VIEW para Dashboard de categoria
CREATE OR REPLACE VIEW vw_dashboard_vendas_categoria AS
SELECT
	p.categoria,
    COUNT(DISTINCT v.id_venda) AS quantidade_vendas,
    SUM(iv.quantidade) AS total_itens_vendidos,
    ROUND(SUM(iv.quantidade * iv.valor_unitario), 2) AS faturamento_bruto,
    ROUND((SUM(iv.quantidade * iv.valor_unitario) / (SELECT SUM(valor_total) FROM venda)) * 100, 2) AS percentual_participacao_faturamento
FROM produto AS p
INNER JOIN item_venda AS iv ON p.id_produto = iv.id_produto
INNER JOIN venda AS v ON iv.id_venda = v.id_venda
GROUP BY p.categoria
ORDER BY faturamento_bruto DESC;

SELECT * FROM vw_dashboard_vendas_categoria;
Análise do Analista:
    • Objetivo: de facilitar a integração com ferramenta de visualização de dados
