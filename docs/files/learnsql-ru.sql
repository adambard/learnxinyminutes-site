
-- Комментарии начинаются с двух дефисов. Завершайте каждую команду
-- точкой с запятой.

-- SQL не учитывает регистр букв для ключевых слов. Примеры команд здесь
-- следуют соглашению о написании в верхнем регистре, потому что
-- это позволяет легче отличить их от имён баз, таблиц и колонок.

-- Создание и удаление базы данных. Имена базы и таблицы чувствительны
-- к регистру букв.
CREATE DATABASE someDatabase;
DROP DATABASE someDatabase;

-- Список доступных баз.
SHOW DATABASES;

-- Выбор базы для работы.
USE employees;

-- Выбрать все строки и колонки из таблицы «departments» (отделы) текущей базы.
-- В интерактивном режиме обычно результат будет выведен на экран.
SELECT * FROM departments;

-- Тот же запрос, что и выше, но выбор только колонок «dept_no» и «dept_name».
-- Разбиение команд на несколько строк допустимо.
SELECT dept_no,
       dept_name FROM departments;

-- В данном случае будут выбраны все колонки, но только первые 5 строк.
SELECT * FROM departments LIMIT 5;

-- Выбор названий отделов, содержащих подстроку «en».
SELECT dept_name FROM departments WHERE dept_name LIKE '%en%';

-- Выбор всех колонок, где названия отделов начинаются на «S»,
-- после которой идёт ровно четыре символа.
SELECT * FROM departments WHERE dept_name LIKE 'S____';

-- Выбор всех должностей из таблицы «titles», но без повторений.
SELECT DISTINCT title FROM titles;

-- В дополнение к предыдущему запросу результат будет отсортирован
-- в алфавитном порядке (с учётом регистра).
SELECT DISTINCT title FROM titles ORDER BY title;

-- Показать число строк в таблице отделов.
SELECT COUNT(*) FROM departments;

-- Показать число строк, где название отдела содержит подстроку «en»
SELECT COUNT(*) FROM departments WHERE dept_name LIKE '%en%';

-- Объединение информации из нескольких таблиц:
-- В таблице «titles» перечислены должности, кто их занимал по номеру сотрудника,
-- а также с какой даты по какую. Получим эту информацию, но используем номера
-- сотрудников как ссылку на таблицу «employees», чтобы получить имя и фамилию
-- каждого сотрудника. Выводим только 10 строк.
SELECT employees.first_name, employees.last_name,
       titles.title, titles.from_date, titles.to_date
FROM titles INNER JOIN employees ON
       employees.emp_no = titles.emp_no LIMIT 10;

-- Список всех таблиц во всех базах. Реализации обычно предоставляют
-- собственные сокращения, чтобы показать все таблицы текущей базы.
SELECT * FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE='BASE TABLE';

-- Создать таблицу с именем tablename1 и двумя колонками в текущей базе.
-- Для колонок имеется множество параметров, таких как тип данных.
CREATE TABLE tablename1 (fname VARCHAR(20), lname VARCHAR(20));

-- Вставляем строку данных в таблицу «tablename1». Предполагаем, что таблица
-- настроена таким образом, чтобы принимать эти значения.
INSERT INTO tablename1 VALUES('Richard','Mutt');

-- В таблице «tablename1» изменить значение fname на «John»
-- для каждой строки, где колонка lname равна «Mutt».
UPDATE tablename1 SET fname='John' WHERE lname='Mutt';

-- Удалить из таблицы «tablename1» строки,
-- где значение колонки lname начинается с «M».
DELETE FROM tablename1 WHERE lname like 'M%';

-- Удалить все строки из таблицы «tablename1». В итоге получим пустую таблицу.
DELETE FROM tablename1;

-- Удалить таблицу «tablename1» полностью.
DROP TABLE tablename1;

