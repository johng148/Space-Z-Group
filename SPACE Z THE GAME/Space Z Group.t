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
 *   Our game credits and version information.  
 */
versionInfo: GameID
    IFID = '349b9587-c79f-4bd2-af42-e04570ad5f8b'
    name = 'SPACE Z: THE GAME'
    byline = 'by Johnathon Garcia, Meagan Waldo, Kashka Calvin, Erik Alvarez,  Nasley Chumacero-Martin'
    htmlByline = 'by <a href="mailto:john48@nmsu.edu, mwaldo@nmsu.edu, kashka@nmsu.edu, nchumace@nmsu.edu">
                  Johnathon Garcia, Meagan Waldo, Kashka Calvin, Erik Alvarez,  Nasley Chumacero-Martin</a>'
    version = '1'
    authorEmail = 'Johnathon Garcia, Meagan Waldo, Kashka Calvin, Erik Alvarez,  Nasley Chumacero-Martin 
        <john48@nmsu.edu, mwaldo@nmsu.edu, kashka@nmsu.edu, nchumace@nmsu.edu>'
    desc = 'SPACE Z: THE GAME'
    htmlDesc = 'SPACE Z: THE GAME'
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
 
    // Gives a title to the game and states what actions a player has.
    showIntro(){
        "SPACE Z: THE GAME<.p>Key actions you have:<.p>Attack ~ Can be used to attack a zombie.<.p>
        Heal ~ Can be used to heal yourself when you have a first aid kit.<.p> Take ~ Take objects and put 
        them into your inventory. <.p> Look ~ Command to take a closer look at a person or object.<.p>
        Inventory ~ This shows you what you are carrying around!<.p>
        Hints ~ Use this command to get help navigating through the game, wherever hints are available.<.p>";
        
        hitpointsBanner.showHitpoints(5);
        artBanner.showArt('spacestation');
    }
;


/*
 * Door keys are defined outside of the rooms and then placed inside with @.
 */
SecurityKey : Key 'Security key/ security key' 'Security key' @Bathroom pic = artBanner.showArt('keycard');

MedKey : Key 'Medbay key/ med bay key' 'MedBay key' @Galley pic = artBanner.showArt('keycard');

ShuttleKey : Key 'Shuttlebay key/shuttle bay key' 'Shuttle Bay key' @Bridge pic = artBanner.showArt('keycard');

BathKey : Key 'bathroom key/ bath room key' 'Bathroom key' @MedBay pic = artBanner.showArt('keycard');


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


/*
 *  This is our component that controls HP.
 */
+MyHP: Component 'my hp/health/life/hitpoints'
    desc="Current Health: <<CurHP>>/<<MaxHP>>"  // Command that shows current health out of max amount.
    MaxHP = 5  // Max amount of HP player can have.
    CurHP = 5  // Current amount of HP player has.
    healAmount = 1 // Amount of HP for the player that is healed each time.
    FAidUses=3 // uses of med kit
    
    // This method controls health regen.
    regenHP() { 
        // If the current health is less then the max health increase health. 
        if(CurHP < MaxHP) {
            CurHP += healAmount;
            FAidUses--; // decrement uses of first aid kit
            //This command is used to update the hitpoints display.
            hitpointsBanner.showHitpoints(CurHP);
            
            "You feel a bit better! ";
            "Current Health: <<CurHP>>/<<MaxHP>> ";
            "First aid kit uses left: <<FAidUses>> ";
            
            if(FAidUses == 0) { // check to see if we ran out of uses.
                "Your first aid kit is empty! You cannot use it anymore! ";
                FirstAidKit.location = nil; // removes the firstaid kit after use.
                FirstAidKit.isListedInInventory = nil; // removes the firstaid kit after use.
                FAidUses=3;
                
            }// end nested if for uses          
        } // end of if
        else {
            CurHP=MaxHP;
            //This command is used to update the hitpoints display.
            hitpointsBanner.showHitpoints(CurHP);
            
            "You are already fully healed. ";        
            "Current Health: <<CurHP>>/<<MaxHP>> ";
        } // end of else        
    }// end regenHP
    
    // This method controls health damage.
    damageHP () {
        CurHP --;
        //This command is used to update the hitpoints display.
         hitpointsBanner.showHitpoints(CurHP);
        
        "Ouch! That hurt.";
       
        // If the current health is 0 the player is dead.
        if(CurHP == 0){
            "You're out of HP!";
            finishGameMsg(ftDeath, []);
        } // end of if
       
        "Current Health: <<CurHP>>/<<MaxHP>>"; 
        
    } // end of damageHP  
;


/*
 *  This defines an action that the player can use in specific conditions.
 */
DefineIAction(heal) execAction() {
        // If the player has the firstaid kit then they may use it to regen HP.    
        if(FirstAidKit.location == me){
            MyHP.regenHP();
             } // end of if
    else
        "You need a first aid kit to heal. ";
    } // end of DefineIAction for heal
;


/*
 *  This gives verb rules to an action.
 */
VerbRule(regen)
    'heal' | 'healing' : healAction
    verbPhrase = 'heal/healing'
;


/*
 *  This defines an action that the player can use in specific conditions.
 */
DefineIAction(damage) execAction() {  
    // If the player has the cactus then they may use it to damage their HP.    
    if(cactus.location == me){   
        MyHP.damageHP ();  
    } // end of if 
}// end of DefineIAction for damage
;


/*
 *  This gives verb rules to an action.
 */
VerbRule (damage)
    'damage' | 'hploss' : damageAction
    verbPhrase = 'damage/hploss'
;


modify LookAction // modify's look action to allow custom art to be shown when looked at.
  execAction()
  {
    inherited();
    
    local loc = gActor.getOutermostRoom();
    if(loc.pic)
      loc.showArt(); // looks at show art method to find specific pic. 
  } 
;







