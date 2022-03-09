SELECT
	COUNT(DISTINCT(c.nome_cancao)) AS cancoes,
	COUNT(DISTINCT(ar.nome_artista)) AS artistas,
  COUNT(DISTINCT(al.nome_album)) AS albuns
FROM
	SpotifyClone.cancoes c,
	SpotifyClone.artistas ar,
	SpotifyClone.albuns al;
