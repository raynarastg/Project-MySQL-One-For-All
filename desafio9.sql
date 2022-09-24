SELECT COUNT(history.music_id) AS quantidade_musicas_no_historico FROM SpotifyClone.users
 INNER JOIN SpotifyClone.history ON history.user_id = users.user_id
WHERE users.user_name = 'Barbara Liskov';