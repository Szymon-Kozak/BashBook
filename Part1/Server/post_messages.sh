#!/bin/bash
#shebang, used to tell ubuntu to use bash as the command interpreter

#initialise and assign values to variables and paths
sender=$1
receiver=$2
message=(${@:3}) #This assigns message with all the arguments from 3 onwards, to make a sentence possible

senderDirectory="User/$sender"
receiverDirectory="User/$receiver"

if [ -d $senderDirectory ]; then #if senderDirectory exists, then
 if [ -d $receiverDirectory ]; then #if receiverDirectory exists, then
  if [ ! -v $message ]; then #if the message is not empty, then
    if grep "$sender" "$receiverDirectory"/friends.txt > /dev/null; then #if sender is on the friends.txt file of the receiver, then
      echo ""$sender:" ${message[@]}" >> "$receiverDirectory"/wall.txt #write the sender name, followed by message onto receiver wall.txt file.
      # ${message[@]} calls all the items in the message array, and prints it out one by one
      echo "ok: message posted!" #confirmation message
      return #returns and exits
      exit 0
     else #if sender is not on the friends.txt file of the receiver
      echo "nok: user "$sender" is not a friend of "$receiver"" #print this out
      return #returns and exits
      exit 1
     fi
    else #if the message is empty
     echo "Message is empty. Please type something." #prompts user to enter something
     return #returns and exits
     exit 1
     fi
 else #if receiver directory does not exist
  echo "nok: user "$receiver" does not exist" #print this error message
  return #returns and exits
  exit 1
   fi
 else #if sender directory does not exist
  echo "nok: user "$sender" does not exist" #print this error message
  return #returns and exists
  exit 1
   fi  
fi

#final exit
exit 0
