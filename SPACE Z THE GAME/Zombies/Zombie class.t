#charset "us-ascii"
#include <adv3.h>
#include <en_us.h>


/*
 * Zombie class Class name: ZombieClass 
 * Inherits from "Thing" class has properites "ZombieHealth" and "ZombieCurrHP" as well as method "getHP".
 */ 
class ZombieClass : Thing
    ZombieCurHP = 3 //Zombie base class current health
    
    //Accessor for ZombieHealth property
    getHP () {
        "Current Health: <<ZombieCurHP>>";
    } // end of getHP
        
    // If the player tries to take the zombie it will not let them.
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
  
    
   /*
    * This method controls health damage.
    */
    damageZombieHP () {
        local x;
        
        // If the user has the sword or the knife they will attack with a higher damage.
        if(Sword.location == me){
           ZombieCurHP -= 2;
        } // end of if
        else if(Knife.location == me){
           ZombieCurHP -= 2;
        } // end of else
        else{
            ZombieCurHP--;
        } // end of else
        
        "Grrrr.<.p>";
        
        // If the current health is 0 the zombie is dead.
        if(ZombieCurHP <= 0){
            "You killed the zombie!";
            location = nil; // removes the zombie from the room.
            isListed = nil; // removes the zombie from the room list.
            pic = nil; // The art is reset to nothing.
            desc = nil; // Removes the description of the zombie once it dies.
            artBanner.clearWindow(); // The art is removed once the zombie is killed.
        } // end of if
        
        // If the Zombie is not dead and it was attacked it will attack back.
        if(ZombieCurHP > 0){
            "The zombie tries to bite you...";
       
            x = rand(100); // Generates a random number.
            
            // If the randomly generated number is greater then 50 then the zombie sucessfully attacks the player. Else it misses.
            if(x >=50){
                "It bit you! ";
                MyHP.damageHP (); 
            } // end of if
            else{
                "It missed...";
            } // end of else
        } // end of if
    } // end of ZombieHP    

    ZombieAttack(){
    local x;
    if(afterTravel (me, ZombieClass.location)== true){
        "The zombie tries to bite you..."; 
       
            x = rand(100); // Generates a random number.
            
            // If the randomly generated number is greater then 50 then the zombie sucessfully attacks the player. Else it misses.
            if(x >=50){
                "It bit you! ";
                MyHP.damageHP (); 
            } // end of if
            else{
                "It missed...";
            } // end of else
        } // end of if       
    }// end attack
    
   
;// end zombie class
/*
 * A legless zombie enemy.
 */ 
LeglessZombie : ZombieClass  
    name = 'Legless Zombie'  // Name of the object.
    noun = 'Legless/Legless Zombie' // Nouns that the object may be known as.
    desc = "A legless rotting zombie that is dragging itself around on the floor."  // Description of the object.
    adjective = 'legless' 'zombie'  // Attributes that the object has.
    location = nil  // Location of the object.
    ZombieCurHP = 2 //Zombie current health
    pic = artBanner.showArt('bloodyzombie') // The art that is displayed when the item is looked at. 
;
           

/*
 * A armless zombie enemy.
 */ 
ArmlessZombie : ZombieClass  
    name = 'Armless Zombie'  // Name of the object.
    noun = 'Armless/Armless Zombie' // Nouns that the object may be known as.
    desc = "A armless rotting zombie that is walking around the room."  // Description of the object.
    adjective = 'armless' 'zombie'  // Attributes that the object has.
    location = nil  // Location of the object.
    pic = artBanner.showArt('womanzombie') // The art that is displayed when the item is looked at.
;


FaceZombie : ZombieClass  
    name = 'Face Zombie'  // Name of the object.
    noun = 'Face/Face Zombie' // Nouns that the object may be known as.
    desc = "A face rotting zombie that is walking around the room."  // Description of the object.
    adjective = 'face' 'zombie'  // Attributes that the object has.
    location = nil  // Location of the object.
    pic = artBanner.showArt('disfiguredzombie') // The art that is displayed when the item is looked at.
;


FullZombie : ZombieClass  
    name = 'Full Zombie'  // Name of the object.
    noun = 'Full/Full Zombie' // Nouns that the object may be known as.
    desc = "A full bodied rotting zombie that is walking around the room."  // Description of the object.
    adjective = 'full' 'zombie'  // Attributes that the object has.
    location = nil  // Location of the object.
    pic = artBanner.showArt('fullmalezombie') // The art that is displayed when the item is looked at.
;

