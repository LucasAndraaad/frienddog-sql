-- 1. Apagar um pet que foi removido do cadastro
DELETE FROM pet
WHERE id_pet = 2;

-- 2. Remover um produto descontinuado
DELETE FROM produto
WHERE id_produto = 3;

-- 3. Deletar uma venda cancelada
DELETE FROM venda
WHERE id_venda = 1;

