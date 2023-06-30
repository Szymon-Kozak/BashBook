#!/bin/bash
#shebang, used to tell ubuntu to use bash as the command interpreter

while true; do #while statement, which runs on an infinte loop while true
 echo "Enter your command: " #prints enter a command
 read request id args1 args2 #lets user enter inputs, each of the arguments are saved to the respective variables given

  #case statement for first $request argument
  case "$request" in
    create) #if $request is create, the ) at end of create indicates end of condition
     source create.sh $id #call the create.sh file with $id inputted as the argument, source is used to access files in the same directory
     echo -e "\n" ;; #print a new line. Two semicolons indicate end of particular case.
     
    add) #if $request is add
     friend=$args1 #let friends variable equal to the third argument args1
     source add_friend.sh $id $friend #call the add_friend.sh file with $id and $friend inputted as arguments
     echo -e "\n" ;; #print a new line, close case
     
    post) #if $request is post
     #sender and receiver are assigned values of second and third argument inputted respectively
     sender=$id
     receiver=$args1
     message=($args2) #message is a variable which stores an array, the contents of the array are any arguments following receiver
     source post_messages.sh $sender $receiver ${message[@]} #call the post_message.sh file with $sender $receiver and ${message[@]}. 
     #${message[@]} here calls every item in the message array and passes that as the final argument for the script
     echo -e "\n" ;; #print a new line, close case
     
    display) #if $request is display
     source display_wall.sh $id #call the display_wall.sh file with $id as the only argument
     echo -e "\n" ;; #print a new line, close case
     
    quit) #if $request is quit
     exit 1 ;; #exits the while loop and the script file, print new line and close case
     
    *) #if $request is *, here asterisk is anything other than cases given, for eg, if arguments are empty or wrong format is given
     echo "nok: bad request" #prints this error message
     echo "Accepted Commands: {create|add|post|display|quit}" #shows user what commands are valid, and let's user input another command
     echo -e "\n" ;; #print a new line, close case
      
  esac #this word esac indicates the end of the whole case statement
   
 done #this word done indicates the end of the while loop
  
#final exit  
exit 0
