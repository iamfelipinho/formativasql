create database formativaaa;
use formativaaa;


create table usuario(
	id bigint not null auto_increment,
	firstName varchar(100),
	lastName varchar(100),
	cpf varchar(150) not null,
	gender enum('f', 'm') not null,
	email varchar(150) not null,
	birth datetime not null,
	password varchar(150) not null,
	registerDate datetime not null default now(),
    ocupation_id bigint not null,
    foreign key(ocupation_id) references ocupation(id),
	primary key(id)
);

create table access_level(
	id bigint not null auto_increment,
	nome varchar(150) not null,
	primary key (id)
);

create table ocupation(
	id bigint not null auto_increment,
	usuario_id bigint not null,
	access_id bigint not null,
	foreign key(access_id) references access_level(id),
	primary key(id)
);

create table local(
	id bigint not null auto_increment,
	nameLocal varchar(150) not null,
	bloco enum('A', 'B', 'C', 'D'),
	resources_id bigint not null,
    capacidade int not null,
	primary key(id)
);

create table events(
	id bigint not null auto_increment,
    name varchar(45) not null,
    data_inicio datetime not null,
    data_final datetime not null,
    min_check_in datetime not null,
    max_check_in datetime not null,
    capacidade int not null,
    id_local bigint not null,
    primary key(id),
    foreign key (id_local) references local(id)
);

create table itens(
	id bigint not null auto_increment,
    nome varchar(20),
    primary key(id)
);

create table check_itens(
	id bigint not null auto_increment,
    item_id bigint not null,
    local_id bigint not null,
    presente boolean,
    primary key(id),
    foreign key(local_id) references local(id),
    foreign key(item_id) references itens(id)
);

create table ticket(
	id bigint not null auto_increment,
    usuario_id bigint not null,
    evento_id bigint not null,
    primary key(id),
    foreign key(usuario_id) references usuario(id),
    foreign key(evento_id) references events(id)
);







