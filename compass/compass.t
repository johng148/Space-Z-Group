#charset "us-ascii"

/*
 *   TADS 3 Compass Extension. Main source file, language-independent.
 *
 *   You can use this extension however you want, but please make all
 *   improvements or modifications available to the IF commuinity.
 *
 *   (c) 2002, 2004 Steve Breslin (steve.breslin@gmail.com)
 *       2006 Krister Fundin (fundin@yahoo.com)
 */

#include <adv3.h>

/* ---------------------------------------------------------------------- */
/*
 *   Our ModuleID.
 */
ModuleID
    name = 'TADS 3 Compass Extension'
    byline = 'by Steve Breslin and Krister Fundin'
    htmlByLine =
        'by <a href="mailto:steve.breslin@gmail.com">Steve Breslin</a>
        and <a href="mailto:fundin@yahoo.com">Krister Fundin</a>'
    version = '3'
;

/* ---------------------------------------------------------------------- */
/*
 *   The compass banner window.
 */
compassBanner: BannerWindow
    /* initialize */
    initBannerWindow()
    {
        /* if we're already initialized, do nothing */
        if (inited_)
            return;

        /* inherit the default handling (to set our 'inited_' flag) */
        inherited();

        /* try to find a suitable compass writer */
        compassWriter = allCompassWriters.valWhich({ x: x.canShowCompass });

        /* if there was none, then we can't display a compass at all */
        if (compassWriter == nil)
            return;

        /* if we have a parent, make sure that it's initialized */
        if (parent != nil)
            parent.initBannerWindow();

        /* ditto for the 'other' parameter, if specified */
        if (other != nil)
            other.initBannerWindow();

        /* let the compass writer try to create the banner */
        if (compassWriter
                .showBanner(parent, where, other, align, style) == nil)
        {
            /*
             *   For unknown reasons, the banner couldn't be created. Set
             *   the compass writer to nil.
             */
            compassWriter = nil;
        }
    }

    /*
     *   Display the compass. This is called every turn by a prompt daemon.
     */
    showCompass()
    {
        /* do nothing if we're inactive or if there's no compass writer */
        if (isActive == nil || compassWriter == nil)
            return;

        /* let the compass writer show the compass */
        compassWriter.showCompass();
    }

    /* change our active/inactive state */
    makeActive(stat)
    {
        /* see if we're actually changing the state */
        if (stat != isActive)
        {
            /* either remove or reinitialize the banner */
            if (stat)
            {
                /* let the compass writer create the banner */
                compassWriter
                    .showBanner(parent, where, other, align, style);
            }
            else
            {
                /* remove the banner */
                removeBanner();
            }
            
            /* set the new state */
            isActive = stat;
        }
    }

    /*
     *   Our compass writer object. This is responsible for drawing the
     *   actual compass.
     */
    compassWriter = nil

    /* a list of all available compass writers */
    allCompassWriters = []

    /*
     *   Five properties that determine our position and appearance on the
     *   display. These should be mostly indepedent of the compass writer in
     *   use, so we pass these on to its showBanner() method, making it
     *   easier to alter the position of the compass. By default, we'll
     *   place ourselves to the right of the status line.
     */
    parent = statuslineBanner
    where = BannerLast
    other = nil
    align = BannerAlignRight
    style = BannerStyleVStrut

    /* flag: is the compass to be displayed at all? */
    isActive = true
;

/*
 *   When displaying the compass, all the details are taken care of by a
 *   compass writer. By making these separate objects, we can define several
 *   that are suited for different types of interpreters, while also making
 *   it possible to remove ones that aren't needed (in case a particular
 *   story requires a certain type of interpreter anyway).
 */
