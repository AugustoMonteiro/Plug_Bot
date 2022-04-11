select
	count(especies.descricao) as qtd_por_especie,
	especies.descricao as especie,
	sum(caixa_especies.valor_pago) as totais

from caixa_especies 
	full join especies on caixa_especies.especie = especies.codigo

where
	to_char(caixa_especies.datahora,'mm/yyyy') = to_char(current_date, 'mm/yyyy')
	
group by 
	especies.descricao
	
order by 
	totais