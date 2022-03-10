SELECT
	ar.nome_artista AS artista,
    al.nome_album AS album,
    COUNT(se.usuario_id) AS seguidores
FROM
	SpotifyClone.artistas ar
LEFT JOIN
	SpotifyClone.albuns al ON ar.artista_id = al.artista_id
RIGHT JOIN 
	SpotifyClone.seguindo_artistas se ON se.artista_id = ar.artista_id
GROUP BY
	nome_artista,
	nome_album
ORDER BY
	seguidores DESC,
    artista,
    album;
