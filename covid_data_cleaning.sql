/*

Queries used for Tableau Project

*/



-- tableau_table_1

SELECT * INTO covid_data..tableau_table_1
FROM (
	SELECT	
		SUM(new_cases) AS total_cases, 
		SUM(cast(new_deaths AS int)) AS total_deaths, 
		SUM(cast(new_deaths AS int))/SUM(New_Cases)*100 AS death_percentage
	FROM covid_data..covid_deaths
	WHERE continent IS NOT NULL) AS aggregated_data;



--tableau_table_2

SELECT * INTO covid_data..tableau_table_2
FROM (
	Select 
		location, 
		SUM(cast(new_deaths as int)) as total_death_count
	From covid_data..covid_deaths
	Where continent is null 
	and location not in ('World', 'European Union', 'International')
	Group by location) AS aggregated_data;



-- tableau_table_3

SELECT * INTO covid_data..tableau_table_3
FROM (
	Select 
		ISNULL(Location,0) AS location_non_null,
		ISNULL(Population,0) AS population_non_null, 
		MAX(ISNULL(total_cases,0)) as highest_infection_count,  
		Max(isnull((total_cases/population),0))*100 as percent_population_infected
	From covid_data..covid_deaths
	Group by Location, Population) AS aggregated_data;



-- tableau_table_4

SELECT * INTO covid_data..tableau_table_4
FROM (
	Select 
		date,
		ISNULL(Location,0) AS location_non_null,
		ISNULL(Population,0) AS population_non_null, 
		MAX(ISNULL(total_cases,0)) as highest_infection_count,  
		Max(isnull((total_cases/population),0))*100 as percent_population_infected
	From covid_data..covid_deaths
	Group by Location, Population, date) AS aggregated_data;