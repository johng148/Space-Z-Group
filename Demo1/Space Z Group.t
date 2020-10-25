#charset "us-ascii"

/*
 *   Copyright (c) 1999, 2002 by Michael J. Roberts.  Permission is
 *   granted to anyone to copy and use this file for any purpose.  
 *   
 *   This is a starter TADS 3 source file.  This is a complete TADS game
 *   that you can compile and run.
 *   
 *   To compile this game in TADS Workbench, open the "Build" menu and
 *   select "Compile for Debugging."  To run the game, after compiling it,
 *   open the "Debug" menu and select "Go."
 *   
 *   This is the "advanced" starter game - it has only the minimum set of
 *   definitions needed for a working game.  If you would like some more
 *   examples, create a new game, and choose the "introductory" version
 *   when asked for the type of starter game to create.  
 */

/* 
 *   Include the main header for the standard TADS 3 adventure library.
 *   Note that this does NOT include the entire source code for the
 *   library; this merely includes some definitions for our use here.  The
 *   main library must be "linked" into the finished program by including
 *   the file "adv3.tl" in the list of modules specified when compiling.
 *   In TADS Workbench, simply include adv3.tl in the "Source Files"
 *   section of the project.
 *   
 *   Also include the US English definitions, since this game is written
 *   in English.  
 */
#include <adv3.h>
#include <en_us.h>

/*
 *   Our game credits and version information.  This object isn't required
 *   by the system, but our GameInfo initialization above needs this for
 *   some of its information.
 *   
 *   You'll have to customize some of the text below, as marked: the name
 *   of your game, your byline, and so on.
 */
versionInfo: GameID
    IFID = '349b9587-c79f-4bd2-af42-e04570ad5f8b'
    name = 'Demo 1'
    byline = 'by Johnathon Garcia, Meagan Waldo, Kashka Calvin, Erik Alvarez,  Nasley Chumacero-Martin'
    htmlByline = 'by <a href="mailto:john48@nmsu.edu, mwaldo@nmsu.edu, kashka@nmsu.edu">
                  Johnathon Garcia, Meagan Waldo, Kashka Calvin, Erik Alvarez,  Nasley Chumacero-Martin</a>'
    version = '1'
    authorEmail = 'Johnathon Garcia, Meagan Waldo, Kashka Calvin, Erik Alvarez,  Nasley Chumacero-Martin <john48@nmsu.edu, mwaldo@nmsu.edu, kashka@nmsu.edu>'
    desc = 'DEMO 1!'
    htmlDesc = 'DEMO 1!'
;

/*
 *   The "gameMain" object lets us set the initial player character and
 *   control the game's startup procedure.  Every game must define this
 *   object.  For convenience, we inherit from the library's GameMainDef
 *   class, which defines suitable defaults for most of this object's
 *   required methods and properties.  
 */
gameMain: GameMainDef
    /* the initial player character is 'me' */
    initialPlayerChar = me
;

/* 
 *   Starting location - we'll use this as the player character's initial
 *   location.  The name of the starting location isn't important to the
 *   library, but note that it has to match up with the initial location
 *   for the player character, defined in the "me" object below.
 *   
 *   Our definition defines two strings.  The first string, which must be
 *   in single quotes, is the "name" of the room; the name is displayed on
 *   the status line and each time the player enters the room.  The second
 *   string, which must be in double quotes, is the "description" of the
 *   room, which is a full description of the room.  This is displayed when
 *   the player types "look around," when the player first enters the room,
 *   and any time the player enters the room when playing in VERBOSE mode.
 *   
 *   The name "startRoom" isn't special - you can change this any other
 *   name you'd prefer.  The player character's starting location is simply
 *   the location where the "me" actor is initially located.  
 */
SleepingQuarter: Room 'Sleeping quarters'
    "You start off in your Sleeping Quarters. "
    east = Commondoor
    west = Bathdoor
;

+ Bathdoor: LockableWithKey, Door 'Bath door' 'Bath door'
    "door in Sleeping quarters to bathroom"
    keyList = [BathKey]
    
;

+ Commondoor: Door 'Common door' 'Common door'
    "door in bedroom to commonroom"
;
    
