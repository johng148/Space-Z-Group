#charset "us-ascii"
#include <adv3.h>
#include <en_us.h>
//Zombie calss
//Class name: ZombieClass
//Inherits from "Thing" class
//Has properites "ZombieHealth" and "ZombieCurrHP" as well as method "getHP"
class ZombieClass : Thing
    
    ZombieHealth = 5 //Zombie max health
    ZombieCurHP = 5 //Zombie current health
    
    //Accessor for ZombieHealth property
    getHP () {
        "Current Health: <<ZombieCurHP>>";
        
    }
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
        ZombieClass.damageZombieHP ();  
        }// end of x rand if
        else{
            "You missed the zombie... ";
                    
        }//end else
    } // end of if 
            
        } // end of action
    } // end of dobjFor for Attack
    
    
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
                "It bit you! ";
                MyHP.damageHP (); 
            } // end of if
            else{
             "It missed...";
            } // end of else
        } // end of if
        
         if(MedKey.location == me && Zombie.location == nil) { // zombie respawn
            Zombie.location = me.location;
            Zombie.isListed = true;
            ZombieCurHP = 5;
    "A wild zombie has appeared and is trying to bite you! ";
           // "<<ZombieCurHP>>\n";
            // If the Zombie has a health that is even it will successfully attack the player. Else it misses.
            x = rand(100);
            if(x >=50){
                "It bit you! ";
                MyHP.damageHP (); 
            } // end of if
            else{
             "It missed...";
            } // end of else
    }// end medbay location if
  
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
Zombie : ZombieClass  
  name = 'Zombie'  // Name of the object.
  noun = 'Zombie' // Nouns that the object may be known as.
  desc = "A rotting zombie."  // Description of the object.
  adjective = 'green' 'rotting'  // Attributes that the object has.
  location = SleepingQuarters  // Location of the object.
   
    /*
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
        ZombieClass.damageZombieHP ();  
        }// end of x rand if
        else{
            "You missed the zombie... ";
                    
        }//end else
    } // end of if 
            
        } // end of action
    } // end of dobjFor for Attack
    */
; 

/*
 *  This is our component that controls HP of the Zombie.
 
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
                "It bit you! ";
                MyHP.damageHP (); 
            } // end of if
            else{
             "It missed...";
            } // end of else
        } // end of if
        
         if(MedKey.location == me && Zombie.location == nil) { // zombie respawn
            Zombie.location = me.location;
            Zombie.isListed = true;
            ZombieCurHP = 5;
    "A wild zombie has appeared and is trying to bite you! ";
           // "<<ZombieCurHP>>\n";
            // If the Zombie has a health that is even it will successfully attack the player. Else it misses.
            x = rand(100);
            if(x >=50){
                "It bit you! ";
                MyHP.damageHP (); 
            } // end of if
            else{
             "It missed...";
            } // end of else
    }// end medbay location if
  
    } // end of ZombieHP     
;

*/ 