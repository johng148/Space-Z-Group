
Component Testing<br>
The system we use to test the game is TADS3 Workbench, which is free to download and to use to create Interactive Fiction games. The compiler and IDE is built into the TADS3 Workbench, but the interpreter is not neatly packed into non-Windows systems. The interpreter the team is currently using is HTML TADS, which is included with the TADS3 Author’s Kit package download for Windows. When adding any new component, we can only test it if the whole system is running. However, we only look at that portion of the newly added function when we test. Also, we frequently make a full working copy of the game, including libraries, to test new components such as a banner. When the banner code was added to the game library, it modified the banner API directly, so the bugs that it introduced into the system caused the whole game to crash because the game source files (_main.t and Space Z Group.t) would no longer compile. In order to keep the main components working, the banner library could not be integrated into the game source files until the bugs were removed from the local “test” copy. <br>
After seeing if the separate component tests worked, then we check the whole system for bugs. When choosing a component to test, we look at what actions a player might try and how that could break the game. For example if a player tries to take the zombie an error message should be displayed because the player should not be able to take the enemy as an inventory item. Tests such as this are good and cover expected requirements because players will always try things that may deviate from the path/choices the developer set in place. We have to cover those unexpected silly scenarios to make sure that the game storyline and actions make sense in the physical world.<br><br>
System Testing<br>
We performed system testing for each component we added, right after we added them. For example, we had to test the whole system to add hit points for the player and the functions for damaging the player. We also created a cactus to test the damage and show the changes to the player’s hit points. We started with 5 hit points, and allowed the player to take damage by picking up the cactus and typing damage. This would decrement the player;s health by 1. By adding hit points, we were also able to implement a loss scenario for the game. If the player went down to 0 hit points, the game would end and a “You lost” message would be displayed. To test each addition to our code, we have to run the entire game and then navigate to the area or section where the new code was added. Then we test the new code by calling the methods in the newly run game test. <br>
There was no alternative but to test the whole system every time we added new code, as it was the only way to see if the code worked as intended. It was also necessary because we have to share our code through Github with 4 other group members. Pushing code that wasn’t tested after being added could cause problems for other members' version of the game when they pulled into their local repository. So to mitigate any issues with one person's addition to the Github repository, we made it a requirement to test and run the code before pushing to everyone’s repositories. As a group, this gave us the benefit of working on a project and its source code together, with minimal code overlap and peace of mind while making additions to the system.<br><br>
Acceptance Testing<br>
We tested the whole game every time something major was added such as combat and damage. For each new iteration in our code we tested all the previous iterations as well. For testing our user criteria we would see if we implemented features that adequately satisfied the various use cases and needs from our acceptance criteria. Whenever we would make a test, we would try to design them with the considerations for the end users. For example, testing the implementations multiple times for replayability for the case of the arcade owner.<br>

1: Core features that need to be present........Accepted As Implemented
A game was saved and successfully reloaded and continued from the save point. 
<br>
2: Replayability…………………….............Accepted As Implemented
A random number generator was implemented for player damage so that a zombie can kill the player at any point. The random number generator will create a different scenario each time the game is played.
<br>
3: Captivating storyline…….…………........Not Accepted As Implemented
Storyboard was produced. Due to a lack of NPCs and story depth this was not accepted.
<br>
4: Approachability …………………............Accepted As Implemented
A novice on text-based games was asked to play the game and navigate the controls. He found that it was playable with specific hints and command instructions.
<br>
5: Individuality……………………..............Accepted as Implemented
To test the individuality of our story, we searched for similar games on the Interactive Fiction Archives which publishes games for TADS and similar systems https://www.ifarchive.org/indexes/if-archive/games/tads/. We found 5 games that were potentially similar to ours, but found that none have the same storyline: zombies in space. Others just had similar space themes, such fas 2044: Space Troopers by Angus R. McLaren, or they focused on combat such as Space Shooter: A TADS 3 Abuse by Kristin Fundin. 
<br>
6: Marketability….........................................Not Accepted As Implemented
Sources were found but a need for variety in statistical data is why this was not accepted.
<br>
7: Money Maker………………………...….Not Accepted As Implemented
Since the game is not completed and our research on marketability needs to be expanded this was not accepted.
<br>
8: Age Appropriateness……….….................Not Accepted As Implemented
The storyline is not yet complete, so it has not been fully tested with a broader audience of all ages. The storyline and addition of zombies will likely drive the age appropriateness to a teen or adult.
<br>
9: Representation………………………..…..Not Accepted As Implemented
So far all of the NPCs that have been added are male. We need to add at least one strong female character that will balance the gender base and appeal to more players.
<br>
10: Platform Diversity………………............Accepted As Implemented
The game can be played on multiple computer platforms such as Windows, Linux, Unix, and Mac. We created game files usable on each of these platforms starting with Demo 2.
<br>
11: Average length of gameplay………..…...Not Accepted As Implemented
Since we have not completed the game and the storyboard needs work this is not accepted.
<br>
