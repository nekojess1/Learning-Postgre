# Conhecimentos básicos em postgreSQL

##### A great song :sound: [click here](https://www.youtube.com/watch?v=KVjBCT2Lc94)

#### Comandos básicos: 

##### UPDATE: Atualiza dados em determinada tabela.
###### Estrutura de um UPDATE:
      UPDATE table_name 
      SET column_name = value
      WHERE condition;
      
##### SELECT: Seleciona dados em determinada tabela.
###### Estrutura de um SELECT:
      SELECT column_name 
      FROM table_name;

Observações: Podemos colocar um * no lugar de column_name
para selecionar todos os dados da tabela.

##### INSERT: Insere determinados dados em determinada tabela.
###### Estrutura de um INSERT:
      INSERT into table_name(column1) 
      VALUES (value1);
 

##### DELETE: Deleta determinados dados em determinada tabela.
###### Estrutura de um DELETE:
      DELETE FROM table_name 
      WHERE CONDITION;
    
##### CREATE TABLE: Cria uma tabela, no qual os dados podem ser armazenados.
###### Estrutura de um CREATE TABLE:
      CREATE TABLE (
      column1 data type);
      
##### ALTER TABLE: Altera dados de uma tabela.
###### Estrutura de um ALTER TABLE:
      ALTER TABLE table_name
      ACTION* 
      
Observações: Poderá ocorrer diversas ações, sendo alguns exemplos: rename, add, alter e etc.

###### Exemplo:
      ALTER TABLE table_name
      ADD COLUMN column_name data type;
      
##### JOIN: Faz a união entre os dados das tabelas selecionadas.
###### Estrutura de um JOIN:
      SELECT * 
      FROM table_name
      JOIN table_name2 on (condition)

###### Exemplo:
      CREATE VIEW validade_e_produto as
      SELECT descricao, quantidade, valor,
      (valor*quantidade) as valor_total, 
      validade, categoria_produto.nome as
      categorias, ehvalido(produtos.id)      -- Esse ehvalido foi uma função criada por mim
      FROM produtos 
      INNER JOIN categoria_produto 
      ON produtos.categoria_id = categoria_produto.id;
      
      
##### CREATE FUNCTION: Cria uma função, que pode automatizar diversas ações.
###### Estrutura de um CREATE FUNCTION:
      CREATE FUNCTION nome(param1 datatype)
      RETURNS data type
      AS $$
      BEGIN
      (Aqui você escreve a ação da função)
      END;
      $$ LANGUAGE plpgsql;
      
##### CREATE VIEW: Cria uma view, que auxilia na visualização dos nossos dados de determinada forma, não precisamos de ter que criar o mesmo select diversas vezes, salvamos ele como uma view.
###### Estrutura de um CREATE VIEW:
      CREATE VIEW view_name
      AS SELECT *
      FROM table_name
      WHERE column_name = 'name';
      
##### CREATE TRIGGER: Uma trigger será associada com um tabela específica ou view, e vai executar uma específica função quando determinado evento acontecer.
###### Estrutura de um CREATE TRIGGER:
      CREATE [ CONSTRAINT ] TRIGGER name { BEFORE | AFTER | INSTEAD OF } { event [ OR ... ] }
      ON table
      [ FROM referenced_table_name ]
      [ NOT DEFERRABLE | [ DEFERRABLE ] { INITIALLY IMMEDIATE | INITIALLY DEFERRED } ]
      [ FOR [ EACH ] { ROW | STATEMENT } ]
      [ WHEN ( condition ) ]
      EXECUTE PROCEDURE function_name ( arguments )
      
###### Exemplo:
      CREATE TRIGGER exclusao_cliente
      AFTER DELETE    		    -- Será executada depois de deletar
      on cliente      		    -- Na tabela cliente             
      FOR EACH ROW	          -- Vai executar para cada linha dentro da tabela
      EXECUTE 
      PROCEDURE salvaexcluido();  -- Executará a função salvaexcluido()
      
      
      
#### Extra: Utilizem Jasper Reports para gerar relatórios sobre as tabelas do seu banco. :) 
