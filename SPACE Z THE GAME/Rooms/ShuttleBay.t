#charset "us-ascii"
#include <adv3.h>
#include <en_us.h>

/*
 * ROOM: Shuttle Bay
 * NPC's: 
 * Carry Objects:
 * Immovable Objects:
 */
ShuttleBay: Room 'Shuttle Bay'
    "This room is a large hangar where the emergency self-navigable escape shuttles are housed. You
    have reached the final obstacle in your ardous journey. Enter the emergency self-navigable escape shuttle! "
    west = InShuttledoor

        

;

+ InShuttledoor: Lockable, Door -> Shuttledoor 'Shuttle Bay door' 'Shuttle Bay door'
    "Restricted Access airlock door that leads into the Docking Compartment. "
;


 
/*
 *  This object is a Emergency self-navigable escape shuttle.
 */
escapeShuttle : Thing  
  name = 'Escape Shuttle'  // Name of the object.
  noun = 'Escape Shuttle' // Nouns that the object may be known as.
  desc = "Emergency self-navigable escape shuttle"  // Description of the object.
  adjective = 'Emergency' 'escape' 'shuttle'  // Attributes that the object has.
  location = ShuttleBay  // Location of the object.
    
    // If the player trys to enter into the emergency self-navigable escape shuttle.
    dobjFor(Enter){
        
        verify(){   
        "You enter into one of the emergency self-navigable escape shuttles and take off into space.";
        finishGameMsg(ftVictory, []); // The player wins the game.
        } // end of verify
    } // end of dobjFor for Attack
;     


