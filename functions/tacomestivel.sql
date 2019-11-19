CREATE OR REPLACE FUNCTION TACOMESTIVEL(id_f integer)
RETURNS text AS $$
DECLARE
	mes_atual integer;
	mes_validade integer;
	dia_atual integer;
	dia_validade integer;
	datas_gravar RECORD;
	validade integer;
BEGIN 
	validade = 0;
	FOR datas_gravar in SELECT * FROM DOCES_DA_JESS where id = id_f LOOP
		mes_atual = to_number(substring('2000-11-12',6,2), '99');
		mes_validade = to_number(substring(to_char(datas_gravar.validade, 'DD MM YYYY'),3,4),'99');
		dia_atual = to_number(substring('2000-11-12',9,2), '99');
		dia_validade = to_number(substring(to_char(datas_gravar.validade, 'DD MM YYYY'),1,4),'99');
		raise notice '% e %', mes_atual, mes_validade;
		raise notice '% e %', dia_atual, dia_validade;

		if  mes_atual > mes_validade
			then 	raise notice '% a', validade;
				validade = 1;
			elsif mes_validade = mes_atual and dia_atual>dia_validade
				then 	raise notice '% b', validade;
				validade = 1;
			elsif mes_validade = mes_atual and dia_atual<dia_validade
				then 	raise notice '% c', validade;
				validade=0;
		end if;
	END LOOP;
	if validade = 0
			then return 'Está comestível.';
		elsif validade = 1
			then return 'Passou da validade.';
		end if;
END;
$$LANGUAGE plpgsql;
-- A função ainda não tá pronta, e tá bem feia 
-- É para entrar no parâmetro com a data atual, para ver os doces comestíveis do dia. 
-- Não fiz comparação com a data de fabricação, pois podem inserir uma data anterior a fabricação
-- ex de chamada da função: SELECT NOME, PRECO, VALIDADE, FABRICACAO, TACOMESTIVEL(ID) from DOCES_DA_JESS;
-- tabela DOCES_DA_JESS nesse link aq: https://github.com/nekojess1/Learning-PostgreSQL/blob/master/tables/doces_da_jess.sql
