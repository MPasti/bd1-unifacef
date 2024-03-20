CREATE TABLE tb_empregados(
	nm_empregado VARCHAR(60),
	rg VARCHAR(11),
	idade INTEGER,
	plano_saude VARCHAR(10),
	rua VARCHAR(20),
	numero VARCHAR(5),
	cidade VARCHAR(20),
	CONSTRAINT pk_tb_empregados_rg PRIMARY KEY(rg)
);

CREATE TABLE tb_telefones(
rg VARCHAR(11),
nr_telefone VARCHAR(15),
	CONSTRAINT pk_tb_telefones_rg_nr PRIMARY KEY(rg, nr_telefone),
	CONSTRAINT fk_tb_telefones_rg FOREIGN KEY(rg)
	REFERENCES tb_empregados(rg)
);

CREATE TABLE tb_pedidos(
	nr_pedido INTEGER,
	ds_pedido VARCHAR(20),
	dt_pedido DATE,
	CONSTRAINT pk_tb_pedidos_nr_pedido PRIMARY KEY(nr_pedido)
);

CREATE TABLE tb_itens(
nr_pedido INTEGER,
nr_item INTEGER,
nm_produto VARCHAR(40),
quantidade INTEGER
	CONSTRAINT pk_tb_itens_nr_pedido_nr_item PRIMARY KEY(nr_pedido_nr_item),
	CONSTRAINT fk_tb_items_nr_item FOREIGN KEY(nr_item)
	REFERENCES tb_pedidos(nr_pedido)
);

CREATE TABLE tb_servidores(
cpf VARCHAR(11),
nm_servidor VARCHAR(60),
	CONSTRAINT pk_tb_servidores_cpf PRIMARY KEY(cpf)
);

CREATE TABLE tb_funcionarios(
cpf VARCHAR(11),
	ds_funcao VARCHAR(20),
	CONSTRAINT pk_tb_funcionarios_cpf PRIMARY KEY(cpf),
	CONSTRAINT fk_tb_funcionarios_cpf FOREIGN KEY(cpf)
	REFERENCES tb_servidores(cpf)
);

CREATE TABLE tb_professores(
cpf VARCHAR(11),
tituacao VARCHAR(15),
categoria VARCHAR(15),
	CONSTRAINT pk_tb_professores_cpf PRIMARY KEY(cpf),
	CONSTRAINT fk_tb_professores_cpf FOREIGN KEY(cpf)
	REFERENCES tb_servidores(cpf)
)

CREATE TABLE tb_cnh(
nr_cnh INTEGER,
	dt_expedicao DATE,
	validade DATE,
	categoria VARCHAR(5),
	codigo INTEGER CONSTRAINT nn_tb_cnh_codigo NOT NULL
	CONSTRAINT uq_tb_cnh_codigo UNIQUE,
	dt_retirada DATE,
	CONSTRAINT pk_tb_cnh_nr PRIMARY KEY(nr_cnh),
	CONSTRAINT fk_tb_cnh_codigo FOREIGN KEY(codigo)
	REFERENCES tb_pessoas(codigo)
);
