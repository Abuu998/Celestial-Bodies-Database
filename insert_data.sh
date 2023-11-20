#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# TRUNCATE ALL TABLES
echo "$($PSQL "TRUNCATE TABLE games, teams")"


#INSERTING TEAMS
echo -e "\n=== INSERTING TEAMS ===\n"

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $WINNER != winner ]]
  then
    TEAM_ID="$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")"
    OPO_ID="$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")"

    if [[ -z $TEAM_ID ]]
    then
      INSERT_TEAM_RESULT="$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")"

      if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
      then
        echo "Inserted team $WINNER successfuly."
      fi
    fi

    if [[ -z $OPO_ID ]]
    then
      INSERT_OPO_RESULT="$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")"

      if [[ $INSERT_OPO_RESULT == "INSERT 0 1" ]]
      then
        echo "Inserted team $OPPONENT successfuly."
      fi
    fi
  fi
done


# INSERT GAMES
echo -e "\n=== INSERTING GAMES ===\n"

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  # remove the first line
  if [[ $YEAR != "year" ]]
  then
    WINNER_ID="$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")"
    OPPONENT_ID="$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")"

    # insert game
    INSERT_GAME_RESULT="$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")"

    if [[ $INSERT_GAME_RESULT == "INSERT 0 1" ]]
    then
      echo "Inserted game: $WINNER vs $OPPONENT"
    fi
  fi
done