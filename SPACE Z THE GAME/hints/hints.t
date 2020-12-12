#charset "us-ascii"
#include <adv3.h>
#include <en_us.h>


/*
 * Start of the Hints menu.
 */
TopHintMenu 'Hints';


/*
 * Hints are for level progression.
 */
+ HintMenu 'Level progression';


/*
 * Hint requests and responses for the Medbay.
 */
++ MedbayGoal : Goal 'How do I get into the MedBay? '
    [
        'What unlocks doors? ',
        'Have you searched the Galley? ',
        MedbayHint,
        'You\'ll need the Medbay Key Card to open the medbay door. '
    ]
    
    openWhenSeen = Meddoor
    closeWhenTrue = (me.location == MedBay)
;


/*
 * Hint response for Medbay. 
 */
++ MedbayHint: Hint 'Perhaps you can unlock the Medbay door with the Medbay Key. ' [MedbayGoal] ;


/*
 * Hint requests and responses for Security Room. 
 */
++ SecurityGoal : Goal 'How do I get into the Security room? '
    [
        'Did you acqire a new Key card recently? ',
        'Have you searched the Bathroom? ',
        SecurityHint,
        'You can find the Security card in the Bathroom. '
    ]
    
    openWhenSeen = doctor
    closeWhenTrue = (me.location == Securityroom)
;


/*
 * Hint response for Security Room. 
 */
++ SecurityHint : Hint 'The Security room key may be in the Bathroom. ' [SecurityGoal] ;


/*
 * Hint requests and responses for Bathroom.
 */
++ BathroomGoal : Goal 'Theres got to be someway to get to the bathroom. '
    [
        'Maybe the key is somewhere I vesited recently',
        'Did you get all the items in the Medbay',
        BathroomHint,
        'You can find the Bathroom card in the Medbay.'
    ]
    
    openWhenSeen = veteran
    closeWhenTrue = (me.location == Bathroom)
;


/*
 * Hint response for Bathroom.
 */
++ BathroomHint : Hint 'The Bathroom key may be in the Medbay' [BathroomGoal] ;


/*
 * Hint requests and responses for ShuttleBay.
 */
++ ShuttleBayGoal : Goal 'Theres got to be someway to get to the ShuttleBay. '
    [
        'The key must be in an important room',
        'Have I checked the Bridge yet?',   
        ShuttleBayHint,
        'You can find the ShuttleBay card in the Bridge.'
    ]
    
    openWhenSeen = captain
    closeWhenTrue = (me.location == ShuttleBay)
;


/*
 * Hint response for ShuttleBay.
 */
++ ShuttleBayHint : Hint 'The ShuttleBay key may be in the Bridge' [ShuttleBayGoal] ;