#charset "us-ascii"
#include <adv3.h>
#include <en_us.h>

/*
 * NPC: veteran, he is in the security room
 */
veteran : Person 'veteran' 'veteran'  // Defines this NPC as a veteran
  @Securityroom  // Marks the location of the NPC.
  "The veteran is a man in his forties. He has an intimidating presence, made more so
   by his shaggy beard, long hair, and several jagged scars along his arms. 
  You get the sense that he knows how to protect himself and others around him."  // A description of the NPC.
  properName = 'Bill Mitchell'  // The NPC's name.
  globalParamName = 'veteran'  // What this NPC is called when using the 
    //message parameter strings which looks like: {The veteran/he}.
  isHim = true  // Marks the NPC as a he.
;


/*
 *  This defines what the NPC is doing when in conversation.
 */
+ veteranTalking : InConversationState  // Defines what the NPC is doing when in conversation.
  stateDesc = "He's talking with you."  // Description of NPC is during a normal conversation.
  specialDesc = "{The veteran/he} is standing while 
  talking with you."  // Description of NPC is during a special conversation.
;


/*
 *  This defines what the NPC is doing when not in conversation.
 */
++ veteranWorking : ConversationReadyState  // Defines what the NPC is doing when not in conversation.
  stateDesc = "He's just standing there looking at you."  // Description of NPC when not in conversation.
  // Description of NPC when not in conversation but in a special condition.
    specialDesc = "<<a++ ? '{The veteran/he}' : '{A veteran/he}'>> 
  is looking at you. He doesn't even blink while his eyes bore into you." 
 
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
      '<q>Umm, hello.</q> you say, feeling scared to talk to him.<.p>
    {The veteran/he} gets up from his chair, and takes a long look at you, examining you.
     The tension in the room is palpable.
    <q>Who are you and what do you want?</q> he says.<.p>
    (You can ask him about himself)<.p>',
    '<q>Bill, are you all right? There\'s something crazy going on here</q> you say worried.<.p>
    <q>Yeah, I\'ve been seeing everything here in the security cameras.
    I don\'t know exactly what\'s going on here, but what I do know is that we need
    to get weapons, escape, and kill as many of these things before we leave</q>
    {the veteran/he} says calmly. You don\'t know if he\'s blinked at all.'
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
  "<q>Bill, I\'ve never really talked to you but can you tell me a little about yourself. You know... 
  since we\'re probably going to have to survive together</q> you say.<.p>
  <q>Well I\'m surprised that you know my name is Bill. If you\'re wondering, my last name is 
  Mitchell. As you may have heard, I served in the military...two wars, and survived. 
  I have fought my whole life against people and I don\'t plan on 
  letting some...whatever these things are, end me here. 
  I don\'t know exactly what\'s going on here.</q> he replies.<.p>
  <q>And I don\'t really know you, but let me make one thing clear.
  I won\'t hesitate to leave you here if I have to.</q> You get the sense that he\'s
  deadly serious.<.p>"
;


/*
 *  This is the conversation that is had when the player says walks away without 
 *  saying bye to the NPC. The red quotation marks that looks like: " is used at the start 
 *  and end of a chunk of writing that will be printed out all at once.
 */
+++ ImpByeTopic
  "{The veteran/he} gives you a strange look as you walk away in the middle of the conversation. 
  He doesn\'t stop looking at you until you leave the room."
;
