SELECT
	c.nome_cancao AS cancao,
    COUNT(h.cancao_id) AS reproducoes
FROM
	SpotifyClone.cancoes c
LEFT JOIN
	SpotifyClone.historicos h 
ON
	c.cancao_id = h.cancao_id
GROUP BY
	nome_cancao
ORDER BY
	reproducoes DESC,
    nome_cancao
LIMIT 2;
