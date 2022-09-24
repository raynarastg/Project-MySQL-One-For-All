SELECT CONCAT ('',ROUND(MIN(signature.value_plan), 2), '.00') AS faturamento_minimo,
CONVERT(ROUND(MAX(signature.value_plan), 2), NCHAR) AS faturamento_maximo,
CONVERT(ROUND(AVG(signature.value_plan), 2), NCHAR) AS faturamento_medio,
CONVERT(ROUND(SUM(signature.value_plan), 2), NCHAR) AS faturamento_total
FROM SpotifyClone.signature
 INNER JOIN SpotifyClone.users ON signature.signature_id = users.signature_id;

--  font: https://www.w3schools.com/mysql/func_mysql_convert.asp