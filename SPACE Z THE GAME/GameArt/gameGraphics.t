#charset "us-ascii"
#include <adv3.h>
#include <en_us.h>

  
/*
 *   This file uses customBanner.t to display graphics in a second game
 *   banner. It uses the player's look at "object" to display an object if it
 *   is available to be displayed. No default graphic.
 */
artBanner: CustomBannerWindow {

    // Checks if the system can display png graphics.
    canDisplay = (systemInfo(SysInfoJpeg))
    
    // The one property that must be defined on each instance of a CustomBannerWindowis bannerArgs, which takes the form: bannerArgs = [parent, where, other, windowType, align, size, sizeUnits, styleFlags].
    bannerArgs = [nil, BannerAfter, statuslineBanner, BannerTypeText, 
        BannerAlignRight,10 , BannerSizeAbsolute, BannerStyleBorder]

    // Auto sizes the photos.
    autoSize = true
;



/*
 * This function is called to determine the image that is displayed for the art Banner.
 */
showArt(description)  {
    clearWindow();

    // Calling updateContents() changes what the banner displays. It contains two arguments but the second argument is optional.
    if (description == 'bloodyzombie' )  {
        artBanner.updateContents('<img src="asciiArt/bloodyzombie.jpg" height="300">');
    } // end of if              
    else if (description == 'cactus' )  {
        artBanner.updateContents('<img src="asciiArt/cactus.jpg"height="250">');
    } // end of else if
     else if (description == 'doctor' )  {
        artBanner.updateContents('<img src="asciiArt/doctor.jpg"height="250">');
    } // end of else if 
     else if (description == 'fullmalezombie' )  {
        artBanner.updateContents('<img src="asciiArt/fullmalezombie.jpg"height="250">');
    } // end of else if  
     else if (description == 'keycard' )  {
        artBanner.updateContents('<img src="asciiArt/keycard.jpg"  height="250">');
    } // end of else if  
    else if (description == 'medkit' )  {
        artBanner.updateContents('<img src="asciiArt/medkit.jpg" height="250">');
    } // end of else if
     else if (description == 'metaldoor' )  {
        artBanner.updateContents('<img src="asciiArt/metaldoor.jpg" height="300">');
    } // end of else if
     else if (description == 'spacestation' )  {
        artBanner.updateContents('<img src="asciiArt/spacestation.jpg" height="300">');
    } // end of else if
    else if (description == 'sword' )  {
        artBanner.updateContents('<img src="asciiArt/sword.jpg" height="200">');
    } // end of else if
    else if (description == 'veteran' )  {
        artBanner.updateContents('<img src="asciiArt/veteran.jpg" height="250">');
    } // end of else if
    else if (description == 'womanzombie' )  {
        artBanner.updateContents('<img src="asciiArt/womanzombie.jpg" height="250">');  
    } // end of else if
    else if (description == 'disfiguredzombie' )  {
        artBanner.updateContents('<img src="asciiArt/disfiguredzombie.jpg" height="250">');
    } // end of else if
    else if (description == 'chef' )  {
        artBanner.updateContents('<img src="asciiArt/chef.jpg" height="250">');
    } // end of else if
    else if (description == 'kitchenknife' )  {
        artBanner.updateContents('<img src="asciiArt/kitchenknife.jpg" height="250">');
    } // end of else if   
    else if (description == 'captain' )  {
        artBanner.updateContents('<img src="asciiArt/captain.jpg" height="250">');
    } // end of else if   
} // end of function showArt
} // end of artBanner
 

/*
 * This function modifies the thing object to display a picture if the player looks at a specific object that has a picture.
 */
modify Thing
    pic = nil
    mainExamine() {
        inherited();
   
        // If pic exists then it will be shown.
        if( pic ) {
            pic.showPic();
        } // end of if
    } // end of mainExamine
;