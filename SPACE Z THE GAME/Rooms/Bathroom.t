#charset "us-ascii"
#include <adv3.h>
#include <en_us.h>


/*
 * ROOM: Bathroom
 * NPC's: None
 * Carry Objects: Security Room key, Sample
 */
Bathroom: Room 'Bathroom'
    "The bathroom has a long wall of lockers immediately beside the door.
    Off to your left you can see the showers individually sealed in a compartments.
    The toilets are along the back wall to the right, accessible only by a narrow hallway
    that separates the lockers. "
    east = InBathdoor
;


/*
 * Door that leads into the Sleeping Quarters.
 */
+ InBathdoor: LockableWithKey, Door -> Bathdoor 'bath bathroom door' 'Bathroom Door'
    "Metal airlock door that leads from the bathroom to the Sleeping Quarters. "
    keyList = [BathKey]
    pic = artBanner.showArt('metaldoor')
;


/*
 *  This object is a dismembered zombie hand that can be used by the doctor as a sample.
 */
sample : Thing  
    name = 'sample'  // Name of the object.
    noun = 'sample' 'zombie hand'  // Nouns that the object may be known as.
    desc = "A dismembered rotten zombie hand. Luckily it is motionless. 
           Maybe we should take it to the doctor? He could use this as a sample."  // Description of the object.
    adjective = 'rotten' 'dismembered'  // Attributes that the object has.
    location = Bathroom  // Location of the object.
    pic = artBanner.showArt('zombiehand') // The art that is displayed when the item is looked at.
;  