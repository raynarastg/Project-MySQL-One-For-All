SELECT history.reproduction_history AS nome,
COUNT(history.reproduction_date) AS reproducoes
FROM SpotifyClone.users 
INNER JOIN SpotifyClone.history ON history.user_id = users.user_id
INNER JOIN SpotifyClone.musics ON history.music_id = musics.music_id
INNER JOIN SpotifyClone.signature ON signature.signature_id = users.signature_id
WHERE signature.plan = 'gratuito' OR signature.plan = 'pessoal'
GROUP BY nome ORDER BY nome;