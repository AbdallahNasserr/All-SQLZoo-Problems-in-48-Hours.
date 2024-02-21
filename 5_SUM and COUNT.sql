-- Total world population

-- Show the total population of the world.
-- Table: world(name, continent, area, population, gdp)

SELECT SUM(population)
FROM world;


-- List of continents

-- List all the continents - just once each.
SELECT DISTINCT continent
FROM world;


-- GDP of Africa

-- Give the total GDP of Africa.
SELECT SUM(GDP)
FROM world
WHERE continent = 'Africa';


-- Count the big countries

-- How many countries have an area of at least 1,000,000?
SELECT COUNT(area)
FROM world
WHERE area >= 1000000;


-- Baltic states population

-- What is the total population of ('Estonia', 'Latvia', 'Lithuania')?
SELECT SUM(population)
FROM world
WHERE name IN ('Estonia', 'Latvia', 'Lithuania');


-- Counting the countries of each continent

-- For each continent, show the continent and number of countries.
SELECT continent, COUNT(name) AS country_count
FROM world
GROUP BY continent;


-- Counting big countries in each continent

-- For each continent, show the continent and number of countries
-- with populations of at least 10 million.
SELECT continent, COUNT(name) AS big_country_count
FROM world
WHERE population >= 10000000
GROUP BY continent;


-- Counting big continents

-- List the continents that have a total population of at least 100 million.
SELECT continent
FROM world
GROUP BY continent
HAVING SUM(population) >= 100000000;
