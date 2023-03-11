INSERT INTO cliente (nome) VALUES ('Cinthia');
INSERT INTO cliente (nome) VALUES ('Fabio');
INSERT INTO cliente (nome) VALUES ('Lucas');
SELECT* FROM cliente;
DROP TABLE registro
CREATE TABLE registro (
	paciente_id INTEGER,
	cliente_id INTEGER,
	FOREIGN KEY (paciente_id) REFERENCES paciente(id)
	ON DELETE CASCADE,
	FOREIGN KEY (cliente_id) REFERENCES cliente(id),
	PRIMARY KEY (paciente_id, cliente_id)
	
);
INSERT INTO registro(paciente_id, cliente_id)VALUES(1,1);
INSERT INTO registro(paciente_id, cliente_id)VALUES(2,3);

SELECT paciente.nome AS "Nome do paciente",
	   cliente.nome AS "Nome do cliente"
	   FROM registro
	   FULL JOIN paciente ON paciente.id = registro.paciente_id
	   FULL JOIN cliente ON cliente.id = registro.cliente_id;
	   
	   DELETE FROM paciente WHERE nome = 'Ciroc';
	  