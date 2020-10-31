Project Overview:<br/>
This project is a text-based adventure game where you, the player, begin the journey in the sleeping quarters of a space station. A mysterious outbreak has occurred, and it is your task to find out what has happened. The gameplay is conversation driven, and you may encounter some surprises as you explore. During the exploration of the space station, the player can travel from room to room. Upon entering the rooms the player can meet NPC's, gather items, and encounter zombies to fight. The fights against zombies will be turn-based. The player would be tasked to make their way throughout the space station into the space shuttle to escape, bringing any surviving NPC’s along.
<br/>
<br/>
Key Architectural Drivers:<br/>
Several key factors that influenced our architecture choice include the ability to add and implement different actions in real time because action paths are not expressly pre-defined. The game must implement a style of gameplay that simulates a freedom of choice for the player. Another factor is that the architecture must also have preferential functionality for text-based games to adhere to our game type. The system must also be customizable to create our own library. A key factor regarding these libraries is that packaging customized libraries should be simple for game developers and installing and running the customized libraries should be easy for players.
<br/>
<br/>
Architectural Style Information:<br/>
Pipe-and-Filter is an architectural style that has components called filters and pipes which are connectors that transmit the data from one filter to another without modifying it. In this architecture style, these components (filters) are reusable, because each receives an input, transforms the data or performs an action, then has an output. One of its key advantages is that these filters can be introduced, replaced and removed without modifying other parts of the system. Each filter parses the given input first before performing its action.
<br/>
<br/>
Architectural Style Choice:
We chose Pipe-and-Filter based architecture, because we have many paths that a player can choose from, so the filters (events) will definitely be useful. These filters can simply be added, removed or replaced and don’t require us to modify other parts of our system. 
<br/>
<br/>







<br/>
<br/>
Pipe-and-Filter Model Description:<br/>
The first filter is the actor, this is the player in the game. The player can move in between rooms, and get keys, objects, that can be found in the rooms. For each room there can be combat, NPC’s, Objects and Zombies. If combat is chosen by the system then the enemy would be zombies, and the zombies would be in the room that the player entered. Through combat the player needs to survive via fighting or fleeing, otherwise they will die. The actor can win by surviving long enough to get to the win condition. 
<br/>
<br/>
Conclusion:<br/>
Although Pipe-and-Filter is the chosen style of architecture, this architure style does have issues for the game implementation. The main issue is that the system needs to parse input data before performing a computation and then converting the result back to a fixed data format for output. This repeated parsing and unparsing of data can slow down the performance of the system. Due to this issue, construction of individual filters may become very complex. This type of architecture also introduces the risk that one filter or event count could interfere with the function of another if that action does not fully resolve before the next event. Filters need to be added and implemented in a consistent way that do not conflict with the output of other filters.
<br/>
<br/>
