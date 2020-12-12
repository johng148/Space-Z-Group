#charset "us-ascii"
#include <adv3.h>
#include <en_us.h>


/*
 * ROOM: Galley/Kitchen
 * NPC's: Chef 
 * Carry Objects: Kitchen Knife, MedBay Key
 */
Galley: Room 'Galley'
    "The galley is rectangular  kitchen that could be modeled after any kitchen seen in a large 
    restaurant on Earth. All of the counters and machinery are stainless steel. "
    east = InGalleydoor
;


/*
 * Door that leads into the Mess Hall.
 */
+ InGalleydoor: Door -> Galleydoor 'Galley door' 'Galley door'
    "A metal door from the Galley into the Mess Hall. "
    pic = artBanner.showArt('metaldoor') // The art that is displayed when the item is looked at.
;


// A Knife Weapon.
+ Knife: Thing 'Knife' 'Knife' 
    "A well sharpened Chef's knife; it could be useful."
    pic = artBanner.showArt('kitchenknife') // The art that is displayed when the item is looked at.
;