#charset "us-ascii"
#include <adv3.h>
#include <en_us.h>

/*
 * ROOM: Security Room/Armory
 * NPC's: Veteran
 * Carry Objects: Sword
 * Immovable Objects: 
 */
Securityroom: Room 'Security Room'
    "room with veteran in it"
    north = InSecuritydoor
    east = Bridgedoor
;

+ InSecuritydoor: Lockable,  Door -> Securitydoor 'Security door' 'Security Door'
    "Door in security room to Medbay"
    pic = artBanner.showArt('metaldoor')
;

+ Bridgedoor: Door 'Bridge door' 'Bridge door'
    "door in security room to Bridge."
    pic = artBanner.showArt('metaldoor')
;

//Added a sword object in the security room
+ Sword: Thing 'Sword' 'Sword' 
    "A well sharpened antique sword; it could be useful."
    pic = artBanner.showArt('sword')
    swordDamage = 2;
;