CREATE TABLE IF NOT EXISTS festival_Aluno (
	mat_aluno_pk VARCHAR(15) PRIMARY KEY,
    nome_aluno VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS festival_Professor (
	mat_prof_pk INT PRIMARY KEY,
    nome_prof VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS festival_Festival (
	ano_festival_pk INT PRIMARY KEY,
    tema_festival VARCHAR(45) NOT NULL,
    dt_inicio_festival DATE NOT NULL,
    dt_fim_festival DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS festival_Tp_apresentacao (
	id_tp_apresentacao_pk INT PRIMARY KEY,
    nome_tp_apresentacao VARCHAR(45) NOT NULL
);

CREATE TABLE IF NOT EXISTS festival_Apresentacao (
	id_apresentacao_pk INT PRIMARY KEY,
    nome_apresentacao VARCHAR(100) NOT NULL,
    dt_inicio_apresentacao DATETIME NOT NULL,
    dt_fim_apresentacao DATETIME,
    duracao_apresentacao INT NOT NULL,
    id_tp_apresentacao_apresentacao_fk INT NOT NULL,
    ano_festival_apresentacao_fk INT NOT NULL,
    
    FOREIGN KEY ( id_tp_apresentacao_apresentacao_fk) REFERENCES Festival_tp_apresentacao( id_tp_apresentacao_pk),
    FOREIGN KEY ( ano_festival_apresentacao_fk) REFERENCES Festival_festival( ano_festival_pk)
);

CREATE TABLE IF NOT EXISTS festival_Professor_Apresentacao (
	professor_mat_prof_apr_pk INT NOT NULL,
    apresentacao_id_prof_apr_pk INT NOT NULL,
    nota_prof_apr DECIMAL(2,2),
    
    PRIMARY KEY ( professor_mat_prof_apr_pk, apresentacao_id_prof_apr_pk),
    FOREIGN KEY ( professor_mat_prof_apr_pk) REFERENCES Festival_professor( mat_prof_pk),
    FOREIGN KEY ( apresentacao_id_prof_apr_pk) REFERENCES Festival_apresentacao( id_apresentacao_pk)
);

CREATE TABLE IF NOT EXISTS festival_Aluno_Apresentacao (
	mat_aluno_alu_apr_pk VARCHAR(15) NOT NULL,
    id_apresentacao_alu_apr_pk INT NOT NULL,
    papel_alu_apr VARCHAR(45),
    
    PRIMARY KEY ( mat_aluno_alu_apr_pk, id_apresentacao_alu_apr_pk),
    FOREIGN KEY ( mat_aluno_alu_apr_pk) REFERENCES Festival_aluno( mat_aluno_pk),
    FOREIGN KEY ( id_apresentacao_alu_apr_pk) REFERENCES Festival_apresentacao( id_apresentacao_pk)
);
