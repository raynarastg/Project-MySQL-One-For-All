SELECT COUNT(*) AS cancoes,
(SELECT COUNT(*) FROM SpotifyClone.artist) AS artistas,
(SELECT COUNT(*) FROM SpotifyClone.albuns) AS albuns
FROM SpotifyClone.musics;
