#charset "us-ascii"
#include <adv3.h>
#include <en_us.h>


/*
 * TADS 3 Copyright (c) 1999, 2002 by Michael J. Roberts.  Permission is
 * granted to anyone to copy and use this file for any purpose.
 */ 


/*
 * Our game credits and version information.  
 */
versionInfo: GameID
    IFID = '349b9587-c79f-4bd2-af42-e04570ad5f8b'
    name = 'SPACE Z: THE GAME'
    byline = 'by Johnathon Garcia, Meagan Waldo, Kashka Calvin, Erik Alvarez, Nasley Chumacero-Martin'
    htmlByline = 'by <a href="mailto: john48@nmsu.edu, mwaldo@nmsu.edu, kashka@nmsu.edu, ragefan@nmsu.edu, nchumace@nmsu.edu">
                 Johnathon Garcia, Meagan Waldo, Kashka Calvin, Erik Alvarez, Nasley Chumacero-Martin</a>'
    version = '1'
    authorEmail = 'Johnathon Garcia, Meagan Waldo, Kashka Calvin, Erik Alvarez, Nasley Chumacero-Martin 
                  <john48@nmsu.edu, mwaldo@nmsu.edu, kashka@nmsu.edu, ragefan@nmsu.edu, nchumace@nmsu.edu>'
    desc = 'SPACE Z: THE GAME'
    htmlDesc = 'SPACE Z: THE GAME'
;


/*
 * The "gameMain" object lets us set the initial player character and control the game's startup procedure.
 */
gameMain: GameMainDef
    
    // The initial player character is 'me'.
    initialPlayerChar = me
 
    // Gives a title to the game and states what actions a player has.
    showIntro(){
        "SPACE Z: THE GAME<.p>Key actions you have:<.p>Attack ~ Can be used to attack a zombie.<.p>
        Heal ~ Can be used to heal yourself when you have a first aid kit.<.p> Take ~ Take objects and put 
        them into your inventory. <.p> Look ~ Command to take a closer look at a person or object.<.p>
        Inventory ~ This shows you what you are carrying around!<.p>
        Hints ~ Use this command to get help navigating through the game, wherever hints are available.<.p>";
        
        hitpointsBanner.showHitpoints(5); // This initializes the hitpointBanner to display the hp bar.
        artBanner.showArt('spacestation'); // This initializes the artBanner to display the spacestation.
    }
;


/*
 * Door keys are defined outside of the rooms and then placed inside with @.
 */
SecurityKey : Key 'Security key/ security key' 'Security key' @Bathroom pic = artBanner.showArt('keycard')
    
    // spawned zombies after taking
    dobjFor(Take){
      action() { 
           "You hear loud rustling in the Sleeping Quarters. ";
           ArmlessZombie.moveInto(SleepingQuarters); 
           LeglessZombie.moveInto(CommonRoom); 
           FaceZombie.moveInto(MessHall); 
           FullZombie.moveInto(DockingComp); 
            
        }// end take
    }// end action
;


MedKey : Key 'Medbay key/ med bay key' 'Med Bay key' @Galley pic = artBanner.showArt('keycard');
ShuttleKey : Key 'Shuttlebay key/shuttle bay key' 'Shuttle Bay key' @Bridge pic = artBanner.showArt('keycard');
BathKey : Key 'bathroom key/ bath room key' 'Bathroom key' @SleepingQuarters pic = artBanner.showArt('keycard');


/*
 * Defines the player character. 
 */
+ me: Actor
    location = SleepingQuarters
;


/*
 * This is our component that controls HP.
 */
+MyHP: Component 'my hp/health/life/hitpoints'
    desc="Current Health: <<CurHP>>/<<MaxHP>>"  // Command that shows current health out of max amount.
    MaxHP = 5  // Max amount of HP player can have.
    CurHP = 5  // Current amount of HP player has.
    healAmount = 1 // Amount of HP for the player that is healed each time.
    FAidUses=3 // Amount of uses for each med kit.
    
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
                
            }// end of if          
        } // end of if
        else {
            CurHP=MaxHP;
            
            //This command is used to update the hitpoints display.
            hitpointsBanner.showHitpoints(CurHP);
            
            "You are already fully healed. ";        
            "Current Health: <<CurHP>>/<<MaxHP>> ";
        } // end of else        
    } // end regenHP
    
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
    else {
        "You need a first aid kit to heal. ";
    } // end of else    
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
} // end of DefineIAction for damage
;


/*
 *  This gives verb rules to an action.
 */
VerbRule (damage)
    'damage' | 'hploss' : damageAction
    verbPhrase = 'damage/hploss'
;


modify LookAction // Modifies look action to allow custom art to be shown when looked at.
  
    execAction() {
        inherited();
        local loc = gActor.getOutermostRoom();
        
        if(loc.pic) {
            loc.showArt(); // Looks at show art method to find specific pic.
        } // end of if
  } 
;