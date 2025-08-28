-- questao 1
UPDATE aval_futsal_jogador
SET data_nascimento = '2008-06-20'
WHERE nome = 'Veiga';

-- questao 2
DELETE posicao FROM aval_futsal_posicao_jogador AS posicao
JOIN aval_futsal_jogador AS jogador ON jogador.id_jogador_pk = posicao.id_jogador_fk 
WHERE posicao.id_jogador_fk = 
    (SELECT id_jogador_pk FROM aval_futsal_jogador WHERE nome = 'Lívia') 
    AND posicao.posicao = 'ala';

-- questao 3
SELECT jogador.nome, jogador.turma
FROM aval_futsal_jogador jogador
JOIN aval_futsal_posicao_jogador posicao ON posicao.id_jogador_fk = jogador.id_jogador_pk
WHERE posicao.posicao = 'fixo';

-- questao 5
SELECT jogador.nome, COUNT(*) AS faltas
FROM aval_futsal_treino AS treino
JOIN aval_futsal_desempenho_treino AS desempenho ON desempenho.id_treino_fk = treino.id_treino_pk
JOIN aval_futsal_jogador AS jogador ON jogador.id_jogador_pk = desempenho.id_jogador_fk
WHERE desempenho.presenca = FALSE AND treino.data BETWEEN '2025-04-01' AND '2025-06-30'
GROUP BY jogador.id_jogador_pk 
ORDER BY jogador.nome;

--questao 6
SELECT jogador.nome, COUNT(*) AS presenca
FROM aval_futsal_treino AS treino
JOIN aval_futsal_desempenho_treino AS desempenho ON desempenho.id_treino_fk = treino.id_treino_pk
JOIN aval_futsal_jogador AS jogador ON jogador.id_jogador_pk = desempenho.id_jogador_fk
WHERE desempenho.presenca = TRUE AND treino.data BETWEEN '2025-04-01' AND '2025-06-30'
GROUP BY jogador.id_jogador_pk 
HAVING presenca = 26
ORDER BY jogador.nome;

-- questao 7
SELECT jogador.nome AS jogador, AVG(dominio) AS mDominio, AVG(drible) AS mDrible, AVG(emocional) AS mEmocional, AVG(finalizacao) AS mFinalizacao, AVG(intensidade) AS mIntensidade, AVG(passe) AS mPasse, AVG(movimentacao_defensiva) AS mDefensiva, AVG(movimentacao_ofensiva) AS mOfensiva, AVG(tomada_decisao) AS mDesicao, AVG(compromisso_tatico) AS mTatico, AVG(desempenho_geral) AS mGeral
FROM aval_futsal_desempenho_treino AS desempenho
JOIN aval_futsal_jogador AS jogador ON jogador.id_jogador_pk = desempenho.id_jogador_fk
GROUP BY jogador.nome
ORDER BY jogador.nome;

-- questao 8
DELETE desempenho 
FROM  aval_futsal_desempenho_treino AS desempenho
WHERE desempenho.id_jogador_fk =
(SELECT jogador.id_jogador_pk
 FROM aval_futsal_jogador as jogador
 WHERE jogador.nome = 'Domingues');

DELETE posicao
FROM  aval_futsal_posicao_jogador AS posicao
WHERE posicao.id_jogador_fk =
(SELECT jogador.id_jogador_pk
 FROM aval_futsal_jogador as jogador
 WHERE jogador.nome = 'Domingues');

DELETE jogador 
FROM aval_futsal_jogador AS jogador
WHERE jogador.nome = 'Domingues';

-- questao 9
INSERT INTO aval_futsal_jogador(nome, data_nascimento, turma) values
	('A Sagaz', '1965-04-01', 'TurmaDaResenha')
;

INSERT INTO aval_futsal_posicao_jogador(id_jogador_fk, posicao) VALUES
	(15, 'ala'),
    (15, 'fixo'),
    (15, 'pivô')
;

-- questao 10
UPDATE aval_futsal_jogador AS jogador
SET jogador.nome = 'Mafer a Odiosa'
WHERE jogador.nome = 'Mafer';