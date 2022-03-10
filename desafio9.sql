SELECT
	COUNT(h.cancao_id) AS quantidade_musicas_no_historico
FROM
	SpotifyClone.usuarios u
	INNER JOIN SpotifyClone.historicos h ON h.usuario_id = u.usuario_id
WHERE
	nome_usuario = "Bill";
	