#charset "us-ascii"
#include <adv3.h>
#include <en_us.h>

/*
 * ROOM: Galley/Kitchen
 * NPC's: Chef [To Be Added]
 * Carry Objects: Knife [TBA], Cast-Iron Pan [TBA]
 * Immovable Objects: Stove [TBA], Commercial Fridge [TBA], Storage Room [TBA], Cupboards [TBA]
 */
Galley: Room 'Galley'
    "The galley is rectangular  kitchen that could be modeled after any kitchen seen in a large 
    restaurant on Earth. All of the counters and machinery are stainless steel. "
    east = InGalleydoor
;

+ InGalleydoor: Door -> Galleydoor 'Galley door' 'Galley door'
    "A creaky swinging door from the Galley into the Mess Hall. "
;
