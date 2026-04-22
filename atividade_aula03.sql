-- ATIVIDADE AULA 03 - COM DADOS REAIS

-- 1. Popular tabelas
INSERT INTO artistas_caju (nome) VALUES
('Taylor Swift'),
('Drake'),
('Anitta'),
('The Weeknd'),
('Bruno Mars');

-- Álbuns reais associados
INSERT INTO albuns_caju (titulo, artista_id, preco) VALUES
('Midnights', 1, 20.00),
('Scorpion', 2, 25.00),
('Versions of Me', 3, 22.00);

-- Faixas reais
INSERT INTO faixas_caju (titulo, album_id, duracao) VALUES
('Lavender Haze', 1, 180),
('Anti-Hero', 1, 200),
('Gods Plan', 2, 210);

--------------------------------------------------

-- 2. Atualizações
UPDATE artistas_caju
SET nome = 'Anitta (Atualizada)'
WHERE nome = 'Anitta';

UPDATE albuns_caju
SET preco = preco + 5
WHERE titulo = 'Midnights';

UPDATE faixas_caju
SET duracao = duracao + 30
WHERE titulo = 'Lavender Haze';

--------------------------------------------------

-- 3. Remoção (vai dar erro por causa do relacionamento)
DELETE FROM artistas_caju 
WHERE nome = 'Taylor Swift';

-- Forma correta (ordem hierárquica)
DELETE FROM faixas_caju WHERE album_id = 1;
DELETE FROM albuns_caju WHERE artista_id = 1;
DELETE FROM artistas_caju WHERE id = 1;

--------------------------------------------------

-- 4. DESAFIO
INSERT INTO artistas_caju (nome)
SELECT name
FROM Artist
LIMIT 3
RETURNING *;