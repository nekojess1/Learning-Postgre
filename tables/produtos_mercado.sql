CREATE TABLE PRODUTOS(
	id serial primary key,
	descricao varchar(50),
	quantidade integer,
	valor numeric(10,2),
	categoria_id integer,
	validade date)
	