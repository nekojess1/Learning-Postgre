CREATE FUNCTION inserir_dados(nome_user Varchar(50), apelido_user varchar(15), idade_user integer)
RETURNS TEXT AS $$
BEGIN 
	INSERT INTO usuarios_table(nome, apelido,idade)
	VALUES(nome_user, apelido_user, idade_user);
	RETURN 'DADOS CADASTRADOS.';
END;
$$ LANGUAGE plpgsql;

