create database dbclinica;
use dbclinica;

create table medico(
crm int not null,
nome varchar(40) not null,
idade int not null check (idade < 23),
especialidade char(20) not null default ('Ortopedista'),
cpf varchar(15) not null unique,
 data_de_admissao date);
 
 create table paciente(
 crm varchar(11) unique not null,
 nome varchar(40) not null,
 data_nascimento date,
 cidade char(30) default default('taguatinga'),
 Plano_Saude varchar(40) not null default ('SUS'));
 
 create table fucionario(
 matricula int unique not null auto_increment,
 nome varchar(40) not null,
 data_nascimento date not null,
 data_admissao date not null,
cargo varchar(40) not null default('assistente medico'),
salario_decimal(6,2) not null default('1.510,00'));

create table consultas(
codigo_consulta int unique not null auto_increment,
data_horario datetime); 

