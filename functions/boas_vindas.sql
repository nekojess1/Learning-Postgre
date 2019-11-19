CREATE OR REPLACE FUNCTION boas_vindas(nick Varchar(15))
RETURNS text AS $$
DECLARE 
	user_name	character varying(100);
	users_record	RECORD;
BEGIN 	
	FOR users_record in SELECT * FROM usuarios_table  LOOP
		IF users_record.apelido = nick
			THEN user_name = users_record.nome;
		END IF;
	END LOOP;
	RAISE NOTICE 'Pesquisa concluída';
	RETURN 'Olá ' || user_name || ', Seja bem vindx!';
END;
$$ LANGUAGE plpgsql;


-- A tabela usada nesas função foi a users_table, que se encontra em github.com/nekojess1/Learning-Postgre/tree/master/tables
