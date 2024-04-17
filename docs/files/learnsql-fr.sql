
-- Un commentaire commence par deux traits d'union. Chaque commande se termine par un point-virgule.

-- Le langage SQL n'est pas sensible à la casse, pour les mots-clés.
-- Les exemples de commandes présentés ici respectent la convention de nommage
-- (mots-clé en majuscule, nom en minuscule) afin de permettre une meilleure lecture.

-- Crée et supprime une base de données. Les noms des bases de données et des tables sont sensibles à la casse.
CREATE DATABASE someDatabase;
DROP DATABASE someDatabase;

-- Liste les bases de données disponibles.
SHOW DATABASES;

-- Utilise une base de données existante spécifique.
USE employees;

-- Sélectionne toutes les colonnes et lignes de la table departments, de la base de données actuelle.
-- Par défaut, l'interprète SQL fera défiler les résultats sur votre écran.
SELECT * FROM departments;

-- Récupère les colonnes dept_no et dept_name, de toutes les lignes, de la table departments.
-- Une commande peut être sur plusieurs lignes.
SELECT dept_no,
       dept_name FROM departments;

-- Récupère toutes les colonnes, et 5 lignes de la table departments.
SELECT * FROM departments LIMIT 5;

-- Récupère les valeurs de la colonne dept_name de la table departments
-- dont la valeur dept_name contient la chaîne de caractères 'en'.
SELECT dept_name FROM departments WHERE dept_name LIKE '%en%';

-- Récupère toutes les colonnes de la table departments
-- dont la colonne dept_name commence par un 'S' et est suivie d'exactement 4 caractères.
SELECT * FROM departments WHERE dept_name LIKE 'S____';

-- Sélectionne les valeurs uniques title, sans doublons, dans la table titles
SELECT DISTINCT title FROM titles;

-- Identique qu'au-dessus, mais trie (sensible à la casse) selon les valeurs title.
SELECT DISTINCT title FROM titles ORDER BY title;

-- Indique le nombre de lignes dans la table departments.
SELECT COUNT(*) FROM departments;

-- Indique le nombre de lignes de la table departments
-- qui ont 'en' comme sous-chaîne de la valeur dept_name.
SELECT COUNT(*) FROM departments WHERE dept_name LIKE '%en%';

-- Une jointure (JOIN) permet de réunir des informations de plusieurs tables.
-- La table titles contient l'intitulé de poste (title), le numéro d'employé (emp_no),
-- de quelle date (from_date) à quelle date (to_date).
-- Plutôt que d'afficher le numéro d'employé, nous allons l'utiliser comme référence croisée
-- pour récupérer le nom et le prénom de chaque employé, depuis la table employees.
-- (Affiche seulement 10 lignes)

SELECT employees.first_name, employees.last_name,
       titles.title, titles.from_date, titles.to_date
FROM titles INNER JOIN employees ON
       employees.emp_no = titles.emp_no
LIMIT 10;

-- Liste toutes les tables, de toutes les bases de données. 
-- Les implémentations SQL fournissent généralement leur propre commande de raccourci
-- pour effectuer cette opération avec la base de données actuellement utilisée.
SELECT * FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE='BASE TABLE';

-- Crée une table appelée tablename1, avec les deux colonnes indiquées, dans la base de données actuellement utilisée.
-- De nombreuses autres options sont disponibles pour spécifier les colonnes, telles que le type de donnée (VARCHAR etc.)
CREATE TABLE tablename1 (fname VARCHAR(20), lname VARCHAR(20));

-- Insère une ligne de données dans la table tablename1.
-- Cela suppose que la table a été défini de manière à accepter les valeurs appropriées.
INSERT INTO tablename1 VALUES('Richard','Mutt');

-- Dans tablename1, remplace la valeur fname par "John"
-- pour toutes les lignes dont la valeur lname est "Mutt".
UPDATE tablename1 SET fname='John' WHERE lname='Mutt';

-- Supprime les lignes de la table tablename1 
-- dont la valeur lname commence par 'M'.
DELETE FROM tablename1 WHERE lname LIKE 'M%';

-- Supprime toutes les lignes de la table tablename1, en laissant la table vide.
DELETE FROM tablename1;

-- Supprime entièrement la table tablename1
DROP TABLE tablename1;

