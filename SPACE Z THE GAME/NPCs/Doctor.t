#charset "us-ascii"
#include <adv3.h>
#include <en_us.h>


/*
 *  This is an NPC that is an doctor.
 */
doctor : Person 'doctor' 'doctor'  // Defines that this is an NPC that is a doctor.
    @MedBay  // Marks the location of the NPC.
    "He looks terrified. "  // A description of the NPC.
    properName = 'Dr. Dwight Darcy'  // The NPC's name.
    globalParamName = 'doctor'  // What this NPC is called when using the message 
    isHim = true  // Marks the NPC as a he.
    pic = artBanner.showArt('doctor') // The art that is displayed when the item is looked at.
;


/*
 *  This defines what the NPC is doing when in conversation.
 */
+ doctorTalking : InConversationState  // Defines what the NPC is doing when in conversation.
    stateDesc = "He's talking with you."  // Description of NPC is during a normal conversation.
    specialDesc = "{The doctor/he} is standing while talking with you."  // Description of NPC is during a special conversation.
;


/*
 *  This defines what the NPC is doing when not in conversation.
 */
++ doctorWorking : ConversationReadyState  // Defines what the NPC is doing when not in conversation.
    
    // Description of NPC when not in conversation.
    stateDesc = "He's busily running around the MedBay grabbing medical supplies." 
    
    // Description of NPC when not in conversation but in a special condition.
    specialDesc = "<<a++ ? '{The doctor/he}' : '{A doctor/he}'>> 
    is busily running around the Med Bay grabbing medical supplies." 
    
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
        '<q>Er, excuse me.</q> you say, trying to get his attention.<.p>
        {The doctor/he} stops running around the Med Bay and looks at you.
        <q>Something has gone seriously wrong here!</q> he yells.<.p>
        (Ask him about himself)<.p>',
        '<q>Doctor?</q> you ask worried.<.p>
        <q>Yes?</q> {the doctor/he} says turning to look at you.'
    ]
;


/*
 *  This is the conversation that is had when the player Asks the NPC about himself.
 *  <q> places the starting quotation mark.
 *  </q> places the ending quotation mark.
 *  <.p> ends the current paragraph and makes a new line of the next one.
 *  The red quotation marks that looks like: " is used at the start and end of a chunk of 
 *  writing that will be printed out all at once.
 *  <<doctor.properName>> grabs the name of the NPC.
 *  <.convnode doctor-samples> is a conversation node that directs the conversation 
 *  to the SpecialTopic.
 */
++ AskTopic @doctor
    "<q>I'm sorry doctor could you tell me what your name is again? Also, what is 
    going on here?</q> you ask worried.<.p>
    <q>After all these years working together you still keep forgetting my name? 
    My name is <<doctor.properName>>.</q> he replies.<.p>
    <q>To answer your second question we are in the middle of a zombie outbreak. Something went 
    wrong and now we are among the undead.
    Maybe I can find a solution. I need to work on testing samples.</q> he replies.<.p> 
    <.convnode doctor-samples>"
;


/*
 *  This is the conversation is a AskTellTopic which is had when the player Asks the NPC 
 *  about something that the player has gained knowledge about.
 *  <q> places the starting quotation mark.
 *  </q> places the ending quotation mark.
 *  <.p> ends the current paragraph and makes a new line of the next one.
 *  The red single quotation mark that looks like: ' is used at the start and end of a 
 *  chunk of writing to define chunks of words that will be printed out.
 *  In this case the first set is the first interaction with the NPC while the second set is 
 *  what will be printed every other time you ask about the topic.
 */
++ AskTellTopic, StopEventList @sample
  [
    '<q>What do you think you will find out about these monsters from the samples?</q> you 
    ask.<.p>
    <q>We could find out a lot of information if we had time, but we don\'t so I\'ll stick with 
    finding out any weaknesses they have that we can use against them.</q> he states.<.p>
    <q>Maybe I could help find some samples?</q> you ask.<.p>
    <q>That would be wonderful!</q> he shouts excitedly.<.p>',
    '<q>Any samples you find will be of great use!</q> he replies.<.p>'
  ]
;


/*
 *  This is the alt conversation to the AskTellTopic that is had when the player has 
 *  seen a specific object.
 *  <q> places the starting quotation mark.
 *  </q> places the ending quotation mark.
 *  <.p> ends the current paragraph and makes a new line of the next one.
 *  The red quotation marks that looks like: " is used at the start and end of a chunk 
 *  of writing that will be printed out all at once.
 */
