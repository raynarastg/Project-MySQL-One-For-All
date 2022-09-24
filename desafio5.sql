SELECT musics.music AS cancao,
COUNT(history.music_id) AS reproducoes
FROM SpotifyClone.musics INNER JOIN SpotifyClone.history ON history.music_id = musics.music_id
GROUP BY cancao ORDER BY reproducoes DESC, cancao LIMIT 2;