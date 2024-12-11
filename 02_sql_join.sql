/* 
SQL Join query exercise

World database layout:
To use this database from a default MySQL install, type: use world;

Table: City
Columns: Id, Name, CountryCode, District, Population

Table: Country
Columns: Code, Name, Continent, Region, SurfaceArea, IndepYear, Population, LifeExpectancy, GNP, Capital

Table: CountryLanguage
Columns: CountryCode, Language, IsOfficial, Percentage
*/
USE WORLD;
-- 1: Get the cities with a name starting with ping sorted by their population with the least populated cities first
SELECT NAME FROM CITY WHERE NAME LIKE 'PING%' ORDER BY POPULATION ASC;


-- 2: Get the cities with a name starting with ran sorted by their population with the most populated cities first
SELECT NAME FROM CITY WHERE NAME LIKE 'RAN%' ORDER BY POPULATION DESC;


-- 3: Count all cities
SELECT COUNT(*) FROM CITY;


-- 4: Get the average population of all cities
SELECT AVG(POPULATION) FROM CITY;


-- 5: Get the biggest population found in any of the cities
SELECT MAX(POPULATION) FROM CITY;


-- 6: Get the smallest population found in any of the cities
SELECT MIN(POPULATION) FROM CITY;

-- 7: Sum the population of all cities with a population below 10000
SELECT SUM(POPULATION) FROM CITY WHERE POPULATION < 10000;

-- 8: Count the cities with the country codes MOZ and VNM
SELECT COUNT(*) FROM CITY WHERE COUNTRYCODE IN ('MOZ','VNM');


-- 9: Get individual count of cities for the country codes MOZ and VNM
SELECT COUNTRYCODE ,COUNT(NAME) FROM CITY GROUP BY  COUNTRYCODE HAVING COUNTRYCODE IN  ('MOZ','VNM');


-- 10: Get average population of cities in MOZ and VNM
SELECT AVG(POPULATION) FROM CITY WHERE COUNTRYCODE IN ('MOZ','VNM');

-- 11: Get the country codes with more than 200 cities
SELECT COUNTRYCODE  FROM CITY GROUP BY  COUNTRYCODE HAVING COUNT(*) > 200;

-- 12: Get the country codes with more than 200 cities ordered by city count
SELECT COUNTRYCODE ,COUNT(*) AS CNT FROM CITY GROUP BY  COUNTRYCODE HAVING CNT >200 ORDER BY CNT;


-- 13: What language(s) is spoken in the city with a population between 400 and 500?
SELECT LANGUAGE FROM COUNTRYLANGUAGE INNER JOIN CITY ON COUNTRYLANGUAGE.COUNTRYCODE=CITY.COUNTRYCODE WHERE POPULATION BETWEEN 400 AND 500;


-- 14: What are the name(s) of the cities with a population between 500 and 600 people and the language(s) spoken in them
SELECT COUNTRYLANGUAGE.LANGUAGE, CITY.NAME FROM COUNTRYLANGUAGE INNER JOIN CITY ON COUNTRYLANGUAGE.COUNTRYCODE=CITY.COUNTRYCODE WHERE POPULATION BETWEEN 500 AND 600; 

-- 15: What names of the cities are in the same country as the city with a population of 122199 (including that city itself)
SELECT C1.NAME FROM CITY C1  INNER JOIN CITY C2 ON C1.COUNTRYCODE=C2.COUNTRYCODE WHERE C2.POPULATION =122199;


-- 16: What names of the cities are in the same country as the city with a population of 122199 (excluding that city itself)
SELECT C1.NAME FROM CITY C1  INNER JOIN CITY C2 ON C1.COUNTRYCODE=C2.COUNTRYCODE WHERE C2.POPULATION =122199 AND C1.NAME != C2.NAME;


-- 17: What are the city names in the country where Luanda is the capital?
SELECT C1.NAME FROM CITY C1  INNER JOIN CITY C2 ON C1.COUNTRYCODE=C2.COUNTRYCODE WHERE C2.NAME='LUANDA';
SELECT CITY.NAME FROM CITY INNER JOIN COUNTRY ON CITY.COUNTRYCODE=COUNTRY.CODE WHERE  COUNTRY.CAPITAL=(SELECT ID FROM CITY WHERE NAME = 'LUANDA');


-- 18: What are the names of the capital cities in countries in the same region as the city named Yaren
SELECT CITY.NAME FROM CITY   INNER JOIN COUNTRY ON CITY.ID=COUNTRY.CAPITAL WHERE COUNTRY.REGION= (SELECT REGION FROM COUNTRY INNER JOIN CITY ON CITY.ID=COUNTRY.CAPITAL WHERE CITY.NAME='YAREN');

-- 19: What unique languages are spoken in the countries in the same region as the city named Riga
SELECT DISTINCT LANGUAGE FROM COUNTRYLANGUAGE INNER JOIN COUNTRY ON COUNTRYLANGUAGE.COUNTRYCODE=COUNTRY.CODE WHERE COUNTRY.REGION = (SELECT REGION FROM COUNTRY INNER JOIN CITY ON COUNTRY.CAPITAL=CITY.ID WHERE CITY.NAME='RIGA');

     
-- 20: Get the name of the most populous city
SELECT NAME FROM CITY ORDER BY POPULATION DESC LIMIT 1;


