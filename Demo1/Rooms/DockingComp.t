#charset "us-ascii"
#include <adv3.h>
#include <en_us.h>

/*
 * ROOM: Docking Compartment
 * NPC's: 
 * Carry Objects:
 * Immovable Objects:
 */
DockingComp: Room 'Docking Compartment'
    "room connecting Docking Compartment and Shuttle Bay. "
    east = Shuttledoor
    south = InDockingdoor
;

+ InDockingdoor: Door -> Dockingdoor 'docking compartment door' 'Docking Compartment door'
    "Metal airlock door that connects the Docoking Compartment to the Common Room.
    The door has a sign reminding you to: \"Finish Decontamination Process Before 
    Proceeding into Station!\" "
;

+ Shuttledoor:LockableWithKey, Door 'shuttle shuttlebay door' 'Shuttle Bay Door'
    "Restricted Access airlock door into the Shuttle Bay. "
    keyList = [ShuttleKey]
;

