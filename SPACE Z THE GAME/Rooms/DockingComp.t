#charset "us-ascii"
#include <adv3.h>
#include <en_us.h>


/*
 * ROOM: Docking Compartment
 * NPC's: None 
 * Carry Objects: None
 */
DockingComp: Room 'Docking Compartment'
    "room connecting Docking Compartment and Shuttle Bay. "
    east = Shuttledoor
    south = InDockingdoor
;


/*
 * Door that leads into the Common Room.
 */
+ InDockingdoor: Door -> Dockingdoor 'docking compartment door' 'Docking Compartment door'
    "Metal airlock door that connects the Docoking Compartment to the Common Room.
    The door has a sign reminding you to: \"Finish Decontamination Process Before 
    Proceeding into Station!\" "
    pic = artBanner.showArt('metaldoor') // The art that is displayed when the item is looked at.
;


/*
 * Door that leads into the ShuttleBay.
 */
+ Shuttledoor:LockableWithKey, Door 'shuttle shuttlebay door' 'Shuttle Bay Door'
    "Restricted Access airlock door into the Shuttle Bay. "
    keyList = [ShuttleKey]
    pic = artBanner.showArt('metaldoor') // The art that is displayed when the item is looked at.
;