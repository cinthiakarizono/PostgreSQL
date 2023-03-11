CREATE TABLE paciente(
		id SERIAL PRIMARY KEY,
		nome VARCHAR(255) NOT NULL,
		raca_id INTEGER, 
		FOREIGN KEY (raca_id)
		REFERENCES raca (id)
);
CREATE TABLE raca(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(255)NOT NULL
);
CREATE TABLE cliente(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(255)NOT NULL
);
CREATE TABLE registro (
	paciente_id INTEGER,
	cliente_id INTEGER,
	FOREIGN KEY (paciente_id) REFERENCES paciente(id)
	ON DELETE CASCADE,
	FOREIGN KEY (cliente_id) REFERENCES cliente(id),
	PRIMARY KEY (paciente_id, cliente_id)
	
);

INSERT INTO raca (nome) VALUES ('SRD');
INSERT INTO raca (nome) VALUES ('Pisncher');
INSERT INTO raca (nome) VALUES ('Labrador');

INSERT INTO paciente (nome, raca_id) VALUES ('Toby', 1);
INSERT INTO paciente (nome, raca_id) VALUES ('Thor', 3);
INSERT INTO paciente (nome, raca_id) VALUES ('Ciroc', 2);

INSERT INTO cliente (nome) VALUES ('Cinthia');
INSERT INTO cliente (nome) VALUES ('Fabio');
INSERT INTO cliente (nome) VALUES ('Lucas');

SELECT* FROM cliente;

INSERT INTO registro(paciente_id, cliente_id)VALUES(1,1);
INSERT INTO registro(paciente_id, cliente_id)VALUES(2,3);


SELECT paciente.nome AS "Nome do paciente",
	   cliente.nome AS "Nome do cliente"
	   FROM registro
	   FULL JOIN paciente ON paciente.id = registro.paciente_id
	   FULL JOIN cliente ON cliente.id = registro.cliente_id;
	   
	   DELETE FROM paciente WHERE nome = 'Ciroc';
	  