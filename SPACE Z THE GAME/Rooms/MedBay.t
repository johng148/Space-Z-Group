#charset "us-ascii"
#include <adv3.h>
#include <en_us.h>


/*
 * ROOM: Med Bay
 * NPC's: Doctor
 * Carry Objects: First aid kit, Bathroom Key
 */
MedBay: Room 'MedBay'
    "This room wide with low ceilings and smells of disinfectant. There are several steel tables bolted
    to the ground and every kind of medical apparatus litters the surfaces. The north wall has shelves lined
    with pull-out drawers full of medical supplies. Despite the clutter, the room is very sterile."
    west = InMeddoor
    south = Securitydoor
;


/*
 * Door that leads into the Common Room.
 */
+ InMeddoor: LockableWithKey, Door -> Meddoor 'Med door' 'Med door'
    "Metal airlock door from the Med Bay to the Common Room."
    pic = artBanner.showArt('metaldoor') // The art that is displayed when the item is looked at.
;


/*
 * Door that leads into the Security Room.
 */
+ Securitydoor: LockableWithKey, Door 'Security door' 'Security door'
    "Standard metal airlock door from the Med Bay to the Security Room."
    keyList = [SecurityKey]
    pic = artBanner.showArt('metaldoor') // The art that is displayed when the item is looked at.
;


// First aid kit object.
+ FirstAidKit: Thing 'First aid kit' 'First aid kit'
    "A first aid kit that can be used to heal most wounds."
    pic = artBanner.showArt('medkit') // The art that is displayed when the item is looked at.
;