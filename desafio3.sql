SELECT users.user_name AS usuario,
COUNT(reproduction_history) AS qt_de_musicas_ouvidas,
ROUND(SUM(duration_seconds / 60), 2) AS total_minutos
FROM SpotifyClone.users INNER JOIN SpotifyClone.history ON history.user_id = users.user_id
INNER JOIN SpotifyClone.musics ON history.music_id = musics.music_id
GROUP BY usuario ORDER BY usuario;