Bathroom: Room 'Bathroom'
    "bathrooms and lockers for spacestation. "

    east = InBathdoor
;

+ InBathdoor: LockableWithKey, Door -> Bathdoor 'Bath door' 'Bath door'
    "door in bathroom to bedrooms"
        keyList = [BathKey]
;

CommonRoom: Room 'Common room'
    "Room for recreational activities. "

    north = Dockingdoor
    south = Messdoor
    west = inCommondoor
    east = Meddoor
;
+ inCommondoor: Door -> Commondoor 'Common door' 'Common door'
    "door in common to bedroom"
;
+ Dockingdoor: Door 'Docking door' 'Docking door'
    "door in commonroom to docking compartment"
;
+ Messdoor: Door 'Mess door' 'Mess door'
    "door in commonroom to messroom"
;
+ Meddoor: LockableWithKey, Door 'Med door' 'Med door'
    "door in commonroom to medbay"
        keyList = [MedKey]
;
DockingComp: Room 'Docking Compartment'
    "room connecting Docking Compartment and Shuttle Bay."
    
    east = Shuttledoor
    south = InDockingdoor
;
+ InDockingdoor: Door -> Dockingdoor 'Docking door' 'Docking door'
    "door in docking compartment to commonroom"
;
+ Shuttledoor:LockableWithKey, Door 'Shuttle Bay door' 'Shuttle Bay door'
    "door in Docking compartment to Shuttle bay."
    keyList = [ShuttleKey]
;

ShuttleBay: Room 'Shuttle Bay'
    "room to escape/win games"
    
    west = InShuttledoor
;
+ InShuttledoor: Lockable, Door -> Shuttledoor 'Shuttle Bay door' 'Shuttle Bay door'
    "door in Shuttle Bay to Docking compartment."
;


MessHall: Room 'Mess Hall'
    "room where everyone eats."
    
    west = Galleydoor
    north = InMessdoor
;

+ InMessdoor: Door -> Messdoor 'Mess door' 'Mess door'
    "door in messroom to commonroom"
;

+ Galleydoor: Door 'Galley door' 'Galley door'
    "door in messhall to Galley"
;

Galley: Room 'Galley'
    "room with chef starting point"
    
    east = InGalleydoor
;

+ InGalleydoor: Door -> Galleydoor 'Galley door' 'Galley door'
    "door in Galley to messhall"
;

MedBay: Room 'MedBay'
    "room with doctor starting point"
   
    west = InMeddoor
    south = Securitydoor
;

+ InMeddoor: LockableWithKey, Door -> Meddoor 'Med door' 'Med door'
    "doon in medbay to Commonroom"
;


+ Securitydoor: LockableWithKey, Door 'Security door' 'Security door'
    "door in medbay to Security room"
    keyList = [SecurityKey]
;

//Added First aid kit object in med bay
+ FirstAidKit: Thing 'First aid kit' 'First aid kit'
    "A first aid kit that can be used to heal most wounds."
;
Securityroom: Room 'Security room'
    "room with veteran in it"
    
    north = InSecuritydoor
    east = Bridgedoor
;

+ InSecuritydoor: Lockable,  Door -> Securitydoor 'Security door' 'Security door'
    "Door in security room to Medbay"
;

+ Bridgedoor: Door 'Bridge door' 'Bridge door'
    "door in security room to Bridge."
;

//Added a sword object in the security room
+ Sword: Thing 'Sword' 'Sword'
    "A well sharpened sword, could be useful"
;
Bridge: Room 'Bridge'
    "Bridge with communications tower"
    
    west = InBridgedoor
;
+ InBridgedoor: Door -> Bridgedoor 'Bridge door' 'Bridge door'
    "door in Bridge  to Security room."
;
SecurityKey : Key 'Security key card' 'Security key card' @Bathroom;
MedKey : Key 'MedBay key card' 'MedBay key card' @Galley;
ShuttleKey : Key 'Shuttle bay key card' 'Shuttle bay key card' @Bridge;
BathKey : Key 'bathroom key card' 'bathroom key card' @MedBay;



/*
 *  This object is a dismembered zombie hand that can be used by the doctor as a sample.
 */
