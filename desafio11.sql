SELECT musics.music AS nome_musica,
CASE 
WHEN music LIKE '%Bard%' THEN REPLACE(music, 'Bard', 'QA')
WHEN music LIKE '%Amar%' THEN REPLACE(music, 'Amar', 'Code Review')
WHEN music LIKE '%Pais' THEN REPLACE(music, 'Pais', 'Pull Requests')
WHEN music LIKE '%SOUL' THEN REPLACE(music, 'SOUL', 'CODE')
WHEN music LIKE '%SUPERSTAR' THEN REPLACE(music, 'SUPERSTAR', 'SUPERDEV')
END AS novo_nome
FROM SpotifyClone.musics
GROUP BY nome_musica, novo_nome 
HAVING nome_musica <> novo_nome
ORDER BY nome_musica DESC;