#!/bin/bash
#shebang, used to tell ubuntu to use bash as the command interpreter

#initalising and assigning values to variables and paths
id="$1"
friend="$2"

idDirectory="User/$id"
friendDirectory="User/$friend"

if [ -d $idDirectory ]; then #if id directory at this path exists
 if [ -d $friendDirectory ]; then #if friend directory at this path exists
    if grep "$friend" "$idDirectory"/friends.txt > /dev/null; then #if name of friend, is on idDirectory/friends.txt, then
      echo ""$friend" is already a friend of "$id"" #print that friend is already a friend of id
      return #returns and exits
      exit 0
    else #else condition if friend is not on file
      echo "$friend" >> "$idDirectory"/friends.txt #add name of friend to idDirectory/friends.txt file
      echo "ok: friend added!" #print ok statement
      return #returns and exits
      exit 1
    fi
 else #else condition if friend directory does not exist
  echo "nok: user "$friend" does not exist" #print error that friend directory does not exist
  return #returns and exits
  exit 1
   fi
 else #else condition if id directory does not exist
  echo "nok: user "$id" does not exist" #print error that id directory does not exist
  return #returns and exits
  exit 1
   fi  
fi

#final exit
exit 0
