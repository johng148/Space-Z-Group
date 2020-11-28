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


//Zombie calss
//Class name: ZombieClass
//Inherits from "Thing" class
//Has properites "ZombieHealth" and "ZombieCurrHP" as well as method "getHP"
class ZombieClass : Thing
    
    ZombieHealth = 5 //Zombie max health
    ZombieCurrHP = 5 //Zombie current health
    
    //Accessor for ZombieHealth property
    getHP () {
        "Current Health: <<ZombieCurrHP>>";
        
    }
      
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
        Heal ~ Can be used to heal yourself when you have a first aid kit.<.p>";
    }
;


/*
 * Door keys are defined outside of the rooms and then placed inside with @.
 */
SecurityKey : Key 'Security key/card' 'Security key card' @CommonRoom;
MedKey : Key 'Medbay key/card' 'MedBay key card' @CommonRoom;
ShuttleKey : Key 'Shuttlebay key/shuttle bay key/card' 'Shuttle Bay key card' @CommonRoom;
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


/*
 *  This defines an action that the player can use in specific conditions.
 */
DefineIAction(attack) execAction() {  
    // If the player is in the same location as the zombie then they may attack it at 50% chance to hit.
    if(Zombie.location == me.location){   
        "You attempt to attack the zombie! ";
         x = rand(100);
        if(x >=50){
        "You hit the zombie! ";
        ZombieHP.damageZombieHP ();  
        }// end of x rand if
        else{
            "You missed the zombie... ";
        }//end else
    } // end of if 
}// end of DefineIAction for attack
;


/*
 *  This gives verb rules to an action.
 */
VerbRule (attack)
    'attack' | 'attack zombie' : attackAction
    verbPhrase = 'attack/attack zombie'
;


/*
 *  This is our component that controls HP of the Zombie.
 */
+ZombieHP: Component 'Zombie hp/health/life/hitpoints'
    desc="Current Health: <<ZombieCurHP>>/<<ZombieMaxHP>>"  // Command that shows current health out of max amount.
    ZombieMaxHP = 5  // Max amount of HP zombie can have.
    ZombieCurHP = 4  // Current amount of HP zombie has.
 
   // This method controls health damage.
    damageZombieHP () {
        local x;
        
        //the sword does 5 damage
        if(testSword.location == me){
            ZombieCurHP -= 2;
        }//if user has a sword
        
        //if the user doesnt have a sword
        else{
            ZombieCurHP--;// = ZombieCurHP - i;
        }//else
        "Grrrr.<.p>";
        
        // If the current health is 0 the zombie is dead.
        if(ZombieCurHP <= 0){
            "You killed the zombie!";
        Zombie.location = nil; // removes the zombie from the room.
        Zombie.isListed = nil; // removes the zombie from the room list.
        } // end of if
        
        // If the Zombie is not dead and it was attacked it will attack back.
        if(ZombieCurHP > 0){
            "The zombie tries to bite you...";
           // "<<ZombieCurHP>>\n";
            // If the Zombie has a health that is even it will successfully attack the player. Else it misses.
            x = rand(100);
            if(x >=50){
                MyHP.damageHP (); 
            } // end of if
            else{
             "It missed...";
            } // end of else
        } // end of if
  
    } // end of ZombieHP     
;

//Test code for Zombie class
//Makes a test object called "Zombie2"
Zombie2 : ZombieClass
    location = SleepingQuarters
    desc = "current hp = <<Zombie2.ZombieHealth>>" //Will display Zombie's max health
    name = 'Zombie2'
    noun = 'Zombie2'
;



/*
 *  This object is a zombie.
 */
Zombie : Thing  
  name = 'Zombie'  // Name of the object.
  noun = 'Zombie' // Nouns that the object may be known as.
  desc = "A rotting zombie."  // Description of the object.
  adjective = 'green' 'rotting'  // Attributes that the object has.
  location = SleepingQuarters  // Location of the object.
      
    // If the player trys to take the zombie it will not let them.
    dobjFor(Take){
         
      verify() { 
            illogical('It is extremely dangerous to try to pick up a zombie. What if it bites you?');   
      } // end of verify
 
 } // end of dobjFor for Take
    
    // If the player trys to attack the zombie it will let them.
    dobjFor(Attack){
         
      action() { 
            
            
            if(Zombie.location == me.location){   
        "You attempt to attack the zombie! ";
         x = rand(100);
        if(x >=50){
        "You hit the zombie! ";
        ZombieHP.damageZombieHP ();  
        }// end of x rand if
        else{
            "You missed the zombie... ";
        }//end else
    } // end of if 
            
        } // end of action
    } // end of dobjFor for Attack
; 