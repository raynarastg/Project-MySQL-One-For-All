SELECT artist.artist_name AS artista,
albuns.album_name AS album,
COUNT(following.user_id) AS seguidores
FROM SpotifyClone.artist INNER JOIN SpotifyClone.albuns ON artist.artist_id = albuns.artist_id
INNER JOIN SpotifyClone.following ON following.artist_id = artist.artist_id
GROUP BY artista, album ORDER BY seguidores DESC, artista, album;
