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