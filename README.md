# Projeto: Provisionamento de acessos a servidores

![MER DER Conceitual e Lógico](./MERDER_tema03.drawio.png)

## Dicionário de Dados

| Entidade | Atributo | Tipo | Tamanho| Descrição |
|-|-|-|-|-|
| Usuário | id | int | 11 | Identificador, PK, Auto incrementável |
| Usuário | nome | varchar | 100 | Nome do usuário |
| Usuário | email | varchar | 20 | E-mail do usuário |
| Usuário | cargo | varchar | 50 | Cargo do usuário |
| Usuário | departamento | varchar | 100 | Departamento do usuário |
| Usuário | status | varchar | 100 | Status do usuário |
| Servidor | id | int | 11 | Identificador, PK, Auto incrementável |
| Servidor | nome | varchar | 100 | Nome do servidor |
| Servidor | hostname | varchar | 20 | Nome do host do servidor |
| Servidor | ip | string | 20 | IP do servidor |
| Servidor | sistema_operacinal | varchar | 50 | Sistema Operacional do servidor |
| Servidor | ambiente | varchar | 40 | Area em que o servidor é utilizado |
| Conta de Acesso | id_conta | int | 11 | Identificador, PK, Auto incrementável |
| Conta de Acesso | id_usuario | int | 11 | Identificador do usuário, FK referenciando Usuário (id)|
| Conta de Acesso | id_servidor | int | 11 | Identificador do servidor, FK referenciando Servidor (id)|
| Conta de Acesso | login | varchar | 50 | Login da conta de acesso |
| Conta de Acesso | status | varchar | 20 | Status da conta de acesso |
| Conta de Acesso | data_criacao | Date |  | Data de criação da conta de acesso |
| Conta de Acesso | data_expiracao | Date |  | Data de expiração da conta de acesso |
| Perfil | id_perfil | int | 11 | Identificador, PK, Auto incrementável |
| Perfil | nome | varchar | 100 | Nome do perfil |
| Perfil | descricao | varchar | 200 | Descrição do perfil |
| Perfil | nivel acesso | int | 11 | Nivel de acesso |
| Acesso | id_acesso | int | 11 | Identificador, PK, Auto incrementável |
| Acesso | id_conta | int | 11 | Identificador da conta, FK referenciando Conta de Acesso (id)|
| Acesso | id_perfil | int | 11 | Identificador do perfil, FK referenciando Perfil (id)|
| Acesso | data_inicio | date |  | Data de criação da autorização de acesso|
| Acesso | data_fim | date |  | Data de expiração da autorização de acesso|
| Acesso | status | varchar | 20 | Status da autorização de acesso |

## Dados de teste em CSV

- [usuario.csv](./usuario.csv)
- [servidor.csv](./servidor.csv)
- [perfil.csv](./perfil.csv)
- [contadeacesso.csv](./contadeacesso.csv)
- [acesso.csv](./acesso.csv)

## Script SQL DDL (Desenvolvimanto: Criação do Banco de dados)
```sql
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
```
## Script SQL DML(Manipulação: População com dados de teste)
```sql
use provisionamento_de_acessos;
insert into usuario(nome, email, cargo, departamento, estado) values
("Ana Maria Silva","ana.silva@gmail.com","Analista","TI","Ativo"),
("Valentina Oliveira","valentina.oliveira@gmail.com","Desenvolvedora","TI","Ativo"),
("Enzo Martins","enzo.martins@gmail.com","Gerente","RH","Ativo");

insert into servidor(nome, hostname, ip, sistema_operacional, ambiente) values
("Servidor 1","srv01.example.com","192.168.1.10","Ubuntu 20.04","Produção"),
("Servidor 2","srv02.example.com","192.168.1.11","CentOS 7","Produção"),
("Servidor 3","srv03.example.com","192.168.1.12","Windows Server 2019","Produção");

insert into perfil(nome, descricao, nivel_acesso) values
("Administrador","Acesso completo ao sistema","Alto"),
("Usuário Comum","Acesso limitado às funcionalidades básicas","Médio"),
("Visitante","Acesso somente para visualização","Baixo");

insert into contadeacesso(id_usuario, id_servidor, login_conta, estado, data_criacao, data_expiracao) values
(1,1,"ana.silva","Ativo","2023-01-01","2023-12-31"),
(2,2,"valentina.oliveira","Ativo","2023-01-01","2023-12-31"),
(3,3,"enzo.martins","Ativo","2023-01-01","2023-12-31");

insert into acesso(id_conta, id_perfil, data_inicio, data_fim, estado) values
(1,1,"2023-01-01","2023-12-31","Ativo"),
(2,2,"2023-01-01","2023-12-31","Ativo"),
(3,3,"2023-01-01","2023-12-31","Ativo");

select * from usuario;
select * from servidor;
select * from perfil;
select * from contadeacesso;
select * from acesso;
```
