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
    have reached the final obstacle in your ardous journey. "
    west = InShuttledoor
;

+ InShuttledoor: Lockable, Door -> Shuttledoor 'Shuttle Bay door' 'Shuttle Bay door'
    "Restricted Access airlock door that leads into the Docking Compartment. "
;