sample : Thing  
  name = 'sample'  // Name of the object.
  noun = 'sample' 'zombie hand'  // Nouns that the object may be known as.
  desc = "A dismembered rotten zombie hand. Luckily it is motionless. Maybe we should take it to the doctor? He could use this as a sample."  // Description of the object.
  adjective = 'rotten' 'dismembered'  // Attributes that the object has.
  location = Bathroom  // Location of the object.
;  


/*
 *  This is an NPC that is an doctor.
 */
doctor : Person 'doctor' 'doctor'  // Defines that this is an NPC that is a doctor.
  @MedBay  // Marks the location of the NPC.
  "His white coat has splatters of blood. "  // A description of the NPC.
  properName = 'Dr. Dwight Darcy'  // The NPC's name.
  globalParamName = 'doctor'  // What this NPC is called when using the message parameter strings which looks like: {The doctor/he}.
  isHim = true  // Marks the NPC as a he.
;


/*
 *  This defines what the NPC is doing when in conversation.
 */
+ doctorTalking : InConversationState  // Defines what the NPC is doing when in conversation.
  stateDesc = "He's talking with you."  // Description of NPC is during a normal conversation.
  specialDesc = "{The doctor/he} is standing while 
  talking with you."  // Description of NPC is during a special conversation.
;


/*
 *  This defines what the NPC is doing when not in conversation.
 */
++ doctorWorking : ConversationReadyState  // Defines what the NPC is doing when not in conversation.
  stateDesc = "He's busily running around the MedBay grabbing medical supplies."  // Description of NPC when not in conversation.
  specialDesc = "<<a++ ? '{The doctor/he}' : '{A doctor/he}'>> 
  is busily running around the MedBay grabbing medical supplies." // Description of NPC when not in conversation but in a special condition.
  isInitState = true  // Makes this state the default state of the NPC.
  a = 0  // Used to cue the specialDesc to activate.
;


/*
 *  This is the conversation that is had when the player says hello to the NPC.
 *  <q> places the starting quotation mark.
 *  </q> places the ending quotation mark.
 *  <.p> ends the current paragraph and makes a new line of the next one.
 *  The red single quotation mark that looks like: ' is used at the start and end of a chunk of writing to define chunks of words that will be printed out.
 *  In this case the first set is the first interaction with the NPC while the second set is what will be printed every other time you say hello.
 */
