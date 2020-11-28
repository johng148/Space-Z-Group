#charset "us-ascii"

/*
 *   TADS 3 Hitpoints (HP) Display. Main source file, language-independent.
 *   This module was created by modifying the source code published by Steve
 *   Breslin and Krister Fundin: TADS 3 Compass Extension".
 *
 *   As the prior module states: "You can use this extension however you want, 
 *   but please make all improvements or modifications available to the IF community."
 */


#include <adv3.h>

/* ---------------------------------------------------------------------- */
/*
 *   An HTML compass writer. This will create a compass rose out of nine PNG
 *   images arranged in a table.
 */
htmlHPDisplay: HPDisplayWriter
    /* can we display a compass on the current interpreter? */
    canShowHPDisplay()
    {
        /*
         *   make sure that we're running on a HTML class interpreter which
         *   is capable of displaying PNG images
         */
        return (inherited()
                && systemInfo(SysInfoInterpClass) == SysInfoIClassHTML
                && systemInfo(SysInfoPng) == 1);
    }

    /*
     *   Give this compass writer a higher priority. If we can use the
     *   fancier HTML compass, then we'll do so; otherwise we'll fall back
     *   on the text version.
     */
    priority = 200

    /* start writing the compass */
    beginHpDisplay()
    {
        /* redirect output to our banner */
        local oldStr = inherited();

        /* set up a table for the images that make up the banner */
        "<table border=0 cellspacing=0 cellpadding=0>";

        /* return the previous output stream */
        return oldStr;
    }

    /* draw the compass for a specific direction */
    writeCompassDir(idx, stat)
    {
        /* start a new table row if we're in the leftmost column */
        if ((idx - 1) % 3 == 0)
            "<tr>";

        /* start a new table cell */
        "<td>";

        /* display a suitable image */
        writeCompassImage(idx, stat);

        /* close this cell */
        "</td>";

        /* close this row if we're in the rightmost column */
        if ((idx - 1) % 3 == 2)
            "</tr>";
    }

    /* display an image for a specific direction */
    writeCompassImage(idx, stat)
    {
        local link, file, width, height;

        /*
         *   set up a link using the name of this direction, but only if
         *   there was an exit leading there
         */
        link = (stat ? '<a href="' + allDirections[idx].name + '">' : nil);

        /* choose an image - the middle square is a special case */
        if (idx == 5)
        {
            /* ignore the stat parameter */
            file = graphic[idx];
        }
        else
        {
            /*
             *   choose image according to whether there was an exit in this
             *   direction
             */
            file = graphic[idx] + (stat ? 'exit' : 'noexit');
        }

        /*
         *   Determine the width of the image. The ones in the centre are
         *   smaller.
         */
        width = ((idx - 1) % 3 == 1 ? middleSize : flankSize);

        /*
         *   Repeat for the height. The compass should be square, so the
         *   sizes are the same.
         */
        height = ((idx - 1) / 3 == 1 ? middleSize : flankSize);

        /* display the hyperlink, if we have one */
        if (link != nil)
            say(link);

        /* display the image tag */
        say('<img border=0 src="compassres/' + file + '.png" width=' +
            toString(width) + ' height=' + toString(height) + '>');

        /* close link tag */
        if (link != nil)
            "</a>";
    }

    /* finish writing the compass */
    endCompass(oldStr)
    {
        /* close the table */
        "</table>";

        /* proceed as usual */
        inherited(oldStr);

        /* adjust the size of the banner */
        compassBanner.sizeToContents();
    }

    /* base filenames for the compass images */
    graphic = ['nw', 'n', 'ne', 'w', 'center', 'e', 'sw', 's', 'se']

    /*
     *   The width and height of the compass images. The ones at the corners
     *   use flankSize for both width and height, while the ones on the
     *   centre cross use the smaller middleSize for one or both of these.
     *   The default images are fairly large, since it is easier to shrink
     *   an image than to expand it. The sizes we use here are exactly a
     *   third of the original sizes.
     */
    flankSize = 28
    middleSize = 11
;

