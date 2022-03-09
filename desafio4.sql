SELECT
    u.nome_usuario AS 'usuario',
    IF( MAX( YEAR(h.data_reproducao) ) > '2020', 'Usuário ativo', 'Usuário inativo') AS 'condicao_usuario'
FROM
    SpotifyClone.usuarios u
LEFT JOIN
    SpotifyClone.historicos h
ON u.usuario_id = h.usuario_id
GROUP BY nome_usuario
ORDER BY nome_usuario;