+++ HelloTopic, StopEventList
  [
    '<q>Er, excuse me.</q> you say, trying to get his attention.<.p>
    {The doctor/he} stops running around the MedBay and looks at you.
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
 *  The red quotation marks that looks like: " is used at the start and end of a chunk of writing that will be printed out all at once.
 *  <<doctor.properName>> grabs the name of the NPC.
 *  <.convnode doctor-samples> is a conversation node that directs the conversation to the SpecialTopic.
 */
++ AskTopic @doctor
  "<q>I'm sorry doctor could you tell me what your name is again? Also, what is going on here?</q> you ask worried.<.p>
  <q>After all these years working together you still keep forgetting my name? My name is <<doctor.properName>>.</q> he replies.<.p>
  <q>To answer your second question we are in the middle of a zombie outbreak. Something went wrong and now we are among the undead.
  Maybe I can find a solution. I need to work on testing samples.</q> he replies.<.p> <.convnode doctor-samples>"
;


/*
 *  This is the conversation is a AskTellTopic which is had when the player Asks the NPC about something that the player has gained knowledge about.
 *  <q> places the starting quotation mark.
 *  </q> places the ending quotation mark.
 *  <.p> ends the current paragraph and makes a new line of the next one.
 *  The red single quotation mark that looks like: ' is used at the start and end of a chunk of writing to define chunks of words that will be printed out.
 *  In this case the first set is the first interaction with the NPC while the second set is what will be printed every other time you ask about the topic.
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
 *  This is the alt conversation to the AskTellTopic that is had when the player has seen a specific object.
 *  <q> places the starting quotation mark.
 *  </q> places the ending quotation mark.
 *  <.p> ends the current paragraph and makes a new line of the next one.
 *  The red quotation marks that looks like: " is used at the start and end of a chunk of writing that will be printed out all at once.
 */
+++ AltTopic
  "<q>Can a severed zombie hand help any as a sample?</q> you
  ask him<.p>
  <q>That is a perfect sample! Just imagine what we can find out about these horrible creatures.</q> he remarks excitedly.<.p>"
  isActive = (gPlayerChar.hasSeen(sample))  // isActive becomes true if the player has seen the object.
;


/*
 *  This is the conversation node that has the conversation redirected to the SpecialTopic.
 */
+ ConvNode 'doctor-samples';


/*
 *  This is the conversation is a SpecialTopic which is had when the conversation node is triggered, and the user chose this path.
 *  <q> places the starting quotation mark.
 *  </q> places the ending quotation mark.
 *  <.p> ends the current paragraph and makes a new line of the next one.
 *  The red single quotation mark that looks like: ' is used at the start and end of a chunk of writing to define chunks of words that will be printed out.
 *  In this case the first set is the first interaction with the NPC while the second set is what will be printed every other time you ask about the topic.
 *  <.convstay> keeps the player in the conversation until the type in the correct response.
 */
++ SpecialTopic, StopEventList    
  'ask more about zombies'  // What the player can ask.  
  ['ask', 'more', 'about', 'zombies']  // Words that are used to cue this conversation.
  [
    '<q>Did you say zombies?</q> you ask.<.p>
    <q>Yes.</q> he replied shaken.<.p>(more) <.convstay>',
    '<q>What should we do?</q> you 
    question.<.p>
    <q>Try to get to the shuttles.</q> he replied.<.p>(bye) <.convstay>'
  ]
;


/*
 *  This is the conversation is a SpecialTopic which is had when the conversation node is triggered, and the user chose this path.
 *  <q> places the starting quotation mark.
 *  </q> places the ending quotation mark.
 *  <.p> ends the current paragraph and makes a new line of the next one.
 *  The red quotation marks that looks like: " is used at the start and end of a chunk of writing that will be printed out all at once.
 *  <<gSetKnown(sample)>> marks the player has having learned something.
 */
++ SpecialTopic 'ask what he is doing with samples' ['ask', 'what', 'he', 'is', 'doing', 'with', 'samples']  // What the player can ask and the words that are used to cue this conversation.
  "<q>Why are you collecting samples at a time like this?</q> you ask.<.p>
  <q>I am hoping to find more out about this zombie virus.</q> he replied.<.p>(Ask about sample)<.p> <<gSetKnown(sample)>>"
;


/*
 *  This is the conversation is a DefaultAskTellTopic which is had when the user responds with an answer that is not one of the provided choices for the SpecialTopic conversation.
 *  <q> places the starting quotation mark.
 *  </q> places the ending quotation mark.
 *  <.p> ends the current paragraph and makes a new line of the next one.
 *  The red quotation marks that looks like: " is used at the start and end of a chunk of writing that will be printed out all at once.
 *  <.convstay> keeps the player in the conversation until the type in the correct response.
 */
++ DefaultAskTellTopic
  "<q>Umm...</q> you are not sure what to ask.<.p>
  <q>Did you want to know about zombies or something? Maybe about the samples I want?</q> he asks. <.convstay>"
;


/*
 *  This is the conversation is a GiveTopic that is had when the player gives a specific object to the NPC.
 *  <q> places the starting quotation mark.
 *  </q> places the ending quotation mark.
 *  <.p> ends the current paragraph and makes a new line of the next one.
 *  The red quotation marks that looks like: " is used at the start and end of a chunk of writing that will be printed out all at once.
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
 *  The red quotation marks that looks like: " is used at the start and end of a chunk of writing that will be printed out all at once.
 */
+++ ByeTopic
  "<q>I'm going to continue searching.</q> you say.<.p>
  <q>I can't stop you so be safe.</q> {the doctor/he} turns away and continues 
  busily running around the MedBay grabbing medical supplies. "
;


/*
 *  This is the conversation that is had when the player says walks away without saying bye to the NPC.
 *  The red quotation marks that looks like: " is used at the start and end of a chunk of writing that will be printed out all at once.
 */
+++ ImpByeTopic
  "{The doctor/he} gives you a strange look as you walk away in the middle of the conversation. 
  He then continues busily running around the MedBay grabbing medical supplies."
;


//this is code for the veteran, he is in the armory
veteran : Person 'veteran' 'veteran'  // Defines that this is an NPC that is a doctor.
  @Securityroom  // Marks the location of the NPC.
  "The veteran is a man in his forties with a beard and long hair. He seems cold and has scars along his arms.
  You get the sense that he knows how to protect himself and others around him"  // A description of the NPC.
  properName = 'Bill Mitchel'  // The NPC's name.
  globalParamName = 'veteran'  // What this NPC is called when using the message parameter strings which looks like: {The doctor/he}.
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
  specialDesc = "<<a++ ? '{The veteran/he}' : '{A veteran/he}'>> 
  is looking at you. He's non moving just looking at you." // Description of NPC when not in conversation but in a special condition.
  isInitState = true  // Makes this state the default state of the NPC.
  a = 0  // Used to cue the specialDesc to activate.
;

/*
 *  This is the conversation that is had when the player says hello to the NPC.
 *  <q> places the starting quotation mark.
 *  </q> places the ending quotation mark.
 *  <.p> ends the current paragraph and makes a new line of the next one.
 *  The red single quotation mark that looks like: ' is used at the start and end of a chunk of writing to define chunks of words that will be printed out.
 *  In this case the first set is the first interaction with the NPC while the second set is what will be printed every other time you say hello.
 */
+++ HelloTopic, StopEventList
  [
      '<q>Umm, hello.</q> you say, feeling scared to talk to him.<.p>
    {The veteran/he} gets up from his char, and takes a long look at you, examining you.
      You get the idea that the tension to be high.
    <q>Who are you and what do you want?</q> he says.<.p>
    (You can ask him about himself)<.p>',
    '<q>Bill, are you all right? Theres something crazy going on here</q> you say worringly.<.p>
    <q>Yeah, I\'ve been seeing everything here in the security cameras.
    I don\'t know exactly whats going on here but what I do know is that we need
    to get weapons, escape, and kill as many of them before we leave</q>
    {the veteran/he} says looking at you still staring. You don\'t know if hes blinked at all'
  ]
;

/*
 *  This is the conversation that is had when the player Asks the NPC about himself.
 *  <q> places the starting quotation mark.
 *  </q> places the ending quotation mark.
 *  <.p> ends the current paragraph and makes a new line of the next one.
 *  The red quotation marks that looks like: " is used at the start and end of a chunk of writing that will be printed out all at once.
 *  <<doctor.properName>> grabs the name of the NPC.
 *  <.convnode doctor-samples> is a conversation node that directs the conversation to the SpecialTopic.
 */
++ AskTopic @veteran
  "<q>Bill, I\'ve never really talked to you but can you tell me a little about yourself. You know... 
  since were probablly going to have to survive together</q> you say.<.p>
  <q>Well I\'m surprised that you know my name is Bill. If your wondering my last name is 
  Mitchell. As you may have heard I served in 
  two wars and won them. I have fought my whole life against people and I don\'t plan on 
  letting some zombies end me here. I don\'t know exactly what\'s going on here.</q> he replies.<.p>
  <q>I don\'t really know you as well but let me make one thing clear.
  I won\'t hesitate to leave you here if I have to.</q> he replies. You get the sense that he\'s serious 
  on what he says<.p> <.convnode doctor-samples>"
;




/*
 *  This is the conversation that is had when the player says walks away without saying bye to the NPC.
 *  The red quotation marks that looks like: " is used at the start and end of a chunk of writing that will be printed out all at once.
 */
+++ ImpByeTopic
  "{The veteran/he} gives you a strange look as you walk away in the middle of the conversation. 
  He doesn\'t stop looking at you until you leave the room."
;

/*
 *   Define the player character.  The name of this object is not
 *   important, but it MUST match the name we use to initialize
 *   gameMain.initialPlayerChar above.
 *   
 *   Note that we aren't required to define any vocabulary or description
 *   for this object, because the class Actor, defined in the library,
 *   automatically provides the appropriate definitions for an Actor when
 *   the Actor is serving as the player character.  Note also that we don't
 *   have to do anything special in this object definition to make the
 *   Actor the player character; any Actor can serve as the player
 *   character, and we'll establish this one as the PC in main(), below.  
 */
+ me: Actor
    location = SleepingQuarter

;


