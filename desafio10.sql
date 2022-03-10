SELECT
	c.nome_cancao AS nome,
	COUNT(c.nome_cancao) AS reproducoes
FROM
	SpotifyClone.usuarios u
	INNER JOIN SpotifyClone.planos p ON p.plano_id = u.plano_id
	AND p.nome_plano IN("gratuito", "pessoal")
	INNER JOIN SpotifyClone.historicos h ON h.usuario_id = u.usuario_id
	INNER JOIN SpotifyClone.cancoes c ON c.cancao_id = h.cancao_id
GROUP BY
	nome_cancao
ORDER BY
	nome_cancao;
