select
	
	replace(to_char(data_fechamento,'dd/mm'),to_char(data_fechamento,'dd/mm'),'Vendas até R$ 50,00: ') as label,
	count(data_fechamento) as value,
	sum(cabecalho_ordem_servico_totais.total_pedido) / count(data_fechamento) as bar
	
	
	from cabecalho_ordem_servico
	full join cabecalho_ordem_servico_totais on cabecalho_ordem_servico.ordem = cabecalho_ordem_servico_totais.ordem 
	
where
	to_char(data_fechamento,'mm/yyyy') = to_char(current_date, 'mm/yyyy') and 
	status <> 'C' 
	and 
	cabecalho_ordem_servico_totais.total_pedido <= '50.00'
	
group  by
	label


union all


select
	
	replace(to_char(data_fechamento,'dd/mm'),to_char(data_fechamento,'dd/mm'),'Vendas de R$ 50,01 até R$ 100,00: ') as label,
	count(data_fechamento) as value,
	sum(cabecalho_ordem_servico_totais.total_pedido) / count(data_fechamento) as bar
	
	
	from cabecalho_ordem_servico
	full join cabecalho_ordem_servico_totais on cabecalho_ordem_servico.ordem = cabecalho_ordem_servico_totais.ordem 
	
where
	to_char(data_fechamento,'mm/yyyy') = to_char(current_date, 'mm/yyyy') and 
	status <> 'C' 
	and 
	cabecalho_ordem_servico_totais.total_pedido > '50.00' and cabecalho_ordem_servico_totais.total_pedido <= '100.00'
	
group  by
	label
  
  
  
union all



select

	replace(to_char(data_fechamento,'dd/mm'),to_char(data_fechamento,'dd/mm'),'Vendas de R$ 100,01 até R$ 200,00: ') as label,
	count(data_fechamento) as value,
	sum(cabecalho_ordem_servico_totais.total_pedido) / count(data_fechamento) as bar
	
	
	from cabecalho_ordem_servico
	full join cabecalho_ordem_servico_totais on cabecalho_ordem_servico.ordem = cabecalho_ordem_servico_totais.ordem 
	
where
	to_char(data_fechamento,'mm/yyyy') = to_char(current_date, 'mm/yyyy') and 
	status <> 'C' 
	and 
	cabecalho_ordem_servico_totais.total_pedido > '100.01' and cabecalho_ordem_servico_totais.total_pedido <= '200.00'
	
group  by
	label



 
union all





select
	
	replace(to_char(data_fechamento,'dd/mm'),to_char(data_fechamento,'dd/mm'),'Vendas de R$ 200,01 até R$ 500,00: ') as label,
	count(data_fechamento) as value,
	sum(cabecalho_ordem_servico_totais.total_pedido) / count(data_fechamento) as bar
	
	
	from cabecalho_ordem_servico
	full join cabecalho_ordem_servico_totais on cabecalho_ordem_servico.ordem = cabecalho_ordem_servico_totais.ordem 
	
where
	to_char(data_fechamento,'mm/yyyy') = to_char(current_date, 'mm/yyyy') and 
	status <> 'C' 
	and 
	cabecalho_ordem_servico_totais.total_pedido > '200.01' and cabecalho_ordem_servico_totais.total_pedido <= '500.00'
	
group  by
	label