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

**Repository Structure:**

The root directory includes the project documentation: Architecture, Design, Problem Statement, Requirements, Test Report and User Stories, which can be also be accessed through the Group webpage: CS371 Group Project  https://johng148.github.io/Space-Z-Group/

SPACE Z THE GAME directory: includes the actual source game files with all of the linked libraries and the game art that was incorporated.

->GameArt directory: contains the game art library, as well as a directory with game art.

-->asciiArt directory: contains the jpg art files used in the game.

->Graphics directory: contains game architecture diagrams as well a cheater's guide to the game map.

->HPBanner directory: contains the hit points banner library source code.

-->hpgraphics directory: contains the graphics used in the hit points banner.

->NPCs directory: contains the source code for all of the NPCs included in the game.

->Rooms directory: contains the source code for the rooms that make up the space station.

->Zombies directory: contains the zombie class

->compass directory: contains the compass rose library source code (third party extension).

-->compassres directory: contains the graphics used in the compass banner.

-->doc directory: contains documentation for the third party extension.

-->en_us directory: contains another source file for the compass banner extension.

->hints directory: contains the hints source file.

->obj directory: directory automatically created by the TADS engine that contains the compiled object game files.

->CompletedGame directory: contains the playable Windows exectuable and the zip files that can be downlodaded for other systems.


**How to Build and Play Game:**

The game is directly playable on a Windows computer by downloading the executable: https://github.com/johng148/Space-Z-Group/blob/master/The%20Game/Space%20Z%20Group.exe

For MAC users, the player has to download and install the appropriate interpreter for their system: https://www.tads.org/tads3.htm# (either QTads or CocoaTADS).
For Unix/Linux users, the player has to download and install either QTads or FrobTads. FrobTads is a console text-only interpreter: https://www.tads.org/tads3.htm#.
For support in downloading and installing the QTads interpreter refer to https://realnc.github.io/qtads/old_index.html#Download.
Once QTads (or CocoaTADS) has been installed, the player can download the zipped game file from: https://github.com/johng148/Space-Z-Group/blob/master/The%20Game/Space%20Z%20Group.zip.

**Current Progress:**

**Final Implementation (12/13/2020)**

This current version of the game is a fully functional game that can be won, and can also be lost through combat with zombies (the zombies damage the player's health). There are several NPCs throughout the game that the player can interact with, and one provides a useful object. The player can encounter the zombies after they get to a certain level by discovering and picking up the Security key; the zombies won't appear until that time. As in the prior demos, game art now appears when a player looks at an object, and their health is always displayed in the hit points banner. 

**Demo 4 (12/6/2020)**

This is the final demo to be presented in class. In this version, we have finished the combat implementation so that the Zombie class creates a generic zombie type that can be implemented with different characteristics, such as different hit points and different descriptions. We have also consolidated the zombie attacks, so that each zombie has to be attacked separately and dies separately from the other zombie objects that may be present. We also decided to not implement zombie respawning in the same room because it was interfering with the existing zombie objects. The demo also includes an updated key with basic commands. A new major functionality that was included in this version is a banner implementation for game art. ASCII art was created from free image sources and gets displayed for specific objects such as a cactus, the keys, and the zombies, if the player uses the command “Look at X”. The art banner will then show the graphic that is tied to that object, if any.

As in prior demos, the game can be directly run on any Windows platform with the file:
https://github.com/johng148/Space-Z-Group/blob/master/The%20Game/Space%20Z%20Group.exe.

For MAC users, the player has to download and install the appropriate interpreter for their system: https://www.tads.org/tads3.htm# (either QTads or CocoaTADS).

For Unix/Linux users, the player has to download and install either QTads or FrobTads. FrobTads is a console text-only interpreter: 
https://www.tads.org/tads3.htm#.

For support in downloading and installing the QTads interpreter refer to: https://realnc.github.io/qtads/old_index.html#Download.

Once QTads (or CocoaTADS) has been installed, the player can download the zipped game file from:
https://github.com/johng148/Space-Z-Group/blob/master/The%20Game/Space%20Z%20Group.zip


**Demo 3 (11/29/2020)**

In this demo, we have included a zombie class that defines a zombie as a Thing. Also, the storyline now includes specific hints when in a certain room, or when the player is carrying a specific item. In terms of combat implementation, the player can attack the zombie and the zombie also attacks the player and may or may not inflict damage. We also included a test sword that damages the zombie. The player is presented with a key in the beginning of the game that provides game specific commands. Also, another improvement to the game is the addition of a hit points counter. The player can see how many hit points they have at all times. A compass was also added into the banner and gives the player a visual regarding what exits are available in each room.


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





