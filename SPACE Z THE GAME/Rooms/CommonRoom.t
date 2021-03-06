#charset "us-ascii"
#include <adv3.h>
#include <en_us.h>


/*
 * ROOM: Common Room
 * NPC's: None
 * Carry Objects: None
 */
CommonRoom: Room 'Common Room'
    "This a large inviting room that is filled with oversized chairs placed around the room,
    each with its own side table. In the southeast corner you see a billiards table, and along the northeast
    wall is another seating area equipped with panels of televisions for the crew to relax with their 
    favorite episode. "
    north = Dockingdoor
    south = Messdoor
    west = inCommondoor
    east = Meddoor
;


/*
 * Door that leads into the Sleeping Quarters.
 */
+ inCommondoor: Door -> Commondoor 'Common common room door' 'Common Room Door'
    "Heavy metal airlock door that leads to the Sleeping Quarters. "
    pic = artBanner.showArt('metaldoor') // The art that is displayed when the item is looked at.
;


/*
 * Door that leads into the Docking Compartment.
 */
+ Dockingdoor: Door 'Docking compartment door' 'Docking Compartment door'
    "Metal airlock door that reads \"RESTRICTED ACCESS: Authorized Personnel 
    Only Beyond This Point\" and opens into the Docking Compartment. "
    pic = artBanner.showArt('metaldoor') // The art that is displayed when the item is looked at.
;


/*
 * Door that leads into the Mess Hall.
 */
+ Messdoor: Door 'mess hall messhall door*doors' 'Mess hall Door'
    "A metal door that leads into the Mess Hall."
    pic = artBanner.showArt('metaldoor') // The art that is displayed when the item is looked at.
;


/*
 * Door that leads into the Medbay.
 */
+ Meddoor: LockableWithKey, Door 'Medbay door' 'MedBay Door'
    "Metal airlock door that opens into the Med Bay. "
    keyList = [MedKey]
    pic = artBanner.showArt('metaldoor') // The art that is displayed when the item is looked at.
;