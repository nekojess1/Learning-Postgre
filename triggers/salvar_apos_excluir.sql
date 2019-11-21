CREATE TRIGGER exclusao_cliente
AFTER DELETE    		    -- Sera executado depois de deletar
on cliente      		    -- Na tabela cliente             
FOR EACH ROW			    -- Vai executar para cada linha dentro da tabela
EXECUTE 
PROCEDURE salvaexcluido();  -- Executar esse procedimento.

