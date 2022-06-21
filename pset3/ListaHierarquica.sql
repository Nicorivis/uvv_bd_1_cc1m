WITH RECURSIVE FINAL AS(
SELECT
		codigo_pai, codigo, nome,  cast(nome AS text) AS lista
FROM classificacao c
WHERE codigo_pai IS NULL
UNION ALL
SELECT
		c.codigo_pai, c.codigo, f.nome,  cast(f.lista || ' → ' || c.nome AS text) AS lista
FROM classificacao c
INNER JOIN FINAL f ON f.codigo = c.codigo_pai)
SELECT lista, codigo_pai
FROM FINAL f
ORDER BY lista;