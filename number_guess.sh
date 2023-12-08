#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

RANDOM_NUMBER=$[ $RANDOM % 1000 + 1 ]


echo Enter your username:
read USERNAME

if [[ -z $USERNAME ]]
  then
    echo "You have not entered your name."
else
  # search User in database
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")
  
  # if not in the database
  if [[ -z $USER_ID ]]
    then
      # save username in database
      INSERT_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
      echo "Welcome, $USERNAME! It looks like this is your first time here."

      # get user id
      USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")
      #insert game
      INSERT_GAME=$($PSQL "INSERT INTO games(user_id) VALUES($USER_ID)")

      # ask the user to guess the number
      echo "Guess the secret number between 1 and 1000:"
      read GUESS

      while [[ ! $GUESS =~ ^[0-9]+$ ]]
      do
        echo "That is not an integer, guess again:"
        read GUESS
      done

      #update games_played
      UPDATE_GAMES=$($PSQL "UPDATE games SET games_played = games_played + 1 WHERE user_id = $USER_ID")
      #update guesses
      UPDATE_GUESS=$($PSQL "UPDATE games SET guesses = guesses + 1 WHERE user_id = $USER_ID")

      while [[ ! $GUESS == $RANDOM_NUMBER ]]
      do
        if [[ $GUESS -lt $RANDOM_NUMBER ]]
          then
            echo "It's higher than that, guess again:"
            read GUESS

            #update guesses
            UPDATE_GUESS=$($PSQL "UPDATE games SET guesses = guesses + 1 WHERE user_id = $USER_ID")
        elif [[ $GUESS -gt $RANDOM_NUMBER ]]
          then
            echo "It's lower than that, guess again:"
            read GUESS

            #update guesses
            UPDATE_GUESS=$($PSQL "UPDATE games SET guesses = guesses + 1 WHERE user_id = $USER_ID")
        fi
      done
      
      # GET everything for the user and games print the response
      echo $($PSQL "SELECT * FROM games WHERE user_id = $USER_ID") | while IFS="|" read GAME_ID USER_ID GAMES_PLAYED BEST_GAME GUESSES
      do
        if [[ $GUESSES -lt $BEST_GAME ]]
          then
            #update the best game
            UPDATE_BEST_GAME=$($PSQL "UPDATE games SET best_game = $GUESSES WHERE user_id = $USER_ID")
        fi

        echo "You guessed it in $GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"
      done
    
  else
    # reset previous guesses
    RESET_GUESSES=$($PSQL "UPDATE games SET guesses = 0 WHERE user_id = $USER_ID")

    # get infos about the games played before
    echo "$($PSQL "SELECT user_id, username, games_played, guesses, best_game FROM users INNER JOIN games USING(user_id) WHERE user_id = $USER_ID")" | while IFS="|" read USER_ID USERNAME GAMES_PLAYED GUESSES BEST_GAME
    do
      # welcome user
      echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
    done

    # ask the user to guess the number
      echo "Guess the secret number between 1 and 1000:"
      read GUESS

      while [[ ! $GUESS =~ ^[0-9]+$ ]]
      do
        echo "That is not an integer, guess again:"
        read GUESS
      done

      #update games_played
      UPDATE_GAMES=$($PSQL "UPDATE games SET games_played = games_played + 1 WHERE user_id = $USER_ID")

      #update guesses
      UPDATE_GUESS=$($PSQL "UPDATE games SET guesses = guesses + 1 WHERE user_id = $USER_ID")

      while [[ ! $GUESS == $RANDOM_NUMBER ]]
      do
        if [[ $GUESS -lt $RANDOM_NUMBER ]]
          then
            echo "It's higher than that, guess again:"
            read GUESS

            #update guesses
            UPDATE_GUESS=$($PSQL "UPDATE games SET guesses = guesses + 1 WHERE user_id = $USER_ID")
        elif [[ $GUESS -gt $RANDOM_NUMBER ]]
          then
            echo "It's lower than that, guess again:"
            read GUESS

            #update guesses
            UPDATE_GUESS=$($PSQL "UPDATE games SET guesses = guesses + 1 WHERE user_id = $USER_ID")
        fi
      done
      
      # GET everything for the user and games print the response
      echo $($PSQL "SELECT * FROM games WHERE user_id = $USER_ID") | while IFS="|" read GAME_ID USER_ID GAMES_PLAYED BEST_GAME GUESSES
      do
        if [[ $GUESSES -lt $BEST_GAME ]]
          then
            #update the best game
            UPDATE_BEST_GAME=$($PSQL "UPDATE games SET best_game = $GUESSES WHERE user_id = $USER_ID")
        fi

        echo "You guessed it in $GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"
        
      done
  fi
fi
