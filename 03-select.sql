-- 1. Listar todos os pets de um cliente específico
SELECT p.nome, p.raca
FROM pet p
JOIN cliente c ON p.id_cliente = c.id_cliente
WHERE c.nome ILIKE '%Lucas%';

-- 2. Listar produtos ordenados do mais caro para o mais barato
SELECT nome_produto, preco
FROM produto
ORDER BY preco DESC;

-- 3. Mostrar todos os atendimentos com nome do pet e serviço
SELECT a.id_atendimento, p.nome AS pet, s.nome_servico, a.data
FROM atendimento a
JOIN pet p ON a.id_pet = p.id_pet
JOIN servico s ON a.id_servico = s.id_servico
ORDER BY a.data;

-- 4. Buscar os 5 clientes mais recentes
SELECT *
FROM cliente
ORDER BY id_cliente DESC
LIMIT 5;

-- 5. Ver total gasto em uma venda
SELECT v.id_venda, SUM(pr.preco * i.quantidade) AS total
FROM itemvenda i
JOIN produto pr ON i.id_produto = pr.id_produto
JOIN venda v ON i.id_venda = v.id_venda
GROUP BY v.id_venda;
