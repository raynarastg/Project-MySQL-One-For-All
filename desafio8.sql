SELECT  artist.artist_name AS artista,
albuns.album_name AS album 
FROM SpotifyClone.artist INNER JOIN SpotifyClone.albuns ON artist.artist_id = albuns.artist_id
WHERE artist.artist_name = 'Elis Regina'
ORDER BY album;