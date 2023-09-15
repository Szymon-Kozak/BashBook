# BashBook v2: Multi-User Support

## Overview
The second version of the BashBook project introduces multi-user compatibility, allowing several users to concurrently connect and perform operations on the server. This enhancement is achieved via a new client application (`client.sh`) that liaises with the server (`server.sh`) using named pipes.

## 🔧 Features & Scripts

### 1. Friendship Establishment: `add.sh`
- **Usage:** `add [friend_id]`
- **Description:** Instigates a friendship between two users.
- **Outcome:** The friend's ID is appended to the initiator's `friends.txt`.

### 2. Client Interface: `client.sh`
- **Usage:** `./client.sh [id]`
- **Description:** Acts as the user's interface to send requests to the server.
- **Outcome:** Sends user operations to the server through named pipes.

### 3. User Creation: `create.sh`
- **Usage:** `create`
- **Description:** Constructs a new user profile.
- **Outcome:** Forms a new directory with the designated ID in the Users directory.

### 4. Wall Display: `display.sh`
- **Usage:** `display`
- **Description:** Reveals the content of a user's message wall.
- **Outcome:** Outputs the entirety of the user's `wall.txt` to the console.

### 5. Message Posting: `post.sh`
- **Usage:** `post [receiver_id] [message]`
- **Description:** Enables a user to post messages on another's wall.
- **Outcome:** The message gets added to the receiver's `wall.txt`.

### 6. Server Operations: `server.sh`
- **Usage:** `./server.sh`
- **Description:** The main server script. Processes client requests and invokes the appropriate scripts.
- **Outcome:** Reads and acts on requests from individual client pipes.

## 🗂 Directory Structure

User profiles of BashBook reside beside the bash scripts. Within each user directory are:

- `friends.txt`: A ledger of the user's friendships.
- `wall.txt`: A compendium of messages addressed to the user.

## ⚙️ Error Handling

Comprehensive error handling is integrated into every script. If operations are unsatisfactory, a "nok" message will be relayed to the user.

## 🔍 Getting Started

Kick-off by directing to the `Server` directory containing the scripts. Boot the server with `./server.sh`. To interact, open another terminal, ensure you're in the project directory, and then initiate `./client.sh [id]`, replacing `[id]` with a user name.
