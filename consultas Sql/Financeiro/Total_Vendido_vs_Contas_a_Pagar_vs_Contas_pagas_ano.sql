select 
    'Total Vendido' as label,
	to_char(p.dataordem,'mm/yyyy') as bar,
	(sum(total_pedido_bruto)) as value


from cabecalho_ordem_servico_totais b 

inner join cabecalho_ordem_servico p on p.ordem = b.ordem 


where to_char(p.dataordem,'yyyy') = to_char(current_date, 'yyyy')
and p.status = 'F'

group by 
  bar
 
union all 
  
select  
 	'Contas a pagar' as label,
	to_char(vencimento,'mm/yyyy') as bar,
 	sum(apagar.valor) as value
	
	from apagar
	full join apagar_quitadas on apagar.codigo = apagar_quitadas.parcela  
	
	where
	to_char(vencimento, 'yyyy') = to_char(current_date, 'yyyy')  
	and 
	to_char(vencimento, 'mm/yyyy') <= to_char(current_date, 'mm/yyyy')
group by 
		bar

union all 

select 
	
	'Contas pagas' as label,
	to_char(data_pgto,'mm/yyyy') as bar,
	sum(valor_pago) as value
	
	from apagar_quitadas

	where 
	to_char(data_pgto, 'yyyy') = to_char(current_date,'yyyy')
	
	
	group by 
		bar
		
  

  