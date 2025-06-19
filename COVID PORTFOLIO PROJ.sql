-- Queries for TABLEAU Visualization
-- 1) Display the global data of the total cases and total deaths, with the calculated death percentage
SELECT SUM(new_cases) as TotalCases, SUM(new_deaths) as TotalDeaths, SUM(cast(new_deaths as float))/sum(cast(new_cases as float))*100 as DeathPercentage
From PortfolioProject..CovidDeaths
WHERE continent is not null
-- GROUP BY date
ORDER BY 1,2;

--2) The total death count per continents
SELECT continent, sum(new_deaths) as TotalDeathCount
FROM PortfolioProject..CovidDeaths
WHERE continent is not null
GROUP BY continent
ORDER BY TotalDeathCount DESC

--3) the percentage of the population infected per country
SELECT Location, Population, Max(total_cases) as HighestInfectionCount, Max((total_cases/Population))*100 
	as PercentPopnInfected
From PortfolioProject..CovidDeaths
GROUP BY Location, Population
ORDER BY PercentPopnInfected DESC;

--4) the percentage of the population infected per country as a time series data
SELECT Location, Population, date, Max(total_cases) as HighestInfectionCount, Max((total_cases/Population))*100 
	as PercentPopnInfected
From PortfolioProject..CovidDeaths
GROUP BY Location, Population, date
ORDER BY PercentPopnInfected DESC;





-- Queries for Data Exploration
SELECT * From PortfolioProject..CovidDeaths
WHERE continent IS NOT NULL
ORDER BY 3,4;

--SELECT Location, date, total_cases, new_cases, total_deaths, population
--FROM PortfolioProject..CovidDeaths

--ORDER BY 1,2;


ALTER TABLE PortfolioProject..CovidDeaths
ALTER COLUMN total_cases FLOAT;

ALTER TABLE PortfolioProject..CovidDeaths
ALTER COLUMN total_deaths FLOAT;

-- Total Cases vs Total Deaths
-- shows the mortality rate or the likelihood of dying per country
SELECT Location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
FROM PortfolioProject..CovidDeaths
WHERE Location like 'Philippines'
AND continent IS NOT NULL
ORDER BY 1,2;


-- Total Cases vs Population
-- shows the percentage of population infected
SELECT Location, date, Population, total_cases,  (total_cases/population)*100 as CasePercentage
FROM PortfolioProject..CovidDeaths
WHERE Location like '%Philippines%'
AND continent IS NOT NULL
ORDER BY 1,2;

-- Countries and their highest infection count and highest percent of population infected
SELECT Location, Population, Max(total_cases) as HighestInfectionCount, Max((total_cases/Population))*100 
	as PercentPopnInfected
From PortfolioProject..CovidDeaths
WHERE continent IS NOT NULL
GROUP BY Location, Population
ORDER BY PercentPopnInfected DESC;

-- Countries with Highest Death Count 
SELECT Location, MAX(total_deaths) as HighestDeathCounts
From PortfolioProject..CovidDeaths
WHERE continent IS NOT NULL
GROUP BY Location
ORDER BY HighestDeathCounts DESC;


-- Show previous table by continent
-- Continents with highest death count
SELECT continent, MAX(total_deaths) as HighestDeathCounts
From PortfolioProject..CovidDeaths
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY HighestDeathCounts DESC;

-- Global Numbers (DEATH PERCENTAGE)
SELECT date, SUM(new_cases) as TotalCases, SUM(new_deaths) as TotalDeaths, SUM(cast(new_deaths as float))/sum(cast(new_cases as float))*100 as DeathPercentage
From PortfolioProject..CovidDeaths
WHERE continent is not null
GROUP BY date
ORDER BY 1,2;

-- Totatl Population vs Vaccinations
SELECT death.continent, death.location, death.date, death.population, vac.new_vaccinations
, SUM(vac.new_vaccinations) OVER (PARTITION BY death.Location ORDER  BY death.Location, death.Date) 
as RollingPeopleVaccinated
FROM PortfolioProject..CovidDeaths AS death
JOIN PortfolioProject..CovidVaccinations AS vac
	ON death.location = vac.location
	and death.date = vac.date
WHERE death.continent is not null
ORDER BY 2,3

-- USING CTE
WITH PopulationVsVaccination (Continent, Location, Date, Population, New_Vaccinations, RollingPeopleVaccinated)
as (
SELECT death.continent, death.location, death.date, death.population, vac.new_vaccinations
, SUM(CONVERT(float,vac.new_vaccinations)) OVER (PARTITION BY death.Location ORDER  BY death.Location, death.Date) 
as RollingPeopleVaccinated
FROM PortfolioProject..CovidDeaths AS death
JOIN PortfolioProject..CovidVaccinations AS vac
	ON death.location = vac.location
	and death.date = vac.date
WHERE death.continent is not null
--ORDER BY 2,3
) 

SELECT *, (RollingPeopleVaccinated/Population)*100 FROM PopulationVsVaccination
ORDER BY 2,3

-- USING TEMP TABLE
DROP TABLE IF EXISTS #PercentPopnVaccinated
CREATE TABLE #PercentPopnVaccinated
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
New_vaccinations numeric,
RollingPeopleVaccinated numeric
)

INSERT INTO #PercentPopnVaccinated
SELECT death.continent, death.location, death.date, death.population, vac.new_vaccinations
, SUM(CONVERT(float,vac.new_vaccinations)) OVER (PARTITION BY death.Location ORDER  BY death.Location, death.Date) 
as RollingPeopleVaccinated
FROM PortfolioProject..CovidDeaths AS death
JOIN PortfolioProject..CovidVaccinations AS vac
	ON death.location = vac.location
	and death.date = vac.date
WHERE death.continent is not null
--ORDER BY 2,3

SELECT *, (RollingPeopleVaccinated/Population)*100
FROM #PercentPopnVaccinated

-- CREATE VIEWS FOR DATA VISUALIZATION

-- Percen
CREATE VIEW PercentPopulationVaccinated AS 
SELECT death.continent, death.location, death.date, death.population, vac.new_vaccinations
, SUM(vac.new_vaccinations) OVER (PARTITION BY death.Location ORDER  BY death.Location, death.Date) 
as RollingPeopleVaccinated
FROM PortfolioProject..CovidDeaths AS death
JOIN PortfolioProject..CovidVaccinations AS vac
	ON death.location = vac.location
	and death.date = vac.date
WHERE death.continent is not null
--ORDER BY 2,3

SELECT * FROM PercentPopulationVaccinated

-- Global Numbers (DEATH PERCENTAGE)
CREATE VIEW GlobalNumbersPercentage AS
SELECT date, SUM(new_cases) as TotalCases, SUM(new_deaths) as TotalDeaths, SUM(cast(new_deaths as float))/sum(cast(new_cases as float))*100 as DeathPercentage
From PortfolioProject..CovidDeaths
WHERE continent is not null
GROUP BY date
--ORDER BY 1,2;
