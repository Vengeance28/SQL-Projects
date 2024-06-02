select *
from nba_2022_2023$

select * 
from nba_2022_2023$


--players averaging most points
select player,Team, MAX(PTS) as Points
from nba_2022_2023$
group by Player, Team
order by Points desc


--Philadelphia 76ers Players
select player,pos, Age, PTS
from nba_2022_2023$
where team = 'Philadelphia 76ers'
order by PTS desc

--Toronto Raptors Players
select player,pos, Age, PTS
from nba_2022_2023$
where team = 'Toronto Raptors'
order by PTS desc

--Golden State Warriors Players
select player,pos, Age, PTS
from nba_2022_2023$
where team = 'Golden State Warriors'
order by PTS desc

--Milwauke Bucks Players
select player,pos, Age, PTS
from nba_2022_2023$
where team = 'Milwaukee Bucks'
order by PTS desc

--Atlanta Hawks Players
select player,pos, Age, PTS
from nba_2022_2023$
where team = 'Atlanta Hawks'
order by PTS desc

--Utah Jazz Players
select player,pos, Age, PTS
from nba_2022_2023$
where team = 'Utah Jazz'
order by PTS desc

--Los Angeles Lakers Players
select player,pos, Age, PTS
from nba_2022_2023$
where team = 'Los Angeles Lakers'
order by PTS desc

--Los Angeles Clippers Players
select player,pos, Age, PTS
from nba_2022_2023$
where team = 'Los Angeles Clippers'
order by PTS desc

--Brooklyn Nets Players
select player,pos, Age, PTS
from nba_2022_2023$
where team = 'Brooklyn Nets'
order by PTS desc

--Boston Celtics Players
select player,pos, Age, PTS
from nba_2022_2023$
where team = 'Boston Celtics'
order by PTS desc
--what position averaged most points
select pos, AVG(PTS) as average_points
from nba_2022_2023$
group by pos
order by average_points desc

--what team averaged most points
select team, AVG(PTS) as average_points
from nba_2022_2023$
group by team
order by average_points desc

--what team avereged most 3 pointers
select team, AVG([3P]) as average_3points
from nba_2022_2023$
group by team
order by average_3points desc

--what players averaged most 3 pointers
select Player, team, AVG([3P]) as average_3points
from nba_2022_2023$
group by player, team
order by average_3points desc


--what players averaged most 3 pointers
select Player, team, max([3P]) as average_3points
from nba_2022_2023$
group by player, team
order by average_3points desc

--teams in the Eastern Conference
select distinct(team)
from nba_2022_2023$
where Conference = 'Eastern'

--teams in the Western Conference
select distinct(team)
from nba_2022_2023$
where Conference = 'Western'

--Conferences and their respective divisions
select Conference, Division
from nba_2022_2023$
group by Conference, Division


--Team info for teams in the Eastern conference, Atlantic Division
--teams in the Atlantic Division
select distinct(team)
from nba_2022_2023$
where Division = 'Atlantic'

--Boston Celtics
select Player, pos, age
from nba_2022_2023$
where team = 'Boston Celtics'
order by age desc

--Brooklyn Nets
select Player, pos, age
from nba_2022_2023$
where team = 'Brooklyn Nets'
order by age desc

--New York Knicks
select Player, pos, age
from nba_2022_2023$
where team = 'New York Knicks'
order by age desc

--Philadelphia 76ers
select Player, pos, age
from nba_2022_2023$
where team = 'Philadelphia 76ers'
order by age desc

--Toronto Raptors
select Player, pos, age
from nba_2022_2023$
where team = 'Toronto Raptors'
order by age desc



--Team info for teams in the Eastern conference, Central Division
--teams in the Central Division
select distinct(team)
from nba_2022_2023$
where Division = 'Central'

--Chicago Bulls
select Player, pos, age
from nba_2022_2023$
where team = 'Chicago Bulls'
order by age desc

--Cleveland Cavaliers
select Player, pos, age
from nba_2022_2023$
where team = 'Cleveland Cavaliers'
order by age desc

--Detroit Pistons
select Player, pos, age
from nba_2022_2023$
where team = 'Detroit Pistons'
order by age desc

--Indiana Pacers
select Player, pos, age
from nba_2022_2023$
where team = 'Indiana Pacers'
order by age desc

--Milwaukee Bucks
select Player, pos, age
from nba_2022_2023$
where team = 'Milwaukee Bucks'
order by age desc




--Team info for teams in the Eastern conference, Southeast Division
--teams in the Southeast Division
select distinct(team)
from nba_2022_2023$
where Division = 'Southeast'

--Atlanta Hawks
select Player, pos, age
from nba_2022_2023$
where team = 'Atlanta Hawks'
order by age desc

--Charlotte Hornets
select Player, pos, age
from nba_2022_2023$
where team = 'Charlotte Hornets'
order by age desc

--Miami Heats
select Player, pos, age
from nba_2022_2023$
where team = 'Miami Heats'
order by age desc

--Orlando Magic
select Player, pos, age
from nba_2022_2023$
where team = 'Orlando Magic'
order by age desc

--Washington Wizards
select Player, pos, age
from nba_2022_2023$
where team = 'Washington Wizards'
order by age desc




--Team info for teams in the Western conference, Northwest Division
--teams in the Northwest Division
select distinct(team)
from nba_2022_2023$
where Division = 'Northwest'

