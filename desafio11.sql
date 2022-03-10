SELECT
  nome_cancao AS nome_musica,
  replace(
    replace(
      replace(
        replace(
          replace(nome_cancao, 'Streets', 'Code Review'),
          'Her Own',
          'Trybe'
        ),
        'Inner Fire',
        'Project'
      ),
      'Silly',
      'Nice'
    ),
    'Circus',
    'Pull Request'
  ) AS novo_nome
FROM
  SpotifyClone.cancoes
WHERE
  LOCATE('Streets', nome_cancao)
  OR LOCATE('Her Own', nome_cancao)
  OR LOCATE('Inner Fire', nome_cancao)
  OR LOCATE('Silly', nome_cancao)
  OR LOCATE('Circus', nome_cancao)
ORDER BY
  nome_cancao;
