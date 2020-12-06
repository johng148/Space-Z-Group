#charset "us-ascii"
#include <adv3.h>
#include <en_us.h>

/*
 * ROOM: Med Bay
 * NPC's: Doctor
 * Carry Objects: First aid kit
 * Immovable Objects: 
 */
MedBay: Room 'MedBay'
    "room with doctor starting point"
    west = InMeddoor
    south = Securitydoor
;

+ InMeddoor: LockableWithKey, Door -> Meddoor 'Med door' 'Med door'
    "doon in medbay to Commonroom"
;

+ Securitydoor: LockableWithKey, Door 'Security door' 'Security door'
    "door in medbay to Security room"
    keyList = [SecurityKey]
;

//Added First aid kit object in med bay
+ FirstAidKit: Thing 'First aid kit' 'First aid kit'
    "A first aid kit that can be used to heal most wounds."
    pic = artBanner.showArt('medkit')
;