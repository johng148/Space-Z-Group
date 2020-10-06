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
    "You start off in your Sleeping Quarter. "
    east = Commondoor
    west = Bathdoor
;

+ Bathdoor: Door 'Bath door' 'Bath door'
    "door in bedroom to bathroom"
;
+ Commondoor: Door 'Common door' 'Common door'
    "door in bedroom to commonroom"
;
    
Bathroom: Room 'Bathroom'
    "bathrooms and lockers for spacestation. "

    east = InBathdoor
;

+ InBathdoor: Door -> Bathdoor 'Bath door' 'Bath door'
    "door in bathroom to bedrooms"
;

CommonRoom: Room 'Common room'
    "Room for recreational activities. "

    north = Entrydoor
    south = Messdoor
    west = inCommondoor
    east = Meddoor
;
+ inCommondoor: Door -> Commondoor 'Common door' 'Common door'
    "door in common to bedroom"
;
+ Entrydoor: Door 'Entry door' 'Entry door'
    "door in commonroom to entryroom"
;
+ Messdoor: Door 'Mess door' 'Mess door'
    "door in commonroom to messroom"
;
+ Meddoor: Door 'Med door' 'Med door'
    "door in commonroom to medbay"
;
DockingComp: Room 'Docking Compartment'
    "room connecting outside and ships."
    
    east = Shipdoor
    south = InEntrydoor
;
+ InEntrydoor: Door -> Entrydoor 'Entry door' 'Entry door'
    "door in entryroom to commonroom"
;
+ Shipdoor: Door 'Ship door' 'Ship door'
    "door in entryroom to shiproom."
;

ShuttleBay: Room 'Shuttle Bay'
    "room to escape/win games"
    
    west = InShipdoor
;
+ InShipdoor: Door -> Shipdoor 'Ship door' 'Ship door'
    "door in shiproom to entryroom."
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
+ InMeddoor: Door -> Meddoor 'Med door' 'Med door'
    "doon in medbay to Commonroom"
;
+ Securitydoor: Door 'Security door' 'Security door'
    "door in medbay to Security room"
;
Securityroom: Room 'Security room'
    "room with veteran in it"
    
    north = InSecuritydoor
    east = Bridgedoor
;
+ InSecuritydoor: Door -> Securitydoor 'Security door' 'Security door'
    "Door in security room to Medbayy"
;
+ Bridgedoor: Door 'Bridge door' 'Bridge door'
    "door in security room to Bridge."
;
Bridge: Room 'Bridge'
    "Bridge with communications tower"
    
    west = InBridgedoor
;
+ InBridgedoor: Door -> Bridgedoor 'Bridge door' 'Bridge door'
    "door in Bridge  to Security room."
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


