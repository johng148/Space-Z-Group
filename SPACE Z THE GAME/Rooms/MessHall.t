#charset "us-ascii"
#include <adv3.h>
#include <en_us.h>


/*
 * ROOM: Mess Hall
 * NPC's: None
 * Carry Objects: None
 */
MessHall: Room 'Mess Hall'
    "A large common room with vaulted ceilings and bright lighting. Six long tables, that seat eight 
    people, are evenly spaced in the middle of the room. When people are seated at each table, there is
    just enough room for one person to stand between the chairs. Along the south wall you can see the
    long counter that is loaded with condiments and utensils at mealtimes. Along the north wall is the
    buffet setup with covered chafing dishes. "
    west = Galleydoor
    north = InMessdoor
;


/*
 * Door that leads into the Common Room.
 */
+ InMessdoor: Door -> Messdoor 'Mess door' 'Mess Hall Door'
    "A metal door that leads into the Common Room. "
    pic = artBanner.showArt('metaldoor') // The art that is displayed when the item is looked at.
;


/*
 * Door that leads into the Galley.
 */
+ Galleydoor: Door 'galley kitchen door' 'Galley door'
    "A metal door that leads into the Galley. "
    pic = artBanner.showArt('metaldoor') // The art that is displayed when the item is looked at.
;