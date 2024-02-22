-- Retrieve matchid and player name for all goals scored by Germany
SELECT goal.matchid, goal.player 
FROM goal
JOIN game ON game.id = goal.matchid
WHERE game.team1 = 'GER' OR game.team2 = 'GER';

-- Retrieve match details (id, stadium, team1, team2) for game 1012
SELECT game.id, game.stadium, game.team1, game.team2 
FROM game
JOIN goal ON game.id = goal.matchid
WHERE game.id = 1012 AND goal.player = 'Lars Bender';

-- Retrieve player, teamid, stadium, and match date for every German goal
SELECT goal.player, goal.teamid, game.stadium, game.mdate
FROM goal
JOIN game ON goal.matchid = game.id
WHERE goal.teamid = 'GER';

-- Retrieve team1, team2, and player for every goal scored by a player with the name starting with 'Mario'
SELECT game.team1, game.team2, goal.player 
FROM goal
JOIN game ON goal.matchid = game.id
WHERE goal.player LIKE 'Mario%';

-- Retrieve player, teamid, coach, and goal time for all goals scored in the first 10 minutes
SELECT goal.player, goal.teamid, eteam.coach, goal.gtime 
FROM goal
JOIN eteam ON goal.teamid = eteam.id
WHERE goal.gtime <= 10;

-- Retrieve match date and team name where 'Fernando Santos' was the team1 coach
SELECT game.mdate, eteam.teamname 
FROM game 
JOIN eteam ON game.team1 = eteam.id
WHERE eteam.coach = 'Fernando Santos';

-- Retrieve player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'
SELECT goal.player 
FROM goal 
JOIN game ON goal.matchid = game.id
WHERE game.stadium ='National Stadium, Warsaw';

-- Retrieve name of all players who scored a goal against Germany in any match
SELECT DISTINCT(goal.player)
FROM game 
JOIN goal ON game.id = goal.matchid 
WHERE (game.team1 = 'GER' AND goal.teamid != 'GER') 
OR (game.team2 = 'GER' AND goal.teamid != 'GER');

-- Show teamname and the total number of goals scored for each team
SELECT eteam.teamname, COUNT(goal.teamid) as total_goals 
FROM eteam 
JOIN goal ON eteam.id = goal.teamid
GROUP BY eteam.teamname;

-- Show the stadium and the total number of goals scored in each stadium
SELECT game.stadium, COUNT(goal.matchid) as total_goals 
FROM game
JOIN goal ON game.id = goal.matchid
GROUP BY game.stadium;
