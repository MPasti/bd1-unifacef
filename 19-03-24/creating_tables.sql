--criando tabela de projetos
--restricoes: pk na coluna cod_projeto
CREATE TABLE tb_projetos(
	cod_projeto INTEGER,
	nome_projeto VARCHAR(40),
	CONSTRAINT pk_tb_projetos_cod_projeto PRIMARY KEY(cod_projeto)
);

--criando tabela de departamentos
-- restricoes: pk na coluna sigla
CREATE TABLE tb_departamentos(
	sigla VARCHAR(5),
	nome_departamento VARCHAR(60),
	CONSTRAINT pk_tb_departamentos_sigla PRIMARY KEY(sigla)
);
--criando tabela de funcionarios
-- restricoes: pk matricula_func, fk sigla_dep
CREATE TABLE tb_funcionarios(
	matricula_funcionarios VARCHAR(20),
	sigla VARCHAR(5),
	nome_funcionario VARCHAR(40),
	data_admissao DATE,
	data_nascimento DATE,
	data_lotacao DATE,
	CONSTRAINT pk_tb_funcionarios_matricula_func PRIMARY KEY(matricula_funcionarios),
	CONSTRAINT fk_tb_departamentos_sigla FOREIGN KEY(sigla)
	REFERENCES tb_departamentos(sigla)
);

CREATE TABLE tb_alocado(
	matricula_funcionarios VARCHAR(20),
	cod_projeto INTEGER,
	CONSTRAINT pk_tb_alocado_matricula_funcionarios_cod_projeto PRIMARY KEY(matricula_funcionarios, cod_projeto),
	CONSTRAINT fk_tb_funcionarios_matricula_funcionarios FOREIGN KEY(matricula_funcionarios)
	REFERENCES tb_funcionarios(matricula_funcionarios),
	CONSTRAINT fk_tb_projetos_cod_projeto FOREIGN KEY(cod_projeto)
	REFERENCES tb_projetos(cod_projeto)
);
