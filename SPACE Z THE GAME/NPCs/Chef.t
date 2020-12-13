#charset "us-ascii"
#include <adv3.h>
#include <en_us.h>

/*
 *  This NPC is a chef.
 */
chef: Person 'chef' 'chef'  // Defines that this NPC is a chef.
        @Galley  // Marks the location of the NPC.
        "The chef is wearing a spotless, white, button-down chef's coat, and also wearing a traditional white
            chef's hat. She has long, straight, dark blonde hair that is neatly brushed behind her back.
            "  // A description of the NPC.
        properName = 'Chef Gia Rodriguez'  // The NPC's name.
        globalParamName = 'chef'  // What this NPC is called when using the message 
                                                     //parameter strings which looks like: {The chef/she}.
        isHer = true  // Marks the NPC as a she.
        pic = artBanner.showArt('chef')
;


/*
 *  This defines what the NPC is doing when in conversation.
 */
+ chefTalking : InConversationState  // Defines what the NPC is doing when in conversation.
  stateDesc = "She's talking to you."  // Description of NPC is during a normal conversation.
  specialDesc = "{The chef/she} stops sharpening her knife while talking to you."
    // Description of NPC is during a special conversation.
;


/*
 *  This defines what the NPC is doing when not in conversation.
 */
++ chefWorking : ConversationReadyState  // Defines what the NPC is doing when not in conversation.
    // Description of NPC when not in conversation.
    stateDesc = "She is carefully and very deliberately sharpening a long stainless-steel chef's knife." 
    // Description of NPC when not in conversation but in a special condition.
    specialDesc = "<<a++ ? '{The chef/she}' : '{A chef/she}'>> 
    is sharpening her long chef's knife." 
    isInitState = true  // Makes this state the default state of the NPC.
    a = 0  // Used to cue the specialDesc to activate.
;


/*
 *  This is the conversation that is had when the player says hello to the NPC.
 *  <q> places the starting quotation mark.
 *  </q> places the ending quotation mark.
 *  <.p> ends the current paragraph and makes a new line of the next one.
 *  The red single quotation mark that looks like: ' is used at the start and end of a chunk of 
 *  writing to define chunks of words that will be printed out.
 *  In this case the first set is the first interaction with the NPC while the second set is what will 
 *  be printed every other time you say hello.
 */
+++ HelloTopic, StopEventList
  [
    '<q>Hi, can you please talk to me?</q> you say, trying to get the chef\'s attention.<.p>
    {The chef/she} stops sharpening the chef\'s knife she is holding in her right hand to
    look at you. <q>Where did you come from?</q> she asks you in a panicked voice.<.p>
    <q>Never mind! </q> she interrupts without giving you time to respond.<.p>
    <q>Do you know what is going on out there? </q>she asks you in a near shout.<.p>
    <> I have no idea what\'s going on either....</q> you trail off.<.p>'
  ]
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
    "<q>Good luck to you. I hope you are able to stay safe here.</q> you say.<.p>
    <q>Before you leave, make sure that you take the knife with you. You\'ll need
    some protection.</q> > She says with an earnest look on her face.<.p>" 
;


/*
 *  This is the conversation that is had when the player says walks away 
 *  without saying bye to the NPC.
 *  The red quotation marks that looks like: " is used at the start and end of
 *  a chunk of writing that will be printed out all at once.
 */
+++ ImpByeTopic
  "{The chef/she} waves goodbye with a crestfallen expression on her face."
;


++ AskForTopic @Knife
   topicResponse
   {
      "<q>Do you have a knife you can spare?</q> you ask.<.p>
      <q>Yes. Of course, </q> she replies, instantly reaching for a drawer to her left.
		She opens the drawer and hands you the knife, closing the drawer with a decisive
		click.<.p>
	  <q>Thanks</q> you say to her.<.p>"
	;
      Knife.moveInto(gActor);      
   }
;


++ AskForTopic @Knife
  "She doesn't have anymore spare knives. "
  isConversational = nil
;


++ AskTellTopic @Knife
  "<q>That is a very long and sharp-looking knife</q> you remark.\b
   <q>I take great pride in keeping my knives sharp </q>
    {the chef/she} replies. <q> You never know when a sharp tool might be useful </q> she
	continues caustically<.p> <q> Especially right now, with the station in chaos, and
	no one stepping up to tell us what in the world is going on! </q> she finishes in a temper<.p>"
;


++ DefaultAskTellTopic
	"<q>I have no idea what in the world is happening out there, but I'm staying put right here,
	at least until security figures it out</q>she tells you.<.p><q> At least here, I've got my knife,
	I know my kitchen, and I can take care of myself!</q> she finishes with a determined look 
	on her face. <.p><q> Besides, those things.... </q> she trails off.<.p>"
;


++ AskTopic @chef
    "<q>I'm sorry doctor could you tell me what your name is again? Also, what is 
    going on here?</q> you ask worried.<.p>"
//    <q>After all these years working together you still keep forgetting my name? 
//    My name is <<doctor.properName>>.</q> he replies.<.p>
//    <q>To answer your second question we are in the middle of a zombie outbreak. Something went 
//    wrong and now we are among the undead.
//    Maybe I can find a solution. I need to work on testing samples.</q> he replies.<.p> 
//    <.convnode doctor-samples>"
;


	// This is the conversation is a SpecialTopic which is had when the conversation 
	// node is triggered, and the user chose this path.
++ SpecialTopic 'what things/ask about things' ['ask', 'what', 'about', 'things']  
    
    "<q>What things are you talking about?</q> you ask.<.p>
    <q>I'm probably being fanciful</q> she replies.<.p><p> But I thought I saw... these...
	people....only they're not really people... I don't know anymore! I'm probably imagining it!</p>
	she ends in a terrified quaver.<.p> "
;
