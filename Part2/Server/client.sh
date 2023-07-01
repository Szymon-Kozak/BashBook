#!/bin/bash

#checking that the number of arguments equals 1
if [ $# -ne 1 ]; then
    echo "nok: problem with the number of identifiers"
	exit 1
fi

#id is equal to first argument
id=$1

    #create pipe with name of id	
    mkfifo "$id".pipe
    
    #trap the id, upon control + c, pipe is deleted
    trap 'rm $id.pipe' EXIT
 	
    #asks user for input and enter while loop	
    echo "Input: "
    while true; do
	#while true, read in request and arguments
	read req args1 args2
	#send to server.pipe, with id as second argument
	echo $req $id $args1 $args2 > server.pipe
	
	#if request is display, print the wall, done using a loop and adding each line of file to loop. printed out at end.
	if [ "$req" == display ]; then
		input=()
        	# adds lines in wall to the input array
        	while read line
        	do
            	input+=("$line")
        	done < "$id.pipe"
        	# prints the elements of the array
        	printf '%s\n' "${input[@]}"
		
		#asks user to input another argument and program continues
		echo "Input: "
		read req args1 args2
		echo $req $id $args1 $args2 > server.pipe
        fi	
	
	#read input from id.pipe, and send it to server.pipe
	read input < $id.pipe
	echo $input > server.pipe
	
	#whatever message input gives us, print a specific user friendly message for client
	case $input in 
		"nok: user id already exists")
			echo "ERROR: user already exists!"
			;;
		"ok: user id created!")
			echo "SUCCESS: user created!"
			;;
		"nok: user id does not exist")
			echo "ERROR: your id is invalid!"
			;;
		"nok: user friend does not exist")
			echo "ERROR: friend id does not exist!"
			;;
		"ok: friend added!")
			echo "SUCCESS: you added this person as a friend!"
			;;
		"nok: could not add friend as friend")
			echo "ERROR: This person is already your friend"
			;;	
		"nok: user sender does not  exist")
			echo "ERROR: your id does not exist!"
			;;
		"nok: user sender is not a friend of receiver")
			echo "ERROR: you are not a friend of the person you are sending message to!"
			;;
		"ok: message posted on receiver wall")
			echo "SUCCESS: you have posted the message on your friend's wall!"
			;;								
	esac		
   done

exit 0
