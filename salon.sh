#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~"

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  echo -e "\nWelcome to My salon, how can i help you?\n"
  SERVICES=$($PSQL "SELECT * FROM services")

  echo "$SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done

  echo -e "\n"
  read SERVICE_ID_SELECTED

  case $SERVICE_ID_SELECTED in
    1) DO_WORK "cut" ;;
    2) DO_WORK "color" ;;
    3) DO_WORK "pern" ;;
    4) DO_WORK "style" ;;
    5) DO_WORK "trim" ;;
    *) MAIN_MENU "I could not find that service. What would you like today?" ;;
  esac
}

DO_WORK() {
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  # ask phone number
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  # if not exists
  if [[ -z $CUSTOMER_ID ]]
  then
    # ask name
    echo -e "\nWhat's your name?"
    read CUSTOMER_NAME

    INSERT_CUSTOMER_RES=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
    
    if [[ $INSERT_CUSTOMER_RES == "INSERT 0 1" ]]
    then
      # get the customer id
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
      # ask for service id
      SERVICE_ID=$($PSQL "SELECT service_id FROM services WHERE name = '$1'")

      # ask for service time
      echo -e "\nWhat time would you like?"
      read SERVICE_TIME

      if [[ -z $SERVICE_TIME ]]
      then
        echo -e "\nYou did not give me your prefered time!?\nWhat time do you prefere?"
        read SERVICE_TIME
      else
        INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID, '$SERVICE_TIME')")

        if [[ $INSERT_APPOINTMENT == "INSERT 0 1" ]]
        then
          echo -e "\nI have put you down for a $1 at $SERVICE_TIME, $CUSTOMER_NAME."
        fi
      fi

    fi
  else 
    # get customer name
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE customer_id = $CUSTOMER_ID")
    # get service id
    SERVICE_ID=$($PSQL "SELECT service_id FROM services WHERE name = '$1'")
    # ask time

    echo -e "\nWhat time would you like?"
    read SERVICE_TIME

    if [[ -z $SERVICE_TIME ]]
    then
      echo -e "\nYou did not give me your prefered time!?\nWhat time do you prefere?"
      read SERVICE_TIME
    else
      INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID, '$SERVICE_TIME')")

      if [[ $INSERT_APPOINTMENT == "INSERT 0 1" ]]
      then
        echo -e "\nI have put you down for a $1 at $SERVICE_TIME, $CUSTOMER_NAME."
      fi
    fi
  fi
}


MAIN_MENU