#charset "us-ascii"
#include <adv3.h>
#include <en_us.h>


/*
 * ROOM: Bridge and Communications
 * NPC's: Captain
 * Carry Objects: Shuttle Room Key
 */
Bridge: Room 'Bridge'
    "The room is aligned with many screens all across. All of them are blinking red with 
    \"ALERT\". There's blood on the seats and the floor, but you don't see any bodies. It's a 
    big room with a lot of technology that you don't know how to operate."
    west = InBridgedoor
;


/*
 * Door that leads into the Security Room.
 */
+ InBridgedoor: Door -> Bridgedoor 'Bridge door' 'Bridge door'
    "A metal airlock door from the Bridge that connects to the Security Room."
    pic = artBanner.showArt('metaldoor') // The art that is displayed when the item is looked at.
;