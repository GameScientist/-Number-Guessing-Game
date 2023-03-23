#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
echo "Enter your username:"
read NEW_USERNAME
USERNAME=$($PSQL "SELECT username FROM players WHERE username='$NEW_USERNAME'")
if [[ -z $USERNAME ]]
then
  echo -e "Welcome, $NEW_USERNAME! It looks like this is your first time here."
  INSERT=$($PSQL "INSERT INTO players(username, games_played, best_game) VALUES('$NEW_USERNAME', 0, 0)")
else
  GAMES=$($PSQL "SELECT games_played FROM players WHERE username='$NEW_USERNAME'")
  BEST=$($PSQL "SELECT best_game FROM players WHERE username='$NEW_USERNAME'")
  echo -e "Welcome back, $USERNAME! You have played $GAMES games, and your best game took $BEST guesses."
fi
echo -e "Guess the secret number between 1 and 1000:"
SECRETNUMBER=$[ $RANDOM % 1000 + 0 ]
GUESSES=0
while read GIVENNUMBER
do
  if ! [[ $GIVENNUMBER =~ ^[0-9]+$ ]]
  then
    echo -e "That is not an integer, guess again:"
  elif [[ $SECRETNUMBER -lt $GIVENNUMBER ]]
  then
    echo -e "It's lower than that, guess again:"
    GUESSES=$(($GUESSES+1))
  elif [[ $SECRETNUMBER -gt $GIVENNUMBER ]]
  then
    echo -e "It's higher than that, guess again:"
    GUESSES=$(($GUESSES+1))
  else
    GUESSES=$(($GUESSES+1))
    break
  fi
done
GAMES=$(($($PSQL "SELECT games_played FROM players WHERE username='$NEW_USERNAME'")+1))
UPDATE=$($PSQL "UPDATE players SET games_played = $GAMES WHERE username = '$NEW_USERNAME'")
BEST=$($PSQL "SELECT best_game FROM players WHERE username='$NEW_USERNAME'")
if [[ $GUESSES -lt $BEST || $GAMES == 1 ]]
then
  EQUAL=$($PSQL "UPDATE players SET best_game = $GUESSES WHERE username = '$NEW_USERNAME'")
fi
echo -e "You guessed it in $GUESSES tries. The secret number was $SECRETNUMBER. Nice job!"