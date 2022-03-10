SELECT
	ar.nome_artista AS artista,
	al.nome_album AS album
FROM
	SpotifyClone.artistas ar
	INNER JOIN SpotifyClone.albuns al ON ar.artista_id = al.artista_id
WHERE
	nome_artista = "Walter Phoenix"
ORDER BY
	album;
