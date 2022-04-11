select  sum(b.total_pedido_bruto) as total, count(p.ordem) as quantidade_pedido, c.nome from cabecalho_ordem_servico p 
inner join clientes c on p.cliente = c.codigo 
inner join  cabecalho_ordem_servico_totais b on p.ordem = b.ordem 
where to_char(p.dataordem,'yyyy') = to_char(current_date, 'yyyy')
group by c.nome 
order by total desc
limit 10 