--Denver Nuggets
select Player, pos, age
from nba_2022_2023$
where team = 'Denver Nuggets'
order by age desc

--Minnesota Timberwolves
select Player, pos, age
from nba_2022_2023$
where team = 'Minnesota Timberwolves'
order by age desc

--Oklahoma City Thunder
select Player, pos, age
from nba_2022_2023$
where team = 'Oklohoma City Thunder'
order by age desc

--Portland Trail Blazers
select Player, pos, age
from nba_2022_2023$
where team = 'Portland Trail Blazers'
order by age desc

--Utah Jazz
select Player, pos, age
from nba_2022_2023$
where team = 'Utah Jazz'
order by age desc



--teams in the Pacific Division
select distinct(team)
from nba_2022_2023$
where Division = 'Pacific'

--Golden State Warriors
select Player, pos, age
from nba_2022_2023$
where team = 'Golden State Warriors'
order by age desc

--Los Angeles Lakers
select Player, pos, age
from nba_2022_2023$
where team = 'Los Angeles Lakers'
order by age desc

--Los Angeles Clippers
select Player, pos, age
from nba_2022_2023$
where team = 'Los Angeles Clippers'
order by age desc

--Phoenix Suns
select Player, pos, age
from nba_2022_2023$
where team = 'Phoenix Suns'
order by age desc

--Sacramento Kings
select Player, pos, age
from nba_2022_2023$
where team = 'Sacramento Kings'
order by age desc




--teams in the Southwest Division
select distinct(team)
from nba_2022_2023$
where Division = 'Southwest'

--Dallas Mavericks
select Player, pos, age
from nba_2022_2023$
where team = 'Dallas Mavericks'
order by age desc

--Houston Rockets
select Player, pos, age
from nba_2022_2023$
where team = 'Houston Rockets'
order by age desc

--Memphis Grizzlies
select Player, pos, age
from nba_2022_2023$
where team = 'Memphis Grizzlies'
order by age desc

--New Orleans Pelicans
select Player, pos, age
from nba_2022_2023$
where team = 'New Orleans Pelicans'
order by age desc

--San Antonio Spurs
select Player, pos, age
from nba_2022_2023$
where team = 'San Antonio Spurs'
order by age desc


select *
from nba_2022_2023$


--youngest Players in the league
select team, player, min(age) as age
from nba_2022_2023$
group by team, player
order by age desc


--oldest Players in the league
select team, player, max(age) as age
from nba_2022_2023$
group by team, player
order by age desc

--Top 5 Teams with young squads
select top 10 team, avg(age) as Average_age
from nba_2022_2023$
group by team
order by Average_age

--Top 5 Teams with old squad
select top 10 team, avg(age) as Average_age
from nba_2022_2023$
group by team
order by Average_age desc

--players with most game start played
select top 10 player, sum(Games_Started) games_played
from nba_2022_2023$
group by player
order by games_played desc


--players averaging most three pointers
select top 10 player, avg([3P]) as Three_pointers
from nba_2022_2023$
group by player
order by Three_pointers desc


--players averaging most two pointers
select top 10 player, avg([2P]) as Two_pointers
from nba_2022_2023$
group by player
order by Two_pointers desc

--players with most turn overs
select top 10 player, max(TOV) as Turn_overs
from nba_2022_2023$
group by player
order by Turn_overs desc

--players with most steals
select top 10 player,team, max(STL) as steals
from nba_2022_2023$
group by player, team
order by steals desc

--players with most assists
select top 10 player, avg(AST) as Assists
from nba_2022_2023$
group by player
order by Assists desc

--players with the most points
select top 10 player,team, avg(PTS) as points
from nba_2022_2023$
group by player,team 
order by points desc

--teams averaging most turn overs
select top 5 team, avg(TOV) as Turn_overs
from nba_2022_2023$
group by team
order by Turn_overs desc


--team averaging most points
select top 5 team, avg(PTS) as Points
from nba_2022_2023$
group by team
order by Points desc

--teams averaging most three pointers
select top 5 team, avg([3P]) as Three_Pointers
from nba_2022_2023$
group by team
order by Three_Pointers desc

--teams averaging most two pointers
select top 5 team, avg([2P]) as two_Pointers
from nba_2022_2023$
group by team
order by two_Pointers desc


--teams averaging most steals
select top 5 team, avg(STL) as steals
from nba_2022_2023$
group by team
order by steals desc

--teams averaging mosrt blocks
select top 5 team, avg(BLK) as blocks
from nba_2022_2023$
group by team
order by blocks desc

--teams averaging most assists
select top 10 team, avg(AST) as assists
from nba_2022_2023$
group by team
order by assists desc

create view teams_averaging_most_assists as
select top 10 team, avg(AST) as assists
from nba_2022_2023$
group by team
order by assists desc

--most defensive team
select top 10 team, avg((BLK+STL))/2 as defensive_rate
from nba_2022_2023$
group by team
order by defensive_rate desc


--VIEWS
create view most_defensive_team as
select top 10 team, avg((BLK+STL))/2 as defensive_rate
from nba_2022_2023$
group by team
order by defensive_rate desc

select *
from most_defensive_team

--positions with most points
select pos, avg(PTS) as points
FROM nba_2022_2023$
group by pos
order by points desc

create view avg_pos_points as
select distinct(pos), avg(PTS) as points
FROM nba_2022_2023$
group by pos
order by points desc