CREATE OR REPLACE FUNCTION TACOMESTIVEL(id_f integer)
RETURNS text AS $$
DECLARE
	datas_gravar record;y
BEGIN 
	FOR datas_gravar in SELECT * FROM DOCES_DA_JESS where id = id_f LOOP
		
		if  datas_gravar.validade >= CURRENT_DATE THEN
			return 'BE HAPPY.';
		ELSE
			return 'Jogue fora';
		end if;
	END LOOP;
END;
$$LANGUAGE plpgsql;
SELECT TACOMESTIVEL(1);

UPDATE DOCES_DA_JESS set validade = '11-18-2019'::date where id = 1



