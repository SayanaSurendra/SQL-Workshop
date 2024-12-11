/* 
SQL select query exercise

World database layout:
To use this database from a default MySQL install, type: use world;

Table: City
Columns: Id, Name, CountryCode, District, Population

Table: Country
Columns: Code, Name, Continent, Region, SurfaceArea, IndepYear, Population, LifeExpectancy, GNP, Capital

Table: CountryLanguage
Columns: CountryCode, Language, IsOfficial, Percentage
*/

-- 0: Get a query to return "Hello World", 123
-- (Hint: 1 row, 2 columns)
SELECT "hello world" as message , 123 as id;

USE WORLD;
-- 1: Get everything from the city table
-- (Hint: Many many rows)

SELECT * FROM CITY;


-- 2: Get everything on the cities whose district is "aceh"
-- (Hint: 2 rows)
SELECT * FROM CITY WHERE DISTRICT LIKE '%aceh%';

-- 3: Get only the name of the cities where the countrycode is "bfa"
SELECT NAME FROM CITY WHERE COUNTRYCODE='BFA';


-- 4: Get both the name and district of the cities where the countrycode is "tto"
SELECT  NAME, DISTRICT FROM CITY WHERE COUNTRYCODE='TTO';

-- 5: Get the name and district named as nm, dist from the cities where the countrycode is "arm"
SELECT  NAME as NM, DISTRICT AS DIST FROM CITY WHERE COUNTRYCODE='ARM';


-- 6: Get the cities with a name that starts with "bor"
SELECT * FROM CITY WHERE NAME LIKE 'BOR%';


-- 7: Get the cities with a name that contains the string "orto"

SELECT * FROM CITY WHERE NAME LIKE '%ORTO%';

-- 8: Get the cities that have a population below 1000
SELECT NAME FROM CITY WHERE POPULATION < 1000;


-- 9: Get the unique countrycodes from the cities that have a population below 1000
SELECT DISTINCT countrycodes FROM CITY WHERE POPULATION < 1000;


-- 10: Get the cities with the countrycode UKR that has more than 1000000 (one million) in population
SELECT NAME  FROM CITY WHERE COUNTRYCODE='UKR' AND POPULATION < 1000000;

-- 11: Get the cities with a population of below 200 or above 9500000 (9.5 million)
SELECT NAME  FROM CITY WHERE  POPULATION < 200 OR POPULATION >9500000;


-- 12: Get the cities with the countrycodes TJK, MRT, AND, PNG, SJM
SELECT NAME FROM CITY WHERE COUNTRYCODE IN ('TJK','MRT','AND','PNG','SJM');

-- 13: Get the cities with a population between 200 and 700 inclusive
SELECT NAME FROM CITY WHERE POPULATION BETWEEN 200 AND 700;


-- 14: Get the countries with a population between 8000 and 20000 inclusive
SELECT NAME FROM CICOUNTRY WHERE POPULATION BETWEEN 8000 AND 20000;


-- 15: Get the name of the countries with an independence year (indepyear) before year 0
SELECT NAME FROM COUNTRY WHERE INDEPYEAR <0;

-- 16: Get the countries that have no recorded independence year and a population above 1000000
SELECT NAME  FROM COUNTRY WHERE INDEPYEAR IS null AND POPULATION >1000000;

-- 17: Get countries with a SurfaceArea below 10 and a defined LifeExpectancy
SELECT NAME FROM COUNTRY WHERE SURFACEAREA < 10 AND LIFEEXPECTANCY IS NOT NULL;

