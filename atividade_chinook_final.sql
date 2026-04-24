-- ATIVIDADE AULA 04 - CHINOOK (COM MAIS ARTISTAS E ÁLBUNS)

-- Inserindo vários artistas reais
INSERT INTO Artist (Name)
VALUES 
('Taylor Swift'),
('Drake'),
('Anitta'),
('Rihanna'),
('BTS'),
('The Weeknd');

-- Inserindo vários álbuns reais
INSERT INTO Album (Title, ArtistId)
VALUES 
-- Taylor Swift
('1989', (SELECT ArtistId FROM Artist WHERE Name='Taylor Swift')),
('Midnights', (SELECT ArtistId FROM Artist WHERE Name='Taylor Swift')),
('Red', (SELECT ArtistId FROM Artist WHERE Name='Taylor Swift')),

-- Drake
('Scorpion', (SELECT ArtistId FROM Artist WHERE Name='Drake')),
('Views', (SELECT ArtistId FROM Artist WHERE Name='Drake')),
('Take Care', (SELECT ArtistId FROM Artist WHERE Name='Drake')),

-- Anitta
('Versions of Me', (SELECT ArtistId FROM Artist WHERE Name='Anitta')),
('Bang', (SELECT ArtistId FROM Artist WHERE Name='Anitta')),
('Kisses', (SELECT ArtistId FROM Artist WHERE Name='Anitta')),

-- Rihanna
('Anti', (SELECT ArtistId FROM Artist WHERE Name='Rihanna')),
('Loud', (SELECT ArtistId FROM Artist WHERE Name='Rihanna')),
('Unapologetic', (SELECT ArtistId FROM Artist WHERE Name='Rihanna')),

-- BTS
('Map of the Soul: 7', (SELECT ArtistId FROM Artist WHERE Name='BTS')),
('BE', (SELECT ArtistId FROM Artist WHERE Name='BTS')),
('Love Yourself: Tear', (SELECT ArtistId FROM Artist WHERE Name='BTS')),

-- The Weeknd
('After Hours', (SELECT ArtistId FROM Artist WHERE Name='The Weeknd')),
('Starboy', (SELECT ArtistId FROM Artist WHERE Name='The Weeknd')),
('Dawn FM', (SELECT ArtistId FROM Artist WHERE Name='The Weeknd'));

-- 1. ROLLBACK Deliberado
BEGIN;
DELETE FROM Album;
SELECT * FROM Album;
ROLLBACK;
SELECT * FROM Album;

-- 2. Transferência
BEGIN;
UPDATE Track
SET AlbumId = (SELECT AlbumId FROM Album WHERE Title='Scorpion')
WHERE AlbumId = (SELECT AlbumId FROM Album WHERE Title='1989');
COMMIT;

-- 3. Bloqueio (erro cancela tudo)
BEGIN;
INSERT INTO Album (Title, ArtistId)
VALUES ('Album Teste', (SELECT ArtistId FROM Artist WHERE Name='Taylor Swift'));

INSERT INTO Album (Title, ArtistId)
VALUES ('Album Erro', 999999);

COMMIT;

-- 4. Desafio (executar em duas abas)

-- Aba 1
BEGIN;
UPDATE Album
SET Title = 'Teste Bloqueio'
WHERE Title = '1989';

-- Aba 2 (rodar separado)
BEGIN;
UPDATE Album
SET Title = 'Outro Teste'
WHERE Title = '1989';

-- Depois voltar na Aba 1 e rodar:
COMMIT;
