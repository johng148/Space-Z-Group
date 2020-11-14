# Space-Z-Group
CS371 Group Project
https://johng148.github.io/Space-Z-Group/

**Overview:**
This project is a text-based adventure game where you, the player, begin the journey in the sleeping quarters of a space station. A mysterious outbreak has occurred, and it is your task to find out what has happened. The gameplay is conversation driven, and you may encounter some surprises as you explore.

**Game Description:**
During the exploration of the space station, the player can travel from room to room. In going to the rooms the player can meet NPC's, gather items, and encounter zombies to fight. The fights would be against zombies and it would be turn based. The player would be tasked to make their way throughout the space station into the space shuttle to escape, bringing any surviving NPC’s along. 

**Engine:**

To create the game we are using TADS (Text Adventure Development System) as an engine.
https://www.tads.org/

**Current Progress:**

**Demo 2 (11/8/2020)**
The updates for this Demo version are as follows: We have broken up the source code into separate directories. Also, we have begun to implement combat system by adding functions to increase and decrease health, an object that heals (first aid kit), as well as a base object that deals damage and can kill the player ending the game. The game is directly playable on a Windows computer by downloading the executable: https://github.com/johng148/Space-Z-Group/blob/master/The%20Game/Space%20Z%20Group.exe

For MAC users, the player has to download and install the appropriate interpreter for their system: https://www.tads.org/tads3.htm# (either QTads or CocoaTADS).
For Unix/Linux users, the player has to download and install either QTads or FrobTads. FrobTads is a console text-only interpreter: https://www.tads.org/tads3.htm#.
For support in downloading and installing the QTads interpreter refer to https://realnc.github.io/qtads/old_index.html#Download.
Once QTads (or CocoaTADS) has been installed, the player can download the zipped game file from: https://github.com/johng148/Space-Z-Group/blob/master/The%20Game/Space%20Z%20Group.zip.

**Demo 1 (10/24/2020)**

So far we have two NPCs: a doctor and a veteran. We have also added three objects: a sword, a medkit, and a zombie hand. For the doctor and veteran we added lines and responses. Knowledge was added to only allow players to access specific conversations if they know something about the zombie hand. Room descriptions were also added for some of the rooms. We moved all the keys to the common room to make testing easier.

**Demo 0 (10/4/2020)**

So far we have created rooms for the space station, added some key cards for said rooms, and created a map for the space station.





