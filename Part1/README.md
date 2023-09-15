# BashBook: Simple Bash Server 

## Overview
BashBook is a bash server that facilitates the foundation of a simple social platform. Users can create profiles, establish friendships, post messages, and view their message walls.

## 🔧 Features & Scripts

### 1. User Creation: `create.sh`
- **Usage:** `./create.sh $id`
- **Description:** Establishes a new user profile.
- **Outcome:** Generates a new directory named `$id` inside the User directory containing `wall.txt` and `friends.txt`.

### 2. Friend Addition: `add_friend.sh`
- **Usage:** `./add_friend.sh $id $friend`
- **Description:** Enables a user (`$id`) to befriend another (`$friend`).
- **Outcome:** Appends the friend's name to the initiator's `friends.txt`.

### 3. Posting Messages: `post_messages.sh`
- **Usage:** `./post_messages.sh $sender $receiver $message`
- **Description:** Allows `$sender` to post `$message` to `$receiver`'s wall.
- **Outcome:** The message is written to the `wall.txt` of the receiver.

### 4. Display Wall: `display_wall.sh`
- **Usage:** `./display_wall.sh $id`
- **Description:** Displays the message wall of a given user `$id`.
- **Outcome:** Console output of the user's `wall.txt`.

### 5. Server Operations: `server.sh`
- **Usage:** `./server.sh $request $id $args1 $args2`
- **Description:** The primary server script governing operations.
- **Outcome:** Processes commands based on `$request` until `quit` is invoked.

## 🗂 Directory Structure

All user profiles are housed in the `User` directory, which is adjacent to the bash scripts. Each user directory encapsulates:

- `friends.txt`: Manifest of the user's friend network. 
- `wall.txt`: Accumulation of messages sent to the user. 

## ⚙️ Error Handling

Comprehensive error handling is integrated into every script. If operations are unsatisfactory, a "nok" message will be relayed to the user.

## 🔍 Getting Started

Begin by navigating to the `Server` directory with the bash scripts. Subsequent operations can be performed as detailed in the *Features & Scripts* section.
