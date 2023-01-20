SELECT SUM(new_cases) AS total_cases, SUM(cast(new_deaths as int)) AS total_deaths, SUM(cast(new_deaths AS int))/SUM(new_cases)*100 AS death_percentage
FROM dbo.covid_deaths
WHERE continent is not null
order by 1,2

