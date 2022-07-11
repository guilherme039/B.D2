create table SuperMercado;

use SuperMercado;

create table Produto(
	id INT unsigned not null primary key auto_increment,
    nome VARCHAR(50) not null,
    preco FLOAT unsigned not null
);

create table Estoque(
	id_estoque INT unsigned not null primary key auto_increment,
	id_fornecedor INT unsigned not null,
    quantidade INT not null,
    dataDeValidade DATETIME not null,
	id_gondola INT unsigned not null,
    
	constraint fk_fornecedor foreign key(id_fornecedor) 
    references Fornecedor(id_fornecedor) on delete restrict on update cascade,
    
	constraint fk_id_gondola foreign key(id_gondola) 
    references Gondola(id_gondola) on delete restrict on update cascade 
);

create table Fornecedor(
	id_fornecedor INT unsigned not null primary key auto_increment,
	nome VARCHAR(50) not null,
	localidade VARCHAR(50) not null
);

create table Gondola(
	id_gondola INT unsigned not null primary key auto_increment,
	produtos VARCHAR(50) not null,
	quantidadeDisponivel VARCHAR(50) not null
);

create table Cliente(
	id_client INT unsigned not null primary key auto_increment,
	data_nascimento DATETIME not null,
    endereco VARCHAR(50) not null,
    telefone VARCHAR(50) not null,
    cpf VARCHAR(50) not null
);

create table Carrinho(
	id_carrinho INT unsigned not null primary key auto_increment,
	id_cliente INT unsigned not null,
    
	constraint fk_id_cliente foreign key(id_cliente) 
    references Cliente(id_cliente) on delete restrict on update cascade
);	

create table Caixa(
	id_caixa INT unsigned not null primary key auto_increment,
    id_carrinho INT unsigned not null,
	qntd_Vendas INT unsigned not null,
    
	constraint fk_id_carrinho foreign key(id_carrinho) 
    references Carrinho(id_carrinho) on delete restrict on update cascade
);	

create table Venda(
	id_venda INT unsigned not null primary key auto_increment,
	produtos VARCHAR(50) not null,
    data_venda DATETIME not null,
    id_caixa INT unsigned not null,
    
	constraint fk_id_caixa foreign key(id_caixa) 
    references Caixa(id_caixa) on delete restrict on update cascade
);	

create table Produto_entra_Estoque(
	id_produto INT unsigned not null primary key auto_increment,
	id_estoque INT unsigned not null,
    id_fornecedor INT unsigned not null,
	
	constraint fk_id_produto foreign key(id_produto) 
    references Produto(id_produto) on delete restrict on update cascade,
	
	constraint fk_id_estoque foreign key(id_estoque) 
    references Estoque(id_estoque) on delete restrict on update cascade,
    
	constraint fk_id_fornecedor foreign key(id_fornecedor) 
    references Fornecedor(id_fornecedor) on delete restrict on update cascade
);

create table Gondolas_por_Carrinhos(
	id_gondola INT unsigned not null primary key auto_increment,
	id_carrinho INT unsigned not null,
    
	constraint fk_id_gondolas foreign key(id_gondolas) 
    references Gondola(id_gondolas) on delete restrict on update cascade,
	
	constraint fk_id_carrinho foreign key(id_carrinho) 
    references Carrinho(id_carrinho) on delete restrict on update cascade
);
