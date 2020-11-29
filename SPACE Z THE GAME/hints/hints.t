#charset "us-ascii"
#include <adv3.h>
#include <en_us.h>


 TopHintMenu 'Hints';
+ HintMenu 'Level progression';

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

++ MedbayHint: Hint 'Perhaps you can unlock the Medbay door with the Medbay Key. ' [MedbayGoal] ;

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

++ SecurityHint : Hint 'The Security room key may be in the Bathroom. ' [SecurityGoal] ;


    
