CREATE VIEW validade_e_produto as
SELECT descricao, quantidade, valor,
(valor*quantidade) as valor_total, 
validade, categoria_produto.nome as
categorias, ehvalido(produtos.id)
from produtos 
inner join categoria_produto on produtos.categoria_id = categoria_produto.id;


