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
 *   The ModuleID.
 */
ModuleID
    name = 'TADS 3 HP Display'
    byline = 'by Space Z Group'
    htmlByLine =
        'by <a href="mailto:emailhere@nmsu.edu">GroupMembers</a>
        and <a href="mailto:emailhere@nmsu.com">SpaceZGroup</a>'
    version = '1'
;

/* ---------------------------------------------------------------------- */
/*
 *   The hitpoints display banner window.
 */
hitpointsBanner: BannerWindow
    /* Initialize */
    initBannerWindow()
    {
        /* Do nothing if already initialized. */
        if (inited_)
            return;

        /* inherit the default handling (to set our 'inited_' flag) */
        inherited();

        /* try to find a suitable diplay writer */
        hpdisplayWriter = allhpdisplayWriters.valWhich({ x: x.canShowHpDisplay });

        /* if there was none, then we can't display hitpoints at all */
        if (hpdisplayWriter == nil)
            return;

        /* if we have a parent, make sure that it's initialized */
        if (parent != nil)
            parent.initBannerWindow();

        /* Make sure 'other' parameter is also initialized, if specified */
        if (other != nil)
            other.initBannerWindow();

        /* let the HP display writer try to create the banner */
        if (hpdisplayWriter
                .showBanner(parent, where, other, align, style) == nil)
        {
            /*
             *   For unknown reasons, the banner couldn't be created. Set
             *   the HP display writer to nil.
             */
            hpdisplayWriter = nil;
        }
    }

    /*
     *   Display the hitpoints. This is called every turn by a prompt daemon.
     */
    showHPDisplay()
    {
        /* do nothing if we're inactive or if there's no HP display writer */
        if (isActive == nil || hpdisplayWriter == nil)
            return;

        /* let the HP display writer show the hitpoints */
        hpdisplayWriter.showHPDisplay();
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
                /* let the HP display writer create the banner */
                hpdisplayWriter
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
     *   The hitpoints display writer object. 
     */
    hpdisplayWriter = nil

    /* a list of all available displa writers */
    allhpdisplayWriters = []

    /*
     *   Five properties that determine our position and appearance on the
     *   display. These should be mostly indepedent of the displaywriter in
     *   use, so we pass these on to its showBanner() method, making it
     *   easier to alter the position of the HP display. By default, we'll
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
class HPDisplayWriter: object
    /* can we display a compass on the current interpreter? */
    canShowHpDisplay()
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
        return hitpointsBanner.showBanner(parent, where, other,
                                        BannerTypeText, align, nil, nil,
                                        style);
    }

    /* display the compass */
    showHPDisplay()
    {
        /* start by clearing the compass banner */
        hitpointsBanner.clearWindow();

        /*
         *   Start writing the compass. If this method needs to change the
         *   current output stream, then the previous one should be
         *   returned.
         */
        local oldStr = beginHpDisplay();

        /* do the actual writing */
        writeHpDisplay();

        /* finish writing the compass */
        endHpDisplay(oldStr);
    }

    /* start writing the compass */
    beginHpDisplay()
    {
        /* redirect output to the compass banner */
        return hitpointsBanner.setOutputStream();
    }

    /* write the compass */
    writeHpDisplay()
    {
        local pc, maxhp, currenthp;
        
        /* get the player character */
        pc = gPlayerChar;

        /*  */
        maxhp = pc.MaxHP;

        currenthp = pc.CurHP;
        
    }
;

///*
// *   Pre-initialization.
// */
//hpDisplayPreinit: PreinitObject
//    execute()
//    {
//        local lst = [];
//
//        /* generate a list of all the compass writers */
//        forEachInstance(hpdisplayWriter, { cur: lst += cur });
//
//        /* sort the compass writers in descending order of priority */
//        lst = lst.sort(SortDesc, { a, b: a.priority - b.priority });
//
//        /* store the list in the compass banner window */
//        hitpointsBanner.allhpdisplayWriters = lst;
//
//        /*
//         *   Create a prompt daemon for updating the compass. We'll give it
//         *   a high eventOrder, so that it runs after most other prompt
//         *   daemons. (This shouldn't matter much, but it doesn't hurt to
//         *   make sure that nothing else will be printed to the main window
//         *   after updating any banners.)
//         */
//        new PromptDaemon(hitpointsBanner, &showHPDisplay).eventOrder = 500;
//    }
//;

/*
 *   Define an action for turning the compass on or off.
 */
DefineSystemAction(HpDisplayStatus)
    execSystemAction()
    {
        /*
         *   if we are trying to turn the compass on but there's no compass
         *   writer, explain that the compass isn't available on this
         *   interpreter
         */
        if (stat_ == true && hitpointsBanner.hpdisplayWriter == nil)
        {
            gLibMessages.displayNotAvailable();
        }
        else
        {
            /* set the new status */
            hitpointsBanner.makeActive(stat_);

            /* acknowlede the change */
            gLibMessages.acknowledgeHpDisplayStatus(stat_);
        }
    }

    /* there is no point in repeating this command */
    isRepeatable = nil
;

