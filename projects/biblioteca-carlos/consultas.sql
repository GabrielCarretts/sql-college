# 1. Todos os livros existentes na biblioteca, contendo título, gênero e preço

SELECT
    titulo,
    genero,
    preco
FROM livros
ORDER BY titulo ASC;

# 2. Apresente os livros juntamente com o nome de seus autores

SELECT
    l.titulo,
    a.nome AS autor
FROM livros AS l
INNER JOIN autores AS a
    ON l.autor_id = a.id_autor
ORDER BY a.nome ASC;

# 3. Mostre cada livro juntamente com sua respectiva editora

SELECT
    l.titulo,
    e.nome AS editora
FROM livros AS l
LEFT JOIN editoras AS e
    ON l.editora_id = e.id_editora
ORDER BY
    e.nome ASC,
    l.titulo ASC;

# 4. Identifique os cinco leitores que mais realizaram empréstimos.

SELECT
    l.nome,
    COUNT(e.id_emprestimo) AS total_emprestimos
FROM leitores AS l
INNER JOIN emprestimos AS e
    ON e.leitor_id = l.id_leitor
GROUP BY l.id_leitor
ORDER BY total_emprestimos DESC
LIMIT 5;

# 5. Identifique os cinco livros mais emprestados.

SELECT
    l.titulo AS livro,
    COUNT(e.id_emprestimo) AS total_emprestimos
FROM livros AS l
INNER JOIN emprestimos AS e
    ON e.livro_id = l.id_livro
GROUP BY l.id_livro
ORDER BY total_emprestimos DESC
LIMIT 5;

# 6. Descubra quais autores tiveram suas obras mais emprestadas.

SELECT
    a.nome AS autor,
    COUNT(e.id_emprestimo) AS total_emprestimos
FROM autores AS a
INNER JOIN livros AS l
    ON a.id_autor = l.autor_id
INNER JOIN emprestimos AS e
    ON l.id_livro = e.livro_id
GROUP BY a.id_autor
ORDER BY total_emprestimos DESC;

# 7. Descubra qual funcionário realizou o maior número de empréstimos.

SELECT
    f.nome AS nome_funcionario,
    COUNT(e.id_emprestimo) AS total_emprestimos
FROM funcionarios AS f
INNER JOIN emprestimos AS e
    ON f.id_funcionario = e.funcionario_id
GROUP BY f.id_funcionario
ORDER BY total_emprestimos DESC
LIMIT 1;

# 8. Apresente quanto cada leitor já gastou com empréstimos.

SELECT
    l.nome,
    COALESCE(
        SUM(p.valor_cobrado - COALESCE(p.desconto, 0)),
        0
    ) AS total_gasto
FROM leitores AS l
LEFT JOIN emprestimos AS e
    ON l.id_leitor = e.leitor_id
LEFT JOIN pagamentos AS p
    ON p.emprestimo_id = e.id_emprestimo
GROUP BY l.id_leitor
ORDER BY total_gasto DESC;

# 9. Descubra quanto a Biblioteca do Zé arrecadou no total.

SELECT
    COALESCE(
        SUM(valor_cobrado - COALESCE(desconto, 0)),
        0
    ) AS total_arrecadado
FROM pagamentos;

# 10. Apresente os leitores que gastaram mais do que a média de gastos dos leitores. Calculei a média dos leitores pagantes.

SELECT
    l.nome AS leitor,
    COALESCE(
        SUM(p.valor_cobrado - COALESCE(p.desconto, 0)),
        0
    ) AS total_gasto
FROM leitores AS l
LEFT JOIN emprestimos AS e
    ON l.id_leitor = e.leitor_id
LEFT JOIN pagamentos AS p
    ON p.emprestimo_id = e.id_emprestimo
GROUP BY l.id_leitor
HAVING total_gasto > (
    SELECT
        AVG(gastos.total_gasto)
    FROM (
        SELECT
            l2.id_leitor,
            COALESCE(
                SUM(p2.valor_cobrado - COALESCE(p2.desconto, 0)),
                0
            ) AS total_gasto
        FROM leitores AS l2
        LEFT JOIN emprestimos AS e2
            ON l2.id_leitor = e2.leitor_id
        LEFT JOIN pagamentos AS p2
            ON p2.emprestimo_id = e2.id_emprestimo
        GROUP BY l2.id_leitor
    ) AS gastos
    WHERE gastos.total_gasto > 0
)
ORDER BY total_gasto DESC;

# 11. Quais os leitores que possuem uma frequência de empréstimos acima da média dos demais leitores?

SELECT
    l.nome AS leitor,
    COUNT(e.id_emprestimo) AS total_emprestimos
FROM leitores AS l
INNER JOIN emprestimos AS e
    ON l.id_leitor = e.leitor_id
GROUP BY l.id_leitor
HAVING total_emprestimos > (
    SELECT
        AVG(frequencia.total_emprestimos)
    FROM (
        SELECT
            l2.id_leitor,
            COUNT(e2.id_emprestimo) AS total_emprestimos
        FROM leitores AS l2
        INNER JOIN emprestimos AS e2
            ON l2.id_leitor = e2.leitor_id
        GROUP BY l2.id_leitor
    ) AS frequencia
)
ORDER BY total_emprestimos DESC;

# 12. Qual gênero de leitor mais faz empréstimos?

SELECT
    CASE
        WHEN l.genero = 1 THEN 'Masculino'
        WHEN l.genero = 2 THEN 'Feminino'
        ELSE 'Não informado'
    END AS genero,
    COUNT(e.id_emprestimo) AS total_emprestimos
FROM leitores AS l
INNER JOIN emprestimos AS e
    ON l.id_leitor = e.leitor_id
GROUP BY l.genero
ORDER BY total_emprestimos DESC
LIMIT 1;

# 13. Localize os livros cuja quantidade de empréstimos seja superior à média de empréstimos por livro.

SELECT
    l.titulo AS livro,
    COUNT(e.id_emprestimo) AS total_emprestimos
FROM livros AS l
INNER JOIN emprestimos AS e
    ON l.id_livro = e.livro_id
GROUP BY l.id_livro
HAVING total_emprestimos > (
    SELECT
        AVG(contagem_livros.total_emprestimos)
    FROM (
        SELECT
            l2.id_livro,
            COUNT(e2.id_emprestimo) AS total_emprestimos
        FROM livros AS l2
        INNER JOIN emprestimos AS e2
            ON l2.id_livro = e2.livro_id
        GROUP BY l2.id_livro
    ) AS contagem_livros
)
ORDER BY total_emprestimos DESC;

# 14. Quais seriam os 5 melhores clientes da Biblioteca do Zé?

WITH gastos_clientes AS (
    SELECT
        l.id_leitor,
        l.nome,
        SUM(p.valor_cobrado - COALESCE(p.desconto, 0)) AS total_gasto
    FROM leitores AS l
    INNER JOIN emprestimos AS e
        ON l.id_leitor = e.leitor_id
    INNER JOIN pagamentos AS p
        ON e.id_emprestimo = p.emprestimo_id
    GROUP BY l.id_leitor
)
SELECT
    gastos_clientes.nome,
    gastos_clientes.total_gasto
FROM gastos_clientes
ORDER BY total_gasto DESC, nome ASC
LIMIT 5;