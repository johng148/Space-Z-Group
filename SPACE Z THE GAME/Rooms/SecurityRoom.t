#charset "us-ascii"
#include <adv3.h>
#include <en_us.h>


/*
 * ROOM: Security Room/Armory
 * NPC's: Veteran
 * Carry Objects: Sword
 */
Securityroom: Room 'Security Room'
    "A small room with security monitors, a desk and a few weapons. 
    It smells faintly of cigar smoke. You see Bill the veteran."
    north = InSecuritydoor
    east = Bridgedoor
;


/*
 * Door that leads into the Medbay.
 */
+ InSecuritydoor: Lockable,  Door -> Securitydoor 'Security door' 'Security Door'
    "Metal airlock door in Security Room to the Med Bay."
    pic = artBanner.showArt('metaldoor') // The art that is displayed when the item is looked at.
;


/*
 * Door that leads into the Bridge.
 */
+ Bridgedoor: Door 'Bridge door' 'Bridge door'
    "Metal airlock door in the Security Room to the Bridge."
    pic = artBanner.showArt('metaldoor') // The art that is displayed when the item is looked at.
;


//Added a sword object in the security room
+ Sword: Thing 'Sword' 'Sword' 
    "A well sharpened antique sword; it could be useful."
    pic = artBanner.showArt('sword') // The art that is displayed when the item is looked at.
;