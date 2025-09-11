CREATE SCHEMA DESAFIO2;
USE DESAFIO2;

CREATE TABLE Livro(
ID INT NOT NULL,
Título VARCHAR(45) NOT NULL,
Ano_publicacao INT NOT NULL,
Categoria VARCHAR(45) NOT NULL,
primary key(ID));

CREATE TABLE Usuario(
ID_usuario INT NOT NULL,
Nome VARCHAR(45) NOT NULL,
Curso VARCHAR(45) NOT NULL,
Telefone VARCHAR(20) NOT NULL,
primary key(ID_usuario));

CREATE TABLE Emprestimo (
  ID_emprestimo INT PRIMARY KEY,
  ID_usuario INT,
  ID_livro INT,
  FOREIGN KEY(ID_usuario) REFERENCES Usuario(ID_usuario),
  FOREIGN KEY(ID_livro) REFERENCES Livro(ID)
);

INSERT INTO Livro VALUES
(1, 'Dom Casmurro', 1899, 'Romance'),
(2, 'O Cortiço', 1890, 'Romance'),
(3, 'Memórias Póstumas de Brás Cubas', 1881, 'Ficção'),
(4, 'Vidas Secas', 1938, 'Romance'),
(5, 'Capitães da Areia', 1937, 'Drama'),
(6, 'A Hora da Estrela', 1977, 'Romance'),
(7, 'Iracema', 1865, 'Romance'),
(8, 'Grande Sertão: Veredas', 1956, 'Romance'),
(9, 'O Guarani', 1857, 'Aventura'),
(10, 'Senhora', 1875, 'Romance');

INSERT INTO Usuario VALUES
(1, 'Ana Silva', 'Engenharia', 11999990001),
(2, 'Carlos Souza', 'Direito', 11999990002),
(3, 'Fernanda Lima', 'Medicina', 11999990003),
(4, 'Lucas Alves', 'História', 11999990004),
(5, 'Juliana Rocha', 'Administração', 11999990005),
(6, 'Pedro Martins', 'Ciência da Computação', 11999990006),
(7, 'Mariana Costa', 'Arquitetura', 11999990007),
(8, 'Rafael Gomes', 'Matemática', 11999990008),
(9, 'Beatriz Ferreira', 'Biologia', 11999990009),
(10, 'André Oliveira', 'Física', 11999990010);

INSERT INTO Emprestimo VALUES
(1, 1, 3), 
(2, 2, 1), 
(3, 3, 5); 

UPDATE Usuario 
SET Nome = 'Luis Fillipe'
WHERE ID_usuario = 1;

SELECT * FROM Usuario
WHERE Nome LIKE '%a';

SELECT * FROM Usuario
WHERE Nome LIKE 'L%';

SELECT SUM(ID_usuario)
FROM Usuario;

SELECT MAX(ID_usuario)
FROM Usuario;

SELECT Categoria, COUNT(*)
FROM Livro
GROUP BY Categoria;

SELECT Categoria, COUNT(*)
FROM Livro
GROUP BY Categoria
HAVING COUNT(*) < 3;

SELECT u.Nome AS Usuario, l.Título AS Livro
FROM Emprestimo e
INNER JOIN Usuario u ON e.ID_usuario = u.ID_usuario
INNER JOIN Livro l ON e.ID_livro = l.ID;

