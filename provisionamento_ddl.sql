drop database if exists provisionamento_de_acessos;
create database provisionamento_de_acessos;
use provisionamento_de_acessos;
create table usuario(
    id int not null primary key auto_increment,
    nome varchar(100) not null,
    email varchar(20) not null unique,
    cargo varchar(50) not null,
    departamento varchar(100) not null,
    estado varchar(20) not null
);
create table servidor(
    id int not null primary key auto_increment,
    nome varchar(100) not null,
    hostname varchar(100) not null,
    ip varchar(15) not null,
    sistema_operacional varchar(50) not null,
    ambiente varchar(40) not null
);
create table perfil(
    id_perfil int not null primary key auto_increment,
    nome varchar(100) not null,
    descricao varchar(200) not null,
    nivel_acesso varchar(10) not null
);
create table contadeacesso(
    id_conta int not null primary key auto_increment,
    id_usuario int not null,
    id_servidor int not null,
    login_conta varchar(50) not null,
    estado varchar(20) not null,
    data_criacao date not null,
    data_expiracao date not null
);
create table acesso(
    id_acesso int not null primary key auto_increment,
    id_conta int not null,
    id_perfil int not null,
    data_inicio date not null,
    data_fim date not null,
    estado varchar(20) not null
);

alter table contadeacesso add constraint fk_contas foreign key (id_usuario) references usuario(id);
alter table contadeacesso add constraint fk_servidores foreign key (id_servidor) references servidor(id);
alter table acesso add constraint fk_acessos foreign key (id_conta) references contadeacesso(id_conta);
alter table acesso add constraint fk_perfis foreign key (id_perfil) references perfil(id_perfil);

describe usuario;
describe servidor;
describe perfil;
describe contadeacesso;
describe acesso;
show tables;