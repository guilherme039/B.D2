create schema if not exists Universidade;
use Universidade;

create table Curso(
	id_curso INT unsigned not null primary key auto_increment,
    descricao VARCHAR(200),
    portaria VARCHAR(50)
);

create table Matricula(
	id_matricula INT unsigned not null primary key auto_increment,
    id_curso INT unsigned not null,
    
    constraint fk_id_curso foreign key(id_curso)
    references Curso(id_curso) on delete restrict on update cascade
);

create table Aluno(
	id_aluno INT unsigned not null primary key auto_increment,
    nome VARCHAR(50) not null,
    data_nascimento DATETIME not null,
    endereco VARCHAR(50) not null,
    id_matricula INT unsigned not null,
    
    constraint fk_id_matricula foreign key(id_matricula)
    references Matricula(id_matricula) on delete restrict on update cascade
);

create table Notas(
	id_notas INT unsigned not null primary key auto_increment,
    id_aluno INT unsigned not null,
    
    constraint fk_id_aluno foreign key(id_aluno)
    references Aluno(id_aluno) on delete restrict on update cascade
);

create table Disciplina(
	id_disciplina INT unsigned not null primary key auto_increment,
	descricao VARCHAR(200),
    ementa VARCHAR(50)
);

create table Curso_possui_Disciplina(
	id_disciplina INT unsigned not null,
    id_curso INT unsigned not null,
    
    constraint fk_id_curso_disciplina foreign key(id_curso)
    references Curso(id_curso) on delete restrict on update cascade,
    
	constraint fk_id_disciplina_curso foreign key(id_disciplina)
    references Disciplina(id_disciplina) on delete restrict on update cascade
);
