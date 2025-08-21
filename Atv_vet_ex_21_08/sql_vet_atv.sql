-- exercicio 1

-- insirir um novo pet chamado 'Thor'
INSERT INTO vet_ex_pet (nome_pet_vet_ex, nascimento_pet_vet_ex, sexo_pet_vet_ex, id_raca_fk) 
VALUES (
	'Thor',
    '2021-03-15',
    'M',
    (SELECT id_raca_pk FROM vet_ex_raca WHERE nome_raca_vet_ex = 'Bulldog' LIMIT 1)
);

-- inserir um novo atendimento para 'Thor'
INSERT INTO vet_ex_atendimento (id_pet_fk, data_atendimento_vet_ex, descricao_vet_ex, valor_vet_ex, retorno_vet_ex)
VALUES (
    (SELECT id_pet_pk FROM vet_ex_pet WHERE nome_pet_vet_ex = 'Thor' LIMIT 1 AND
    SELECT id_raca_pk FROM vet_ex_raca WHERE nome_raca_vet_ex = 'Bulldog' LIMIT 1),
    '2025-09-10 09:00:00',
    'Vacina múltipla',
    150.00,
    FALSE
);

-- exercicio 2

-- atualizar o nome do pet 'Molly' para 'Molly Grace' e sua data de nascimento
UPDATE vet_ex_pet
SET nome_pet_vet_ex = 'Molly Grace',
	nascimento_pet_vet_ex = '2017-07-14'
WHERE nome_pet_vet_ex = 'Molly';

-- inserir um novo atendimento para 'Molly Grace'
INSERT INTO vet_ex_atendimento (id_pet_fk, data_atendimento_vet_ex, descricao_vet_ex, valor_vet_ex, retorno_vet_ex)
VALUES (
	(SELECT id_pet_pk FROM vet_ex_pet WHERE nome_pet_vet_ex = 'Molly Grace'),
    '2025-08-20 10:00:00',
    'Consulta geral',
    80.00,
    FALSE
);

-- exercicio 3

SELECT nome_raca_vet_ex nome_raca FROM vet_ex_raca raca
JOIN vet_ex_pet pet ON pet.id_pet_pk = raca.id_raca_pk
WHERE raca.id_raca_pk != pet.id_raca_fk;

-- exercicio 4

SELECT nome_raca_vet_ex nome_raca, pet.nome_pet_vet_ex nome_pet FROM vet_ex_raca raca
INNER JOIN vet_ex_pet AS pet on pet.id_raca_fk = raca.id_raca_pk
ORDER BY raca.nome_raca_vet_ex, pet.nome_pet_vet_ex;

-- exercicio 5

SELECT COUNT(*) AS quantidade,
	CONCAT(ROUND((COUNT(*)/(SELECT COUNT(*) FROM vet_ex_pet)) *100,2), '%')
	AS percentual
FROM vet_ex_pet
GROUP BY sexo_pet_vet_ex;