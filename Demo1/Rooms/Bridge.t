#charset "us-ascii"
#include <adv3.h>
#include <en_us.h>

/*
 * ROOM: Bridge and Communications
 * NPC's: Veteran
 * Carry Objects: Sword
 * Immovable Objects: 
 */
Bridge: Room 'Bridge'
    "Bridge with communications tower"
    west = InBridgedoor
;

+ InBridgedoor: Door -> Bridgedoor 'Bridge door' 'Bridge door'
    "door in Bridge  to Security room."
;
