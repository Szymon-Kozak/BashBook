# Part 2 - README

## Introduction
This iteration of the BashBook project has updated the scripts to enable multiple users to simultaneously connect and run commands on the server. To facilitate this, a client application (client.sh) is introduced which interacts with the server (server.sh) via named pipes.

## Usage

To utilize these scripts, open a terminal and navigate to the Server directory where the scripts are stored.

To start the server, input the command ./server.sh.

In a separate terminal (ensuring you're in the same project directory), input ./client.sh [id], replacing [id] with a user identifier.


From here, the following commands can be executed:

create - Creates a new user profile. A new directory with the given id will be created in the Users directory.

add [friend_id] - Adds a friendship relationship. The id of the friend will be added to the user's friends.txt file.

post [receiver_id] [message] - Posts a message on a friend's wall. The message will be added to the friend's wall.txt file.

display - Displays the user's wall. The contents of the wall.txt file will be printed on the console.

## Scripts

This project is composed of six bash scripts:

1. `add.sh` : Creates a friend relationship between User A and User B. The friendship is recorded in User A's friend list.

2. `client.sh` : The client script, which sends user requests to the server via named pipes.

3. `create.sh` : Generates a new user profile and saves it in the User directory.

4. `display.sh` : Displays the contents of a user's wall.

5. `post.sh` : Allows users to post text messages on other users' walls.

6. `server.sh` : Reads requests from the unique client pipes, then executes the requested action by calling the appropriate script.

The user profiles for BashBook are stored alongside the bash scripts. The profile directories contain two files:

    friends.txt - Stores the user's friend relationships; can be modified by the add.sh script and accessed by the post.sh script.
    wall.txt - Stores the user's wall, i.e., messages sent to them; can be modified by the post.sh script and accessed by the display.sh script.

Each script includes error handling to output a "nok" message if an error occurs during execution.
