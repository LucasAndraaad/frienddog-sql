-- 1. Atualizar o telefone de um cliente
UPDATE cliente
SET telefone = '1199999-2222'
WHERE id_cliente = 1;

-- 2. Corrigir a idade do pet
UPDATE pet
SET idade = 6
WHERE id_pet = 1;

-- 3. Aumentar o preço de um serviço em 10%
UPDATE servico
SET preco_base = preco_base * 1.10
WHERE id_servico = 1;
