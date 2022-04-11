select  v.nome, sum(total_pedido_bruto) as total_vendido from  cabecalho_ordem_servico p
full join  cabecalho_ordem_servico_totais b on  p.ordem = b.ordem
full join  vendedores v ON v.codigo = p.vendedor 
where p.dataordem < current_timestamp and p.dataordem > current_timestamp - interval'7 DAYS'
and p.status = 'F'
group by v.nome
order by total_vendido