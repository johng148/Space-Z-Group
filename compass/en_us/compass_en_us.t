#charset "us-ascii"

/*
 *   TADS 3 Compass Extension. English-specific definitions.
 *
 *   You can use this extension however you want, but please make all
 *   improvements or modifications available to the IF commuinity.
 *
 *   (c) 2002, 2004 Steve Breslin (steve.breslin@gmail.com)
 *       2006 Krister Fundin (fundin@yahoo.com)
 */

#include <adv3.h>
#include <en_us.h>

/* ---------------------------------------------------------------------- */
/*
 *   Define grammar for turning the compass on and off.
 */
VerbRule(CompassOn)
    'compass' 'on'
    : CompassStatusAction

    stat_ = true

    verbPhrase = 'turn/turning the compass on'
;

VerbRule(CompassOff)
    'compass' 'off'
    : CompassStatusAction

    stat_ = nil

    verbPhrase = 'turn/turning the compass off'
;

/* ---------------------------------------------------------------------- */
/*
 *   New messages.
 */
modify libMessages
    /* acknowledge turning the compass on or off */
    acknowledgeCompassStatus(stat)
    {
        "<.parser>The compass rose is now
        <<stat ? 'enabled' : 'disabled'>>.<./parser> ";
    }

    /* explain why the compass can't be turned on */
    compassNotAvailable = "<.parser>Sorry, but this interpreter is not
        capable of displaying any compass rose.<./parser> "
;

