CREATE OR REPLACE FUNCTION salvaexcluido()
RETURNS trigger AS $$
BEGIN 
INSERT INTO bk_cliente values(old.Nome, old.Endereco, old.rg, old.cidade, old.estado);

RETURN NULL;
END;
$$
LANGUAGE plpgsql;

