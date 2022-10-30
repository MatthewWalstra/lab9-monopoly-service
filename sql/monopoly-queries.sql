--
-- This SQL script implements sample queries on the Monopoly database.
--
-- @author kvlinden
-- @version Summer, 2015
--

-- Get the number of Game records.
SELECT *
  FROM Game
  ;

-- Get the player records.
SELECT * 
  FROM Player
  ;

-- Get all the users with Calvin email addresses.
SELECT *
  FROM Player
 WHERE email LIKE '%calvin%'
 ;

-- Get the highest score ever recorded.
  SELECT score
    FROM PlayerGame
ORDER BY score DESC
   LIMIT 1
   ;

-- Get the cross-product of all the tables.
SELECT *
  FROM Player, PlayerGame, Game
  ;

-- https://dba.stackexchange.com/questions/24327/how-to-select-distinct-for-one-column-and-any-in-another-column
-- Get winners of last 50 games 
SELECT DISTINCT ON (PlayerGame.gameID) PlayerGame.gameID, score, email, name
FROM PlayerGame, Player
WHERE PlayerGame.playerID = Player.ID
ORDER BY PlayerGame.gameID DESC, score DESC
LIMIT 50;