class CompassWriter: object
    /* can we display a compass on the current interpreter? */
    canShowCompass()
    {
        /*
         *   since our compass will show up in a banner, support for the
         *   banner API is a minimum requirement
         */
        return (systemInfo(SysInfoBanners) == 1);
    }

    /*
     *   Our priority. In case there are several compass writers available,
     *   the one with the highest priority will be used.
     */
    priority = 100

    /* display the compass banner */
    showBanner(parent, where, other, align, style)
    {
        /*
         *   We'll create an ordinary text banner. Instances can override if
         *   they need something different.
         */
        return compassBanner.showBanner(parent, where, other,
                                        BannerTypeText, align, nil, nil,
                                        style);
    }

    /* display the compass */
    showCompass()
    {
        /* start by clearing the compass banner */
        compassBanner.clearWindow();

        /*
         *   Start writing the compass. If this method needs to change the
         *   current output stream, then the previous one should be
         *   returned.
         */
        local oldStr = beginCompass();

        /* do the actual writing */
        writeCompass();

        /* finish writing the compass */
        endCompass(oldStr);
    }

    /* start writing the compass */
    beginCompass()
    {
        /* redirect output to the compass banner */
        return compassBanner.setOutputStream();
    }

    /* write the compass */
    writeCompass()
    {
        local pc, loc, locIsLit, idx, dir, conn;

        /* get the player character */
        pc = gPlayerChar;

        /* get the location of the player */
        loc = pc.location;

        /* if we have a location, see if there's any light to see by */
        if (loc != nil)
            locIsLit = loc.wouldBeLitFor(pc);

        /* go through the directions from northwest to southeast */
        for (idx = 1 ; idx <= 9 ; idx++)
        {
            /*
             *   If the player's location was nil, then we'll draw the
             *   entire compass as inactive. Also skip the directions if
             *   this is the centre square.
             */
            if (loc == nil || idx == 5)
            {
                writeCompassDir(idx, nil);
            }
            else
            {
                /* get the current direction */
                dir = allDirections[idx];

                /* get the connector leading this direction */
                conn = loc.getTravelConnector(dir, pc);

                /*
                 *   Check if there was a connector at all, and if it should
                 *   be reported to the player. The rules for this are the
                 *   the same as for other exit listings.
                 */
                if (conn != nil
                    && conn.isConnectorApparent(loc, pc)
                    && conn.isConnectorListed
                    && (locIsLit || conn.isConnectorVisibleInDark(loc, pc)))
                {
                    /* draw it in active state */
                    writeCompassDir(idx, true);
                }
                else
                {
                    /* draw it in inactive state */
                    writeCompassDir(idx, nil);
                }
            }
        }
    }

    /*
     *   Draw the compass for a specific direction. The first argument is
     *   not the actual direction but rather an index: 1 for northwest, 2
     *   for north, and so on, up to 9 for southeast. Watch out for the
     *   middle square, index 5.
     */
    writeCompassDir(idx, stat) { }

    /* finish writing the compass */
    endCompass(oldStr)
    {
        /* optionally restore the previous output stream */
        if (oldStr != nil)
            outputManager.setOutputStream(oldStr);

        /* flush the compass banner */
        compassBanner.flushBanner();
    }

    /* a list of all the compass directions */
    allDirections =
        [
            northwestDirection, northDirection, northeastDirection,
            westDirection,      nil,            eastDirection,
            southwestDirection, southDirection, southeastDirection
        ]
;

/*
 *   Pre-initialization.
 */
compassPreinit: PreinitObject
    execute()
    {
        local lst = [];

        /* generate a list of all the compass writers */
        forEachInstance(CompassWriter, { cur: lst += cur });

        /* sort the compass writers in descending order of priority */
        lst = lst.sort(SortDesc, { a, b: a.priority - b.priority });

        /* store the list in the compass banner window */
        compassBanner.allCompassWriters = lst;

        /*
         *   Create a prompt daemon for updating the compass. We'll give it
         *   a high eventOrder, so that it runs after most other prompt
         *   daemons. (This shouldn't matter much, but it doesn't hurt to
         *   make sure that nothing else will be printed to the main window
         *   after updating any banners.)
         */
        new PromptDaemon(compassBanner, &showCompass).eventOrder = 500;
    }
;

/*
 *   Define an action for turning the compass on or off.
 */
DefineSystemAction(CompassStatus)
    execSystemAction()
    {
        /*
         *   if we are trying to turn the compass on but there's no compass
         *   writer, explain that the compass isn't available on this
         *   interpreter
         */
        if (stat_ == true && compassBanner.compassWriter == nil)
        {
            gLibMessages.compassNotAvailable();
        }
        else
        {
            /* set the new status */
            compassBanner.makeActive(stat_);

            /* acknowlede the change */
            gLibMessages.acknowledgeCompassStatus(stat_);
        }
    }

    /* there is no point in repeating this command */
    isRepeatable = nil
;

