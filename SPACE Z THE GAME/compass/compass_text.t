#charset "us-ascii"

/*
 *   TADS 3 Compass Extension. A text-only compass.
 *
 *   You can use this extension however you want, but please make all
 *   improvements or modifications available to the IF commuinity.
 *
 *   (c) 2002, 2004 Steve Breslin (steve.breslin@gmail.com)
 *       2006 Krister Fundin (fundin@yahoo.com)
 */

#include "adv3.h"

/* ---------------------------------------------------------------------- */
/*
 *   Text-only compass writer. This will create a text-grid banner and use
 *   various ASCII characters for drawing the compass rose. It should work
 *   on any interpreter with support for banners.
 */
textCompass: CompassWriter
    /* display the compass banner */
    showBanner(parent, where, other, align, style)
    {
        /*
         *   Create a text-grid banner. Since we know that it will be 3 x 3
         *   characters, we can set the size explicitly.
         */
        return compassBanner.showBanner(parent, where, other,
                                        BannerTypeTextGrid, align,
                                        3, BannerSizeAbsolute, style);
    }

    /* start writing the compass */
    beginCompass()
    {
        /* use the default foreground and background colours */
        compassBanner.setTextColor(ColorText, ColorTextBg);

        /* proceed as usual */
        return inherited();
    }

    /* draw the compass for a specific direction */
    writeCompassDir(idx, stat)
    {
        /*
         *   if this is the centre square, or if the direction is active,
         *   print a suitable character
         */
        if (idx == 5 || stat != nil)
        {
            /* look up the index in our list of character graphics */
            say(graphic[idx]);
        }
        else
        {
            /*
             *   Display a non-breakable space. We use hexadecimal notation,
             *   since HTML entities like &nbsp; aren't understood in
             *   text-grid banners.
             */
            "\u00A0";
        }

        /* print a newline if we're at the rightmost column */
        if ((idx - 1) % 3 == 2)
            "\n";
    }

    /*
     *   a list of characters to use for the different parts of the compass
     *   rose
     */
    graphic = ['\\', '|', '/', '-', 'O', '-', '/', '|', '\\']
;

