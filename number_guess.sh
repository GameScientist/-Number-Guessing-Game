#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
echo "Enter your username:"
read NEW_USERNAME
USERNAME=$($PSQL "SELECT username FROM players WHERE username='$NEW_USERNAME'")
if [[ -z $USERNAME ]]
then
  echo -e "Welcome, $NEW_USERNAME! It looks like this is your first time here."
  INSERT=$($PSQL "INSERT INTO players(username, games_played, best_game) VALUES('$NEW_USERNAME', 0, 0)")
  GAMES=0
  BEST=0
else
  GAMES=$($PSQL "SELECT games_played FROM players WHERE username='$NEW_USERNAME'")
  BEST=$($PSQL "SELECT best_game FROM players WHERE username='$NEW_USERNAME'")
  echo -e "Welcome back, $USERNAME! You have played $GAMES games, and your best game took $BEST guesses."
fi

echo -e "Guess the secret number between 1 and 1000:"
SECRETNUMBER=$[ $RANDOM % 1000 + 0 ]
GUESSES=1
while read GIVENNUMBER
do
  if [[ $GIVENNUMBER =~ ^[0-9]+$ ]];
  then
    GUESSES=$(($GUESSES+1))
    if [ $GIVENNUMBER -eq $SECRETNUMBER ];
    then
      GAMES=$(($GAMES+1))
      echo -e "You guessed it in $GUESSES tries. The secret number was $SECRETNUMBER. Nice job!"
      break;
    else
      if [[ $SECRETNUMBER -lt $GIVENNUMBER ]];
      then
        echo -e "It's lower than that, guess again:"
      elif [[ $SECRETNUMBER -gt $GIVENNUMBER ]];
      then
        echo -e "It's higher than that, guess again:"
      fi
    fi
  else
    echo -e "That is not an integer, guess again:"
  fi
done
if (($BEST==0 || $BEST>$GUESSES));
then
  UPDATE=$($PSQL "UPDATE players SET games_played=$GAMES, best_game=$GUESSES WHERE username = '$NEW_USERNAME'")
else
  UPDATE=$($PSQL "UPDATE players SET games_played=$GAMES WHERE username = '$NEW_USERNAME'")
fi