+++ AltTopic
    "<q>Can a severed zombie hand help any as a sample?</q> you ask him<.p>
    <q>That is a perfect sample! Just imagine what we can find out about these horrible creatures.</q> he remarks excitedly.<.p>"

    // isActive becomes true if the player has seen the object.
    isActive = (gPlayerChar.hasSeen(sample))  
;


/*
 *  This is the conversation node that has the conversation redirected to 
 *  the SpecialTopic.
 */
+ ConvNode 'doctor-samples';


/*
 *  This is the conversation is a SpecialTopic which is had when the conversation 
 *  node is triggered, and the user chose this path.
 *  <q> places the starting quotation mark.
 *  </q> places the ending quotation mark.
 *  <.p> ends the current paragraph and makes a new line of the next one.
 *  The red single quotation mark that looks like: ' is used at the start and end of a chunk 
 *  of writing to define chunks of words that will be printed out.
 *  In this case the first set is the first interaction with the NPC while the second set is 
 *  what will be printed every other time you ask about the topic.
 *  <.convstay> keeps the player in the conversation until the type in the correct response.
 */
++ SpecialTopic, StopEventList    
    'ask more about zombies'  // What the player can ask.  

    ['ask', 'more', 'about', 'zombies']  // Words that are used to cue this conversation.
    
    [
        '<q>Did you say zombies?</q> you ask.<.p>
        <q>Yes.</q> he replied shaken.<.p>(more) <.convstay>',
        '<q>What should we do?</q> you question.<.p>
        <q>Try to get to the shuttles.</q> he replied.<.p>(bye) <.convstay>'
    ]
;


/*
 *  This is the conversation is a SpecialTopic which is had when the conversation 
 *  node is triggered, and the user chose this path.
 *  <q> places the starting quotation mark.
 *  </q> places the ending quotation mark.
 *  <.p> ends the current paragraph and makes a new line of the next one.
 *  The red quotation marks that looks like: " is used at the start and end of a chunk of 
 *  writing that will be printed out all at once.
 *  <<gSetKnown(sample)>> marks the player has having learned something.
 */
++ SpecialTopic 'ask what he is doing with samples' ['ask', 'what', 'he', 'is', 'doing', 'with', 'samples']  
    
    // What the player can ask and the words that are used to cue this conversation.
    "<q>Why are you collecting samples at a time like this?</q> you ask.<.p>
    <q>I am hoping to find more out about this zombie virus.</q> he replied.<.p>
    (Ask about sample)<.p> <<gSetKnown(sample)>>"
;


/*
 *  This is the conversation is a DefaultAskTellTopic which is had when the user 
 *  responds with an answer that is not one of the provided choices for the 
 *  SpecialTopic conversation.
 *  <q> places the starting quotation mark.
 *  </q> places the ending quotation mark.
 *  <.p> ends the current paragraph and makes a new line of the next one.
 *  The red quotation marks that looks like: " is used at the start and end of a chunk of 
 *  writing that will be printed out all at once.
 *  <.convstay> keeps the player in the conversation until the type in the correct response.
 */
++ DefaultAskTellTopic
    "<q>Umm...</q> you are not sure what to ask.<.p>
    <q>Did you want to know about zombies or something? 
    Maybe about the samples I want?</q> he asks. <.convstay>"
;


/*
 *  This is the conversation is a GiveTopic that is had when the player gives a 
 *  specific object to the NPC.
 *  <q> places the starting quotation mark.
 *  </q> places the ending quotation mark.
 *  <.p> ends the current paragraph and makes a new line of the next one.
 *  The red quotation marks that looks like: " is used at the start and end of a 
 *  chunk of writing that will be printed out all at once.
 */
+ GiveTopic
    matchObj = sample  // States what object we are looking for.
    topicResponse()  // Response printed out if the object is a match.
    {
        "<q>Is that a sample? It is just what I wanted!</q> he replies excitedly.<.p>";
        sample.moveInto(doctor);  // Moves the object to the doctor.
    }
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
    "<q>I'm going to continue searching.</q> you say.<.p>
    <q>I can't stop you so be safe.</q> {the doctor/he} turns away and continues
    to frantically grab medical supplies and stuff them them into a duffel bag."
;


/*
 *  This is the conversation that is had when the player says walks away 
 *  without saying bye to the NPC.
 *  The red quotation marks that looks like: " is used at the start and end of
 *  a chunk of writing that will be printed out all at once.
 */
+++ ImpByeTopic
    "{The doctor/he} gives you a strange look as you walk 
    away in the middle of the conversation. He then continues to stuff medical supplies
    into a duffel bag."
;