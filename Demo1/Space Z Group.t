#charset "us-ascii"

/*
 *   TADS 3 Copyright (c) 1999, 2002 by Michael J. Roberts.  Permission is
 *   granted to anyone to copy and use this file for any purpose.
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
 */
versionInfo: GameID
    IFID = '349b9587-c79f-4bd2-af42-e04570ad5f8b'
    name = 'Demo 1'
    byline = 'by Johnathon Garcia, Meagan Waldo, Kashka Calvin, Erik Alvarez,  Nasley Chumacero-Martin'
    htmlByline = 'by <a href="mailto:john48@nmsu.edu, mwaldo@nmsu.edu, kashka@nmsu.edu, nchumace@nmsu.edu">
                  Johnathon Garcia, Meagan Waldo, Kashka Calvin, Erik Alvarez,  Nasley Chumacero-Martin</a>'
    version = '1'
    authorEmail = 'Johnathon Garcia, Meagan Waldo, Kashka Calvin, Erik Alvarez,  Nasley Chumacero-Martin 
        <john48@nmsu.edu, mwaldo@nmsu.edu, kashka@nmsu.edu, nchumace@nmsu.edu>'
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
 * Door keys are defined outside of the rooms and then placed inside with @.
 */
SecurityKey : Key 'Security key/card' 'Security key card' @CommonRoom;
MedKey : Key 'Medbay med bay key/card' 'Med Bay key card' @CommonRoom;
ShuttleKey : Key 'Shuttle bay key/card' 'Shuttle Bay key card' @CommonRoom;
BathKey : Key 'bathroom key/card' 'Bathroom key card' @CommonRoom;



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
    location = SleepingQuarters

;
+MyHP: Component 'my hp/health/life/hitpoints'
    desc="Current Health: <<CurHP>>/<<MaxHP>>"
    MaxHP =5
    CurHP =1
    healAmount=1
    regenHP()
 
    { // regenHP
        if(CurHP<MaxHP)
        {
            CurHP +=healAmount;
            "You feel a bit better.";
            "Current Health: <<CurHP>>/<<MaxHP>>";
        }
        
            else
        {
                CurHP=MaxHP;
             "You are already fully healed.";
             "Current Health: <<CurHP>>/<<MaxHP>>";
        }
           
    }// end regenHP
    
    damageHP () {
        CurHP --;
        "Ouch! That hurt.";
        if (CurHP == 0){
            "You're out of HP!";
               finishGameMsg(ftDeath, []);
        }
        "Current Health: <<CurHP>>/<<MaxHP>>";
         
    }
    
;

     DefineIAction(heal)
    execAction()
{
    if(FirstAidKit.location == me){
    MyHP.regenHP();
    FirstAidKit.location = nil;
    FirstAidKit.isListedInInventory = false;
    }
}
;

    VerbRule(regen)
    'heal' | 'healing' 
    :healAction
    verbPhrase = 'heal/healing'
;

    DefineIAction(damage)
    execAction() {
    if(cactus.location == me){
     MyHP.damageHP ();
    }
    }
;

    VerbRule (damage)
    'damage' | 'hploss'
    :damageAction
    verbPhrase = 'damage/hploss'
;
 