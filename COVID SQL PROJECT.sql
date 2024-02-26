
select * 
from ['coviddeaths$']

EXEC sp_help ['coviddeaths$'];

--changing total_cases' datatype to float
alter table ['coviddeaths$']
alter column total_cases float

--changing total_deaths' datatype to float
alter table ['coviddeaths$']
alter column total_deaths float

--changing total_cases_per_million datatype to float
alter table ['coviddeaths$']
alter column total_cases_per_million float




--covid deaths
select * 
from ['coviddeaths$']
where continent is not null

--select * 
--from covidvaccination2$
--order by 3,4


-- cases and deaths per country
select location, date, total_cases, new_cases, total_deaths, population
from ['coviddeaths$']
where continent is not null
order by 1,2


--covid infections in africa
select location as country, max(total_cases) as cases
from ['coviddeaths$']
where continent = 'africa'
group by location
order by cases desc

--covid infections in North America
select location as country, max(total_cases) as cases
from ['coviddeaths$']
where continent = 'North America'
group by location
order by cases desc

--covid infections in Europe
select location as country, max(total_cases) as cases
from ['coviddeaths$']
where continent = 'Europe'
group by location
order by cases desc

--covid infections in Asia
select location as country, max(total_cases) as cases
from ['coviddeaths$']
where continent = 'Asia'
group by location
order by cases desc


--covid infections in Oceania
select location as country, max(total_cases) as cases
from ['coviddeaths$']
where continent = 'Oceania'
group by location
order by cases desc


--covid infections in South America
select location as country, max(total_cases) as cases
from ['coviddeaths$']
where continent = 'South America'
group by location
order by cases desc


--countries with highest number of death rates
select location as country, population, 
max((total_deaths/total_cases))*100 as Death_rate
from ['coviddeaths$']
where continent is not null
group by location, population
order by Death_rate desc

--likelihood of dying when you contract the virus
select location, date, population, total_cases, total_deaths, 
(total_deaths/total_cases)*100 as death_rate
from ['coviddeaths$']
where continent is not null
order by 1,2


--death rates in South America per country
select location as country, population,
avg((total_deaths/total_cases))*100 as Death_rate
from ['coviddeaths$']
where continent = 'South America' 
group by location, population
order by Death_rate desc


--death rates in Africa per country
select location as country, population,
avg((total_deaths/total_cases))*100 as Death_rate
from ['coviddeaths$']
where continent = 'Africa' 
group by location, population
order by Death_rate desc


--death rates in Europe per country
select location as country, population,
avg((total_deaths/total_cases))*100 as Death_rate
from ['coviddeaths$']
where continent = 'Europe' 
group by location, population
order by Death_rate desc


--death rates in North America per country
select location as country, population,
avg((total_deaths/total_cases))*100 as Death_rate
from ['coviddeaths$']
where continent = 'North America' 
group by location, population
order by Death_rate desc


--death rates in Asia per country
select location as country, population,
avg((total_deaths/total_cases))*100 as Death_rate
from ['coviddeaths$']
where continent = 'Asia' 
group by location, population
order by Death_rate desc


--death rates in Oceania per country
select location as country, population,
avg((total_deaths/total_cases))*100 as Death_rate
from ['coviddeaths$']
where continent = 'Oceania' 
group by location, population
order by Death_rate desc


--total infections in continents
select continent, sum(total_cases) as total_covid_cases
from ['coviddeaths$']
where continent is not null
group by continent
order by continent desc

--total deaths in continents
select continent, sum(total_deaths) as total_covid_deaths
from ['coviddeaths$']
where continent is not null
group by continent
order by continent desc

--death rates in continents
select continent, avg((total_deaths/total_cases))*100 as death_rate
from ['coviddeaths$']
where continent is not null
group by continent
order by continent desc


--infection rates in continents
select continent, avg((total_cases/population))*100 as infection_rate
from ['coviddeaths$']
where continent is not null
group by continent
order by continent desc

--infection rate in Europe per country
select location as country, population,
avg((total_cases/population))*100 as infection_rate
from ['coviddeaths$']
where continent = 'Europe' 
group by location, population
order by infection_rate desc


--infection rate in Africa per country
select location as country, population,
avg((total_cases/population))*100 as infection_rate
from ['coviddeaths$']
where continent = 'Africa' 
group by location, population
order by infection_rate desc


--infection rate in North America per country
select location as country, population,
avg((total_cases/population))*100 as infection_rate
from ['coviddeaths$']
where continent = 'North America' 
group by location, population
order by infection_rate desc


--infection rate in South America per country
select location as country, population,
avg((total_cases/population))*100 as infection_rate
from ['coviddeaths$']
where continent = 'South America' 
group by location, population
order by infection_rate desc


--infection rate in Asia per country
select location as country, population,
avg((total_cases/population))*100 as infection_rate
from ['coviddeaths$']
where continent = 'Asia' 
group by location, population
order by infection_rate desc


--infection rate in Oceania per country
select location as country, population,
avg((total_cases/population))*100 as infection_rate
from ['coviddeaths$']
where continent = 'Oceania' 
group by location, population
order by infection_rate desc


--total number of infections per day in the world
select date, sum(total_cases) as total_infections
from ['coviddeaths$']
group by date
order by date 

--total number of infections per day in Africa
select date, sum(total_cases) as total_infections
from ['coviddeaths$']
where continent = 'Africa' and location = 'Kenya'
group by date
order by date 


--Covid19 impact on kenya
select date,
location as country, 
population,
new_cases,
avg((total_cases/population))*100 as infection_rate, 
total_deaths,
avg((total_deaths/total_cases))*100 as death_rate, 
sum(population-total_deaths) as population_after
from ['coviddeaths$']
where location = 'Kenya' 
group by date, location,new_cases, population, total_deaths
order by date

--GLOBAL NUMBERS
select sum(new_cases) as total_cases, 
sum(new_deaths) as total_deaths,
sum(new_cases/new_deaths)*100 as death_rate
from ['coviddeaths$']
where continent is not null
order by 1,2

--total number of people vaccinated

select ['coviddeaths$'].continent, 
['coviddeaths$'].location, 
covidvaccination2$.date, 
covidvaccination2$.new_vaccinations
from ['coviddeaths$']
join covidvaccination2$
on ['coviddeaths$'].date = covidvaccination2$.date
where continent is not null
order by covidvaccination2$.date