#!/bin/bash

#create pipe server.pipe
mkfifo server.pipe	
	
#if program exits, e.g control+c is pressed, pipe is deleted	
trap 'rm server.pipe' EXIT

#print response function that takes in input from server.pipe and displays it
print_response () {
	read input < server.pipe
	echo $input	
}	
	
#cat server.pipe	
while true; do
	# read a new command 
	# It does not matter if the user gives less or more arguments at this point
	read command id id2 message < server.pipe #read in commands from server.pipe
	
	# check if $id is not empty
	if [ -n $id ]; then
		case $command in
			#send request to id.pipe
			#print out what input this request gives for create, add and post
			create)
				#execute the command create and send the standard output in the user $id pipe
				./create.sh $id > $id.pipe 
				print_response 
				;;
			add)
				./add.sh $id $id2 > $id.pipe
				print_response
				;;
			post)
				./post.sh $id $id2 "$message" > $id.pipe
				print_response
				;;
			display)
				# inform the client that we will start senting the content of the wall
				echo "start_of_the_file"
				#execute the display command and save the result in a variable
				clientWall=`./display.sh $id`
				# send the content of the wall stored in clientWall to the client line by line
				IFS=$'\n' # changing the delimiter to a new line
				#first for loop to print wall in server.sh
				for line in $clientWall; do
					echo $line
				done
				
				#second for loop to print wall and send it line by line to client.sh
				for line in $clientWall; do
					echo $line
				done > $id.pipe
				IFS=$' ' # bring back the delimiter into its original state (i.e., space)
				echo "end_of_the_file"
				;;
			*)
				echo "These are the only valid commands: {create|add|post|display}"
				;;
		esac
	fi
done
exit 0
