CREATE OR REPLACE FUNCTION ehvalido(id_f integer)
RETURNS text AS $$
DECLARE
	datas_gravar record;
BEGIN 
	FOR datas_gravar in SELECT * FROM PRODUTOS where id = id_f LOOP
		
		if  datas_gravar.validade >= CURRENT_DATE THEN
			return 'Produto dentro da validade.';
		ELSE
			return 'Jogue fora!';
		end if;
	END LOOP;
END;
$$LANGUAGE plpgsql;

