SELECT
	MIN(p.valor_plano) AS faturamento_minimo,
	MAX(p.valor_plano) AS faturamento_maximo,
  ROUND( SUM(p.valor_plano) / COUNT(u.nome_usuario), 2 ) AS faturamento_medio,
  SUM(p.valor_plano) AS faturamento_total
FROM SpotifyClone.usuarios u
RIGHT JOIN SpotifyClone.planos p
ON u.plano_id = p.plano_id;
