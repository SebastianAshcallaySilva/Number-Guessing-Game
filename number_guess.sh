#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=number_guess --tuples-only -c"

# MAIN PROGRAM
MAIN() {
  # Ask for username
  echo "Enter your username:"
  read USERNAME
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
  
  # If user is found, print welcome back message + additional player info
  if [[ -z $USER_ID ]]
  then
    echo "Welcome, $USERNAME! It looks like this is your first time here."
    ADD_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
    USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
  else
    GAMES_PLAYED=$($PSQL "SELECT COUNT(game_id) FROM games WHERE user_id=$USER_ID")
    BEST_GAME=$($PSQL "SELECT MIN(num_of_guesses) FROM games WHERE user_id=$USER_ID")

    GAMES_PLAYED_FORMAT=$(echo $GAMES_PLAYED | sed -E 's/^ *| *$//')
    BEST_GAME_FORMAT=$(echo $BEST_GAME | sed -E 's/^ *| *$//')

    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED_FORMAT games, and your best game took $BEST_GAME_FORMAT guesses."
  fi

  # GUESSING GAME
  GUESS $USER_ID
}

GUESS() {
  # Generate a secret number
  SECRET_NUM=$(( RANDOM % 1000 + 1))

  # Ask user to guess
  echo "Guess the secret number between 1 and 1000:"
  read NUMBER_GUESSED

  # Loop until number guessed is the secret number
  GUESS_CNT=1
  while [[ $NUMBER_GUESSED != $SECRET_NUM ]]
  do
    if [[ $NUMBER_GUESSED =~ ^[0-9]+$ ]]
    then
      if (( NUMBER_GUESSED < SECRET_NUM ))
      then
        echo "It's higher than that, guess again:"
      else
        echo "It's lower than that, guess again:"
      fi

      read NUMBER_GUESSED
      GUESS_CNT=$(($GUESS_CNT + 1))
    else
      echo "That is not an integer, guess again:"
      read NUMBER_GUESSED
    fi
  done

  # Add game to games table
  ADD_GAME_RESULT=$($PSQL "INSERT INTO games(num_of_guesses,user_id) VALUES($GUESS_CNT,$1)")
  echo "You guessed it in $GUESS_CNT tries. The secret number was $SECRET_NUM. Nice job!"
}

MAIN