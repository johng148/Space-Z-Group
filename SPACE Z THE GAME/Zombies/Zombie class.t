#charset "us-ascii"
#include <adv3.h>
#include <en_us.h>
//Zombie class
//Class name: ZombieClass
//Inherits from "Thing" class
//Has properites "ZombieHealth" and "ZombieCurrHP" as well as method "getHP"
class ZombieClass : Thing
    
    ZombieCurHP = 3 //Zombie base class current health
    
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
    
    // If the player tries to attack the zombie it will let them.
    dobjFor(Attack){
         
      action() { 
            
        // If the current health is 0 the zombie is dead.
        if(ZombieCurHP <= 0){
          "The zombie is already dead.";
        } // end of if
            else{
            
            if(location == me.location){   
        "You attempt to attack the zombie! ";
         x = rand(100);
        if(x >=50){
        "You hit the zombie! ";
        damageZombieHP ();  
        }// end of x rand if
        else{
            "You missed the zombie... ";
                    
        }//end else
    } // end of if 
            } // end of else 
        } // end of action
    } // end of dobjFor for Attack
    
    
     // This method controls health damage.
    damageZombieHP () {
        local x;
        
        //the sword does 5 damage
        if(Sword.location == me){
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
        location = nil; // removes the zombie from the room.
        isListed = nil; // removes the zombie from the room list.
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
        
//         if(FirstAidKit.location == me && location == nil) { // zombie respawn
//            location = me.location;
//            isListed = true;
//            ZombieCurHP = 3;
//    "A wild zombie has appeared and is trying to bite you! ";
//           // "<<ZombieCurHP>>\n";//
//            // If the Zombie has a health that is even it will successfully attack the player. Else it misses.
//            x = rand(100);
//            if(x >=50){
//                "It bit you! ";
//                MyHP.damageHP (); 
//            } // end of if
//            else{
//             "It missed...";
//            } // end of else
//    }// end medbay location if
  
    } // end of ZombieHP    
      
;
//Test code for Zombie class
//Makes a test object called "Zombie2"
LeglessZombie : ZombieClass  
  name = 'Legless Zombie'  // Name of the object.
  noun = 'Legless/Legless Zombie' // Nouns that the object may be known as.
  desc = "A legless rotting zombie that is dragging itself around on the floor."  // Description of the object.
  adjective = 'legless' 'zombie'  // Attributes that the object has.
  location = SleepingQuarters  // Location of the object.
  ZombieCurHP = 2 //Zombie current health
   pic = artBanner.showArt('bloodyzombie')
    
;
 modify Thing
  pic = nil

  mainExamine()
  {
    inherited();
    if(pic)
      pic.showPic();
  }
;




    



/*
 *  This object is a zombie.
 */
ArmlessZombie : ZombieClass  
  name = 'Armless Zombie'  // Name of the object.
  noun = 'Armless/Armless Zombie' // Nouns that the object may be known as.
  desc = "A armless rotting zombie that is walking around the room."  // Description of the object.
  adjective = 'armless' 'zombie'  // Attributes that the object has.
  location = SleepingQuarters  // Location of the object.
    pic = artBanner.showArt('womanzombie')
;

