-- Create Tableau table 1 with total cases, total deaths, and death percentage by continent
SELECT
    SUM(new_cases) AS total_cases,
    SUM(CAST(new_deaths AS int)) AS total_deaths,
    SUM(CAST(new_deaths AS int)) / SUM(new_cases) * 100 AS death_percentage,
    continent
INTO covid_data..tableau_table_1
FROM covid_data..covid_deaths
WHERE continent IS NOT NULL
GROUP BY continent;

-- Create Tableau table 2 with the total death count for each location where the continent is null and not in ('World', 'European Union', 'International')
SELECT
    location,
    SUM(CAST(new_deaths AS int)) AS total_death_count
INTO covid_data..tableau_table_2
FROM covid_data..covid_deaths
WHERE continent IS NULL
    AND location NOT IN ('World', 'European Union', 'International')
GROUP BY location;

-- Create Tableau table 3 with the highest infection count and percent population infected for each location
SELECT
    Location AS location_non_null,
    Population AS population_non_null,
    MAX(total_cases) AS highest_infection_count,
    MAX(total_cases / population) * 100 AS percent_population_infected
INTO covid_data..tableau_table_3
FROM covid_data..covid_deaths
GROUP BY Location, Population;

-- Create Tableau table 4 with the highest infection count and percent population infected for each location on each date
SELECT
    date,
    Location AS location_non_null,
    Population AS population_non_null,
    MAX(total_cases) AS highest_infection_count,
    MAX(total_cases / population) * 100 AS percent_population_infected
INTO covid_data..tableau_table_4
FROM covid_data..covid_deaths
GROUP BY date, Location, Population;
