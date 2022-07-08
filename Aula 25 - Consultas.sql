-- Criei banco de dados
create database maternidade;

-- Criei tabela mamãe
create table mamae(
	id int identity,
	nome varchar(50) not null

	constraint Pk_mamae primary key (id)
);

-- Criei a tabela bebê
create table bebe(
	id int identity,
	nome varchar(50) not null,
	data_nascimento date not null,
	hora_nascimento time not null,
	id_mae int

	constraint Pk_bebe primary key (id)
	
	-- Criei uma FK para tabela mamãe
	constraint Fk_mae foreign key (id_mae)
	references mamae(id)
);

-- Inserir os valores da tabela mamãe
insert into mamae (nome)
values 
	('Helena'),
	('Alice'),
	('Laura'),
	('Manuela'),
	('Valentia'),
	('Sophia'),
	('Isabella'),
	('Heloísa'),
	('Luiza'),
	('Júlia'),
	('Lorena'),
	('Lívia'),
	('Maria Luísa'),
	('Cecília'),
	('Eloá'),
	('Lucicreide'),
	('Giovanna'),
	('Maria Clara'),
	('Maria Eduarda'),
	('Mariana'),
	('Lara'),
	('Beatriz'),
	('Antonella'),
	('Maria Júlia'),
	('Emanuelly'),
	('Isadora'),
	('Ana Clara'),
	('Melissa'),
	('Ana Luiza'),
	('Rosanea'),
	('Eliane'),
	('Vanusa'),
	('Eduarda'),
	('Monique');


-- Inserir os valores da tabela bebê
insert into bebe (nome, data_nascimento, hora_nascimento, id_mae)
values 
	('Miguel', '01/03/2022', '14:00', 1),
	('Arthur', '27/03/2022', '01:00', 2),
	('Théo', '29/03/2022', '05:47', 3),
	('Heitor', '05/04/2022', '02:00', 4),
	('Gael', '05/04/2022', '02:00', 5),
	('Davi', '05/04/2022', '02:00', 6),
	('Bernardo', '06/05/2022', '08:00', 7),
	('Gabriel', '15/05/2022', '09:00', 8),
	('Ravi', '12/07/2022', '12:00', 9),
	('Noah', '24/07/2022', '16:00', 10),
	('Samuel', '25/07/2022', '16:00', 11),
	('Pedro', '26/07/2022', '10:00', 12),
	('Benício', '29/07/2022', '17:42', 13),
	('Benjamin', '29/07/2022', '18:11', 14),
	('Matheus', '01/08/2022', '11:11', 15),
	('Isaac', '01/08/2022', '11:11', 16),
	('Anthony', '05/08/2022', '11:12', 17),
	('Joaquim', '12/08/2022', '05:22', 18),
	('Lucas', '12/08/2022', '08:29', 19),
	('Lorenzo', '27/08/2022', '08:31', 20),
	('Nicolas', '28/09/2022', '13:16', 21),
	('Rafael', '27/08/2022', '13:14', 22),
	('Henrique', '30/08/2022', '19:01', 23),
	('Murilo', '30/08/2022', '23:59', 24),
	('João Miguel', '31/08/2022', '23:40', 25),
	('Lucca', '31/08/2022', '23:12', 26),
	('Guilherme', '31/08/2022', '10:12', 27),
	('Henry', '31/08/2022', '13:19', 28),
	('Bryan', '31/08/2022', '12:57', 29),
	('Caroline','08/09/2022','14:00:00',30),	('Iasmin','27/09/2022','01:00:00',31),	('Maíra','29/09/2022','05:47:00',32),	('Eloar','05/10/2022','02:00:00',35),	('Patrícia','05/11/2022','02:00:00',35);
	

-- Todas as bebês nascidas entre 01/06/2022 e 30/06/2022
select 
	b.nome as 'Nome do bebê',
	m.nome as 'Nome da mamãe',
	b.data_nascimento as 'Data nascimento'
	from bebe b, mamae m
		where b.data_nascimento
			between '2022-06-01' and '2022-06-30';

-- Todos os bebês por ordem alfabética 
select 
	b.nome as 'Nome do bebê',
	m.nome as 'Nome da mamãe',
	b.data_nascimento as 'Data nascimento'
	from bebe b, mamae m
		where
		b.id_mae = m.id
		and b.data_nascimento
			between '2022-05-01' and '2022-05-30'
	order by b.nome asc;

-- O bebê da mamãe Eloá
select 
	b.nome as 'Nome do bebê',
	m.nome as 'Nome da mamãe',
	b.data_nascimento as 'Data nascimento'
	from bebe b, mamae m
		where 
			b.id_mae = m.id
			and m.nome like 'eloá';

insert into mamae (nome)
values
('SEM MÃE');


select 
	b.nome as 'Nome do bebê',
	m.nome as 'Nome da mamãe',
	b.data_nascimento as 'Data de nascimento',
	b.hora_nascimento as 'Horário de nascimento'
	from bebe b, mamae m
		where
		b.id_mae = m.id
		and b.data_nascimento
			between '2022-05-01' and '2022-10-30' -- Até aqui tem 27 bebês com essas condições
		and b.id_mae is null; -- Aqui não encontrará nada pois não há bebê sem mãe


select 
	b.nome as 'Nome do bebê',
	m.nome as 'Nome da mamãe',
	b.data_nascimento as 'Data de nascimento'
	from bebe b, mamae m
		where
		b.id_mae = m.id
	order by b.nome,m.nome asc;


select 
	b.nome as 'Nome do bebê',
	b.hora_nascimento as 'Horário do Nascimento'
	from bebe b
	order by b.hora_nascimento asc;


select 
	b.nome as 'Nome do bebê',
	b.data_nascimento as 'Data de nascimento',
	b.hora_nascimento as 'Horário de nascimento',
	m.id as 'Id da mãe',
	m.nome as 'Nome da mãe'
	from bebe b, mamae m
		where
		b.id_mae = m.id
		and (b.hora_nascimento between '22:00:00.0000000' and '05:00:00.0000000'
		or b.hora_nascimento between '00:00:00.0000000' and '05:23:00.0000000')
		and b.id_mae = '35';

-- Pulamos a penúltima


select 
	m.nome as 'Nome da mamãe',
	b.nome as 'Nome do bebê',
	CONVERT(varchar,b.data_nascimento) + '    ' + CONVERT(varchar,b.hora_nascimento) as 'Data de nascimento e Horário'
	from bebe b, mamae m
		where
		b.id_mae = m.id
		and b.data_nascimento
			between '2022-05-01' and '2022-07-30'
		order by b.data_nascimento asc;



-- update bebe set id_mae = 18 where id = 18;