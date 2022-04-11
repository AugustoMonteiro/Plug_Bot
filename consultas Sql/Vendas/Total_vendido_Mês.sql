select (sum(total_pedido_bruto)) AS value from cabecalho_ordem_servico_totais b inner join cabecalho_ordem_servico p on p.ordem = b.ordem 
where to_char(p.dataordem,'mm') = to_char(current_date, 'mm')
and p.status = 'F'

