#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  QUERY=null

  if [[ $1 =~ ^[0-9]+$ ]]
    then
      QUERY=$1
      ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number = $QUERY")

  elif [[ $1 =~ ^[a-zA-Z]+$ ]]
    then
      QUERY=$1
      ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol = '$QUERY' OR name = '$QUERY'")
  fi

  if [[ -z $ATOMIC_NUMBER ]]
  then
    echo "I could not find that element in the database."
  else
    INFOS=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number = $ATOMIC_NUMBER")
    
    echo "$INFOS" | while IFS="|" read AT_NUMBER NAME SYMBOL TYPE ATOMIC_MASS M_POINT B_POINT
    do
      echo "The element with atomic number $AT_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $M_POINT celsius and a boiling point of $B_POINT celsius."
    done
  fi

fi
