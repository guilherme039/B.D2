CREATE SCHEMA IF NOT EXISTS Alunos_VAs;
USE Alunos_VAs;

CREATE TABLE IF NOT EXISTS aluno(
	id_aluno INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
    nome VARCHAR(50) NOT NULL,
    nota_final INT DEFAULT 0
);

CREATE TABLE IF NOT EXISTS avaliacao(
	id_avaliacao INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    valor INT NOT NULL,
    id_aluno INT NOT NULL,
    
    CONSTRAINT fk_aluno_avaliacao FOREIGN KEY (id_aluno)
    REFERENCES Aluno(id_aluno) ON DELETE RESTRICT ON UPDATE CASCADE
);

INSERT INTO aluno(nome) VALUES ("Carlos");
INSERT INTO aluno(nome) VALUES ("Maria");

DELIMITER $
CREATE TRIGGER trigger_insert_prova 
AFTER INSERT ON avaliacao 
FOR EACH ROW
BEGIN 
	UPDATE aluno SET nota_final = nota_final + NEW.valor WHERE id_aluno = NEW.id_aluno;
END$
DELIMITER ; 

INSERT INTO avaliacao(nome, valor, id_aluno) VALUES ("VA1", 10, 1);
INSERT INTO avaliacao(nome, valor, id_aluno) VALUES ("VA2", 20, 1);
INSERT INTO avaliacao(nome, valor, id_aluno) VALUES ("VA3", 30, 1);
INSERT INTO avaliacao(nome, valor, id_aluno) VALUES ("OAT", 10, 1);

INSERT INTO avaliacao(nome, valor, id_aluno) VALUES ("VA1", 15, 2);
INSERT INTO avaliacao(nome, valor, id_aluno) VALUES ("VA2", 25, 2);
INSERT INTO avaliacao(nome, valor, id_aluno) VALUES ("VA3", 35, 2);
INSERT INTO avaliacao(nome, valor, id_aluno) VALUES ("OAT", 15, 2);

SELECT * FROM aluno;
