#charset "us-ascii"
#include <adv3.h>
#include <en_us.h>


/*
 * NPC: captain, he is in the brige
 */
captain : Person 'captain' 'captain'  // Defines this NPC as a captain
    @Bridge  // Marks the location of the NPC.
    "The captain is a tall and stern man, his uniform without so much as a blemish on it. You can tell he is not one to stand for disorder "  // A description of the NPC.
    properName = 'Evan A. Cogsgrove'  // The NPC's name.
    globalParamName = 'captain'  // What this NPC is called when using the 
    isHim = true  // Marks the NPC as a he.
    pic = artBanner.showArt('captain') // The art that is displayed when the item is looked at.
;


/*
 *  This defines what the NPC is doing when in conversation.
 */
+ captainTalking : InConversationState  // Defines what the NPC is doing when in conversation.
    stateDesc = "He's talking with you."  // Description of NPC is during a normal conversation.
    specialDesc = "{The captain/he} is standing while 
    talking with you."  // Description of NPC is during a special conversation.
;


/*
 *  This defines what the NPC is doing when not in conversation.
 */
++ captainWorking : ConversationReadyState  // Defines what the NPC is doing when not in conversation.
    stateDesc = "He is overlooking the control panels that operate the station."  // Description of NPC when not in conversation.
  
    // Description of NPC when not in conversation but in a special condition.
    specialDesc = "<<a++ ? '{The captain/he}' : '{A captain/he}'>> 
    is overlooking the controls, his attention unwavering." 

    isInitState = true  // Makes this state the default state of the NPC.
    a = 0  // Used to cue the specialDesc to activate.
;


/*
 *  This is the conversation that is had when the player says hello to the NPC.
 *  <q> places the starting quotation mark.
 *  </q> places the ending quotation mark.
 *  <.p> ends the current paragraph and makes a new line of the next one.
 *  The red single quotation mark that looks like: ' is used at the start and end of a chunk of writing to 
 *  define chunks of words that will be printed out.
 *  In this case the first set is the first interaction with the NPC while the second set is what will 
 *  be printed every other time you say hello.
 */
+++ HelloTopic, StopEventList
    [
      '<q>Hello, sir.</q> you say, trying to pull his attention away.<.p>
      {The captain/he} his gaze darts to you, almost startled.
      <q>Ah, I didnt see you there, what do you need?</q> he says.<.p>
      (You can ask him about himself)<.p>',
      '<q>Captain, something terrible is happening to the station</q> you say worried.<.p>
      <q>That would explain why I haven\'t heard from anyone in a while, I simply thought it was insubordination.</q>
      {the captain/he} says annoyed. He seems more concerned with the disorder, than whats actually happeing.'
    ]
;


/*
 *  This is the conversation that is had when the player Asks the NPC about himself.
 *  <q> places the starting quotation mark.
 *  </q> places the ending quotation mark.
 *  <.p> ends the current paragraph and makes a new line of the next one.
 *  The red quotation marks that looks like: " is used at the start and end of a chunk of writing that 
 *  will be printed out all at once. 
 */
++ AskTopic @veteran
    "<q>Sir, if I may, I know very little about yourself, could you tell me your name?</q> you say.<.p>
    <q>You don't even know the name of your captain? How malcontent! My name is Cpt. Evan A. Cogsgrove, and this is MY station.</q> he replies.<.p>
    <q>Do make a note so you don't forget next time, and fix those ghastly clothes of yours, its like you've been rolling in filth! How dispicable.</q> 
    You get the sense that he\'s
    disgusted by your apperance.<.p>"
;


/*
 *  This is the conversation that is had when the player says bye to the NPC.
 *  <q> places the starting quotation mark.
 *  </q> places the ending quotation mark.
 *  <.p> ends the current paragraph and makes a new line of the next one.
 *  The red quotation marks that looks like: " is used at the start and end of 
 *  a chunk of writing that will be printed out all at once.
 */
+++ ByeTopic
    "<q>Well um... thank you for your time sir.</q> you say, rather confused.<.p>
    <q>Do fix your posture before you come see me again, I wont have the crew of this station be slacking!</q> {the captain/he} turns back to the
    control pannel, brooding as if trying to find a hint of imperfection."
;


/*
 *  This is the conversation that is had when the player says walks away without 
 *  saying bye to the NPC. The red quotation marks that looks like: " is used at the start 
 *  and end of a chunk of writing that will be printed out all at once.
 */
+++ ImpByeTopic
    "{The captain/he} looks aghast that you would simply leave in the middle of a converstaion"
;