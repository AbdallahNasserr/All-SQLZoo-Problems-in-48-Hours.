--SELECT within SELECT Tutorial

-- Bigger than Russia

-- List each country name where the population is larger than that of 'Russia'.
-- world(name, continent, area, population, gdp)

SELECT name 
FROM world 
WHERE population > (SELECT population 
                    FROM world 
                    WHERE name = 'Russia');


-- Richer than UK

-- Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.
-- Per Capita GDP
-- The per capita GDP is the gdp/population

SELECT name 
FROM world 
WHERE gdp/population > (SELECT gdp/population 
                        FROM world 
                        WHERE name = 'United Kingdom') 
  AND continent = 'Europe';


-- Neighbours of Argentina and Australia

-- List the name and continent of countries in the continents containing either Argentina or Australia.
-- Order by name of the country.

SELECT name, continent 
FROM world 
WHERE continent IN (SELECT continent 
                    FROM world 
                    WHERE name IN ('Argentina', 'Australia'))
ORDER BY name;


-- Between Canada and Poland

-- Which country has a population that is more than United Kingdom but less than Germany? 
-- Show the name and the population.

SELECT name, population 
FROM world 
WHERE population > (SELECT population 
                    FROM world 
                    WHERE name = 'United Kingdom') 
  AND population < (SELECT population 
                    FROM world 
                    WHERE name = 'Germany');


-- Percentages of Germany

-- Germany (population 80 million) has the largest population of the countries in Europe. Austria (population 8.5 million) has 11% of the population of Germany.
-- Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.
-- The format should be Name, Percentage for example

SELECT name, CONCAT(ROUND(population / (SELECT population 
                                          FROM world 
                                          WHERE name = 'Germany') * 100, 0), "%")
FROM world 
WHERE continent = 'Europe';


-- Bigger than every country in Europe

-- Which countries have a GDP greater than every country in Europe? 
-- [Give the name only.] (Some countries may have NULL gdp values)

SELECT name 
FROM world 
WHERE gdp > ALL(SELECT gdp 
                FROM world 
                WHERE continent = 'Europe');


-- Largest in each continent

-- Find the largest country (by area) in each continent, show the continent, the name and the area:
-- The above example is known as a correlated or synchronized sub-query

SELECT continent, name, area 
FROM world x 
WHERE area >= ALL(SELECT area 
                  FROM world y 
                  WHERE x.continent = y.continent);


-- First country of each continent (alphabetically)

-- List each continent and the name of the country that comes first alphabetically.

SELECT continent, name 
FROM world x 
WHERE name <= ALL(SELECT name 
                  FROM world y 
                  WHERE x.continent = y.continent);


-- Difficult Questions That Utilize Techniques Not Covered In Prior Sections

-- Find the continents where all countries have a population <= 25000000. 
-- Then find the names of the countries associated with these continents. Show name, continent and population.

SELECT name, continent, population 
FROM world z 
WHERE continent IN (SELECT continent 
                    FROM world x 
                    WHERE population = ALL(SELECT population 
                                           FROM world y 
                                           WHERE x.continent = y.continent 
                                             AND y.population <= 25000000));


-- Three time bigger

-- Some countries have populations more than three times that of all of their neighbours (in the same continent). 
-- Give the countries and continents.

SELECT name, continent 
FROM world x 
WHERE x.population > ALL(SELECT 3 * population 
                          FROM world y 
                          WHERE x.continent = y.continent 
                            AND x.name <> y.name);
