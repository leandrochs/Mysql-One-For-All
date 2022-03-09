SELECT 
	u.nome_usuario AS usuario,
    COUNT(h.cancao_id) AS qtde_musicas_ouvidas,
    ROUND(SUM(c.duracao_segundos)/60, 2) AS total_minutos
FROM 
	SpotifyClone.usuarios u
INNER JOIN
    SpotifyClone.historicos h ON u.usuario_id = h.usuario_id
INNER JOIN
    SpotifyClone.cancoes c ON h.cancao_id = c.cancao_id
GROUP BY u.usuario_id
ORDER BY nome_usuario;
