#!/bin/bash
#shebang, used to tell ubuntu to use bash as the command interpreter

#initialise and assign values to variables and paths needed
id=$1

idDirectory="User/$id"

if [ $# -eq 0 ]; then #if no argument has been entered,
    echo "Please enter a user" #asks to enter a user
    return #returns and exits
    exit 1
fi

if [ -d $idDirectory ]; then #if the idDirectory exists
 if [[ ! -z $(grep '[^[:space:]]' $idDirectory/wall.txt) ]]; then #if the file is not empty or contains only whitespaces
  echo -e "start_of_file\n" #print start of file, -e is used so \n can work within double quotes
  
  wallContent=`cat "$idDirectory"/wall.txt` #let this variable equal to the string content of the wall.txt file
  echo "$wallContent" #print out the variable, hence printing what the file contains
  
  echo -e "\nend_of_file" #print end of file
  return #returns
 else #if file is empty completely or contains only whitespaces
  echo "File is empty" #print file is empty
  return #returns and exits
  exit 1
  fi 
  
 else #if user directory does not exist
  echo "nok: user "$id" does not exist" #print error message
  return #returns and exits
  exit 1
fi

#final exit
exit 0
