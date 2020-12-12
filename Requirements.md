**Requirements Specification for SPACE Z: THE GAME**

**1. Introduction**

**1.1 Purpose of Product**


The game is a text based game that brings fun to adults and teenagers who enjoy gory stories. The game incorporates captivating storytelling with eye opening pictures that help bring the game’s scenes to light.


**1.2 Scope of Product**


The project includes a space station with interconnected rooms that can be navigated with cardinal directions. We created a combat system for the player to interact and battle zombies, as well as a hit points display that changes as the player loses or gains health. NPCs and objects were integrated into the gameplay so that the player can pick up useful objects, as well as have conversations with NPCs in order to gain knowledge regarding win conditions. The game is also navigable by clicking on a compass that is displayed on an in-game banner, and players can see some object and zombie art by examining objects.

**1.3 Acronyms, Abbreviations, Definitions**

TADS - Text Adventures Development System

IF - Interactive Fiction: These are text-based adventure games that may or not include graphics and sounds. The action is driven by a storyline and choices through text input from the player.

**1.4 References**

https://www.tads.org/

https://www.tads.org/t3doc/doc/t3QuickStart.htm

https://www.tads.org/t3doc/doc/gsg/index.html

https://www.tads.org/t3doc/doc/learning/Learning%20T3.pdf



**2. General Description of Product**

This will be a text based adventure game which involves a main character (the player) traversing a space station after a mysterious outbreak has occurred. This unknown virus is making people very ill and reanimating those that have died. The player must traverse the station to find the cause of the outbreak and eventually escape. The player will be able to talk to various NPCs throughout the station and be able to add them to their party, giving certain benefits.The player will also have various encounters with the aforementioned undead victims, in which they will be able to fight or flee from them. Through the course of the game the player will also be able to obtain various items like weapons and items to help heal the player and the party. The game will end once the player’s HP drops to zero or the player escapes.


**2.1 Context of Product**


The game uses the TADS IDE, but can be exported to an HTML format for browser use.

**2.2 Domain Model with Description**

![Domain Model](https://github.com/johng148/Space-Z-Group/blob/master/SPACE%20Z%20THE%20GAME/Graphics/Domain%20Model.PNG)



The model shows how everything is connected to each other. The player is able to go to each of the rooms, and rooms can have an NPC, an item, and or a keycard; some rooms have none. There could also be zombies in each of the rooms. The player and the zombies would be engaged in combat whenever there is an encounter. The model also shows that the player does not interact with an NPC until the player encounters him/her in a specific room; then direct interaction occurs.

**2.3 Product Functions (general)**

The game will have a basic popup window in which most of the interactions will take place. The user will be able to use this window to input commands that the game can take and then feedback will be shown based on what command was used. Feedback can include text, images and potentially sound.

**2.4 User Characteristics and Expectations**

The user is expected to know the basic commands that are typed such as getting items and using them. The user is also expected to have speakers of some kind so that sounds that are played can be heard.


**2.5 Constraints**

The user will need to have speakers in order for the sound to be played. The user would also need to have the basic functions that are needed to play the game. Get key, for example, or some variation needs to be known in order for the user to get seamless gameplay.

**2.6 Assumptions and Dependencies**

The assumption is that the user will have an operating system installed on their computer that is compatible with the TADS Interpreter; the compatible operating systems are Windows, Mac OSX, or Linux/Unix. The game also depends on the player having installed the TADS Interpreter on their computer.



**3. Functional Requirements**

https://github.com/johng148/Space-Z-Group/blob/master/User%20Stories.md 



**4. System and Non-functional Requirements**

4.1 External Interface Requirements (User,Hardware,Software,Communications)

NF.4.1.1 Sound interface: The user needs to have speakers of some kind in order for sound to be played.

NF.4.1.2 Communications: The user needs to have internet access to download the game from the platform it is hosted on.

**4.2 Performance Requirements**

NF.4.2.1 Sufficient Memory: The player needs a computer with sufficient memory in order for the game mechanics to run smoothly.

NF.4.2.2 Processor Speed: The player needs a computer with a processor of a sufficient caliber in order for the game to run quickly and efficiently.

**4.3 Design Constraints**

NF.4.3.1 Basic typing skills: The player needs to be able to type in commands to progress through the game.

NF.4.3.2 Proficiency in basic English: The player needs to be able to understand basic English to understand and play the game.

**4.4 Quality Requirements**

NF4.4.1 Game Quality: The users expect the game to work every time that it is played. Sounds must work each time no matter what choices they make in the game.

NF.4.4.2 Game Time: The users expect the game to be able to run a long time without stopping for external reasons.

**4.5 Other Requirements**

NF.4.5.1 No other requirements are needed.



**5. Appendices**

Space-Z-Group Domain Model:  https://github.com/johng148/Space-Z-Group/blob/master/SPACE%20Z%20THE%20GAME/Graphics/Domain%20Model.PNG

To download the TADS Interpreter: https://www.tads.org/tads3.htm

A platform for archives and distribution of Interactive Fiction Games: http://www.ifarchive.org

