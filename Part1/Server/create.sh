#!/bin/bash 
#shebang, used to tell ubuntu to use bash as the command interpreter

#initalising and assigning values to variables id and directory
id="$1"
directory="User/$id"

if [ $# -eq 0 ]; then #if there are no arguments passed
    echo "nok: no identifier provided" #print this error statement
    return #return is used here as otherwise it clashes with script.sh code and exits while loop. Return is hence used for every if and else statements
    exit 1 #exit for error
elif [ -d $directory ]; then #if directory exists
    echo "nok: user already exists" #print this statement
    return #same as above
    exit 1 #exit with code 1 
fi #used to mark end of if-else statements

#if directory does not exist, then
if [ ! -d $directory ]; then
#go into User folder, make a directory there called after id, go into that newly created folder.
#create two files, wall.txt and friends.txt
#print out that user has been created, and change directory back to Server
#Code is then returned and exited
    cd "User"
    mkdir "$id"
    cd "$id"
    touch "wall.txt"
    touch "friends.txt"
    echo "ok: user created!"
    cd ../..
    return
    exit 0
fi

#final exit showing everything ran
exit 0
