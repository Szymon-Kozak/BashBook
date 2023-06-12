# Part 1 - README

## Introduction
This project is a simple server written in bash. The server provides the capability of creating users, adding friends, posting messages and displaying the message wall. 

## Usage

To get started, navigate to the Server directory where the scripts reside. Here is the functionality provided by each script:

1. `create.sh` - Used to create a new user. The command to execute it is: `./create.sh $id`, where `$id` is the name you would like for your user. Upon successful execution, a new directory with the `$id` name will be created in the User directory. You can verify this by navigating to the User directory and using the `ls` command.

2. `add_friend.sh` - This script allows a user to add a friend. Run it using the command: `./add_friend.sh $id $friend`. Here, `$id` and `$friend` are names of two pre-existing directories in the User directory. On success, the name of the friend will be added to the friends.txt file of the user. You can verify this by opening the friends.txt file in the user's directory.

3. `post_messages.sh` - This script lets a user post a message to a friend's wall. The command is: `./post_messages.sh $sender $receiver $message`. Here, both `$sender` and `$receiver` should be pre-existing directories in the User directory, and `$message` is any word or sentence you wish to type. If the execution is successful, the message will be added to the wall.txt of the receiver. This can be verified by opening the wall.txt file in the receiver's directory.

4. `display_wall.sh` - This script is used to display a user's wall. The command to run it is `./display_wall.sh $id`, where `$id` is a pre-existing directory in the User directory. On success, it will print out the entire contents of the user's wall.txt file to the console.

5. `server.sh` - This script is the main server script. It takes four arguments: `$request`, `$id`, `$args1` and `$args2`. Here `$request` is the command you wish to run (create, add, post, display, quit). `$id` is the id of the user, and `$args1` and `$args2` are specific to which command you are running. For example, `display_wall.sh` doesn't use `$args1` and `$args2`, whereas `post_messages.sh` uses both.

You can run the server using the command: `./server.sh $request $id $args1 $args2`. The server will keep running until you enter `quit` as the `$request`, which will stop the script.

## Scripts

Here's a brief description of each script:

1. `create.sh`: Creates a new user directory and two files: `wall.txt` and `friends.txt` within it.

2. `add_friend.sh`: Checks for existence of the user and the friend directories, and then adds the friend to the user's `friends.txt` file.

3. `post_messages.sh`: Checks for the sender and receiver's directory, as well as the sender being a friend of the receiver, before adding the message to the receiver's `wall.txt` file.

4. `display_wall.sh`: Checks for user's directory and displays the content of `wall.txt` if it's not empty.

5. `server.sh`: Server script that can handle the requests to run create, add friend, post message, display wall or quit commands.

Each script has error handling built in, so if an error occurs, you will receive a "nok"
