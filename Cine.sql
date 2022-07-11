CREATE SCHEMA IF NOT EXISTS Cine_Criticas;
USE Cine_Criticas;

CREATE TABLE IF NOT EXISTS Usuario (
	id_usuario INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	apelido VARCHAR(20) NOT NULL,
	foto VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS Login (
	id_usuario INT NOT NULL,
	email VARCHAR(20) NOT NULL,
	senha VARCHAR(20) NOT NULL,
    
    CONSTRAINT fk_id_usuario FOREIGN KEY (id_usuario)
    REFERENCES Usuario(id_usuario) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Ator(
	id_ator INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50) NOT NULL,
	nascimento DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS Diretor (
	id_diretor INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(20) NOT NULL,
	nascimento DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS Critico (
	id_critico INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(20) NOT NULL,
	nascimento DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS Filme(
	id_filme INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    id_diretor INT NOT NULL,
    sinopse VARCHAR(500) NOT NULL,
    faixa_etaria ENUM('L', '12', '14', '16', '18') NOT NULL,
    
    CONSTRAINT fk_Filme_Diretor FOREIGN KEY (id_diretor)
    REFERENCES Diretor(id_diretor) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Critica(
	id_critica INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_filme INT NOT NULL,
    nota_critico INT NOT NULL,
    critica VARCHAR(1000) NOT NULL,
	id_critico INT NOT NULL,

	CONSTRAINT fk_critica_critico FOREIGN KEY (id_critico)
    REFERENCES Critico(id_critico) ON DELETE RESTRICT ON UPDATE CASCADE,
    
	CONSTRAINT fk_critica_filme FOREIGN KEY (id_filme)
    REFERENCES Filme(id_filme) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Nota_publico (
	id_filme INT NOT NULL,
	id_usuario INT NOT NULL,
	nota FLOAT NOT NULL,

	CONSTRAINT fk_usuario_nota_publico FOREIGN KEY (id_usuario)
	REFERENCES Usuario(id_usuario) ON DELETE RESTRICT ON UPDATE CASCADE,
    
	CONSTRAINT fk_id_filme FOREIGN KEY (id_filme)
	REFERENCES Filme(id_filme) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Comentario_critica (
	id_critica INT NOT NULL,
	id_usuario INT NOT NULL,
	comentario VARCHAR(100) NOT NULL,

	CONSTRAINT fk_usuario_omentario_critica FOREIGN KEY (id_usuario)
	REFERENCES Usuario(id_usuario) ON DELETE RESTRICT ON UPDATE CASCADE,
	
    CONSTRAINT fk_id_critica FOREIGN KEY (id_critica)
	REFERENCES Critica(id_critica) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Filme_tem_ator(
	id_ator INT NOT NULL,
    id_filme INT NOT NULL,
    
    CONSTRAINT fk_ator_filme FOREIGN KEY (id_ator)
    REFERENCES Ator(id_ator) ON DELETE RESTRICT ON UPDATE CASCADE,
    
    CONSTRAINT fk_filme_ator FOREIGN KEY (id_filme)
    REFERENCES Filme(id_filme) ON DELETE RESTRICT ON UPDATE CASCADE
);

INSERT INTO Usuario(id_usuario, apelido, foto) VALUES (0, "ClovisBS", "link_exemplo_foto");
INSERT INTO Usuario(id_usuario, apelido, foto) VALUES (0, "ThigoME", "link_exemplo_foto2");
INSERT INTO Usuario(id_usuario, apelido, foto) VALUES (0, "CleyssonCW", "link_exemplo_foto3");

INSERT INTO Diretor(id_diretor, nome, nascimento) VALUES (0, "JonasCJ", 05/06/1988);
INSERT INTO Diretor(id_diretor, nome, nascimento) VALUES (0, "TadeuPP", 25/04/1991);
INSERT INTO Diretor(id_diretor, nome, nascimento) VALUES (0, "RafaelFG", 13/11/1986);

INSERT INTO Critico(id_critico, nome, nascimento) VALUES (0, "JessicaAP", 30/01/1997);
INSERT INTO Critico(id_critico, nome, nascimento) VALUES (0, "JulioAV", 24/09/1994);
INSERT INTO Critico(id_critico, nome, nascimento) VALUES (0, "FelipeGS", 19/03/1989);

INSERT INTO Login(id_usuario, email, senha) VALUES (1, "clovis@gmail.com", "12345678");
INSERT INTO Login(id_usuario, email, senha) VALUES (2, "klaus@gmail.com", "12345678");
INSERT INTO Login(id_usuario, email, senha) VALUES (3, "dark@gmail.com", "12345678");

INSERT INTO Ator(id_ator, nome, nascimento) VALUES (0, "Sérgio", 19/03/1989);
INSERT INTO Ator(id_ator, nome, nascimento) VALUES (0, "Lucas", 19/03/1989);
INSERT INTO Ator(id_ator, nome, nascimento) VALUES (0, "Gustavo", 19/03/1989);

INSERT INTO Filme(id_filme, nome, id_diretor, sinopse, faixa_etaria) VALUES (0, "As Cronicas de Narnia", 1, "sinopse", 'L');
INSERT INTO Filme(id_filme, nome, id_diretor, sinopse, faixa_etaria) VALUES (0, "Harry Potter", 2, "sinopse", 'L');
INSERT INTO Filme(id_filme, nome, id_diretor, sinopse, faixa_etaria) VALUES (0, "A Ponte para Terabítia", 3, "sinopse", 'L');

INSERT INTO Critica(id_critica, id_filme, nota_critico, critica, id_critico) VALUES (0, 2, 10, "bom", 2);
INSERT INTO Critica(id_critica, id_filme, nota_critico, critica, id_critico) VALUES (0, 1, 10, "bom", 1);
INSERT INTO Critica(id_critica, id_filme, nota_critico, critica, id_critico) VALUES (0, 3, 10,"bom", 3);

INSERT INTO Nota_publico(id_filme, id_usuario, nota) VALUES (1, 2, 10);
INSERT INTO Nota_publico(id_filme, id_usuario, nota) VALUES (3, 1, 10);
INSERT INTO Nota_publico(id_filme, id_usuario, nota) VALUES (2, 3, 10);

INSERT INTO Comentario_critica (id_usuario, id_critica, comentario) VALUES (3, 1, "muito bom 2 estrelas");
INSERT INTO Comentario_critica (id_usuario, id_critica, comentario) VALUES (2, 2, "cativante");
INSERT INTO Comentario_critica (id_usuario, id_critica, comentario) VALUES (1, 3, "ruim");

INSERT INTO Filme_tem_ator(id_ator, id_filme) VALUES (3, 2);
INSERT INTO Filme_tem_ator(id_ator, id_filme) VALUES (1, 1);
INSERT INTO Filme_tem_ator(id_ator, id_filme) VALUES (2, 3);