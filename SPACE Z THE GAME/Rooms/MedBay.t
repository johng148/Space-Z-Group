#charset "us-ascii"
#include <adv3.h>
#include <en_us.h>


/*
 * ROOM: Med Bay
 * NPC's: Doctor
 * Carry Objects: First aid kit, Bathroom Key
 */
MedBay: Room 'MedBay'
    "room with doctor starting point"
    west = InMeddoor
    south = Securitydoor
;


/*
 * Door that leads into the Common Room.
 */
+ InMeddoor: LockableWithKey, Door -> Meddoor 'Med door' 'Med door'
    "Door in medbay to Commonroom"
    pic = artBanner.showArt('metaldoor') // The art that is displayed when the item is looked at.
;


/*
 * Door that leads into the Security Room.
 */
+ Securitydoor: LockableWithKey, Door 'Security door' 'Security door'
    "Door in medbay to Security room"
    keyList = [SecurityKey]
    pic = artBanner.showArt('metaldoor') // The art that is displayed when the item is looked at.
;


// First aid kit object.
+ FirstAidKit: Thing 'First aid kit' 'First aid kit'
    "A first aid kit that can be used to heal most wounds."
    pic = artBanner.showArt('medkit') // The art that is displayed when the item is looked at.
;