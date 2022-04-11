---Contas pagas e a pagar

 select  
 
	replace(to_char(vencimento,'dd/mm'),to_char(vencimento,'dd/'),'Contas à pagar no mês: ') as Mês,
	
 		sum(apagar.valor) - sum(apagar_quitadas.valor_pago) as valor
	
	from apagar
	full join apagar_quitadas on apagar.codigo = apagar_quitadas.parcela  
	
	where
	to_char(vencimento, 'mm/yyyy') = to_char(current_date, 'mm/yyyy')  
	
	group by 
		Mês
		
union 


select 
	
	replace(to_char(data_pgto, 'dd/mm'),to_char(data_pgto, 'dd/'),'Contas pagas no mês: ') as Mês,
	sum(valor_pago) as valor
	
	from apagar_quitadas

	where 
	to_char(data_pgto, 'mm/yyyy') = to_char(current_date,'mm/yyyy')
	
	
	group by 
		Mês


union

select  
 
   'Total de contas' as label,
	
 		sum(apagar.valor) - sum(apagar_quitadas.valor_pago) as value
	
	from apagar
	full join apagar_quitadas on apagar.codigo = apagar_quitadas.parcela  
	
	where
	to_char(vencimento, 'mm/yyyy') = to_char(current_date, 'mm/yyyy')  

group by 
	label