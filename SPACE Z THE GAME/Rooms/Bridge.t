#charset "us-ascii"
#include <adv3.h>
#include <en_us.h>


/*
 * ROOM: Bridge and Communications
 * NPC's: Veteran
 * Carry Objects: Shuttle Room Key
 */
Bridge: Room 'Bridge'
    "Bridge with communications tower"
    west = InBridgedoor
;


/*
 * Door that leads into the Security Room.
 */
+ InBridgedoor: Door -> Bridgedoor 'Bridge door' 'Bridge door'
    "door in Bridge to Security room."
    pic = artBanner.showArt('metaldoor') // The art that is displayed when the item is looked at.
;