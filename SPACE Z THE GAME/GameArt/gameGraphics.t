#charset "us-ascii"
#include <adv3.h>
#include <en_us.h>

  /*
   *   This file uses customBanner.t to display graphics in a second game
   *   banner. It uses the player's look at "object" to display an object if it
   *   is available to be displayed. No default graphic.
   */
artBanner: CustomBannerWindow {
    
    /* 
     *   Checks if the system can display png graphics.
     */
    canDisplay = (systemInfo(SysInfoJpeg))
    
    /*
     *   The one property that must be defined on each instance of a
     *   CustomBannerWindowis bannerArgs, which takes the form: bannerArgs =
     *   [parent, where, other, windowType, align, size, sizeUnits, styleFlags]
     *
     *   where each list element has the same meaning at the corresponding
     *   argument to BannerWindow.showBanner()
     */
    bannerArgs = [nil, BannerAfter, statuslineBanner, BannerTypeText, 
        BannerAlignRight,10 , BannerSizeAbsolute, BannerStyleBorder]
        
//        currentContents = '<img src="aciiArt/spacestation.jpg" >'
        autoSize = true
;
              
    showArt(description)  {
        clearWindow();
         
//        picWin = bannerCreate(nil, BannerAfter, statuslineBanner.handle_, BannerTypeText, 
//              BannerAlignTop, 10, BannerSizeAbsolute, BannerStyleBorder);

     /*
      *   Calling updateContents() changes what the banner displays. It contains
      *   2 arguments but the 2nd argument is optional.
      */
    if (description == 'bloodyzombie' )  {
        artBanner.updateContents('<img src="asciiArt/bloodyzombie.jpg" height="300">');
    }               
    else if (description == 'cactus' )  {
        artBanner.updateContents('<img src="asciiArt/cactus.jpg"height="250">');
    }   
     else if (description == 'doctor' )  {
        artBanner.updateContents('<img src="asciiArt/doctor.jpg"height="250">');
    }   
     else if (description == 'fullmalezombie' )  {
        artBanner.updateContents('<img src="asciiArt/fullmalezombie.jpg"height="250">');
    }   
     else if (description == 'keycard' )  {
        artBanner.updateContents('<img src="asciiArt/keycard.jpg"  height="250">');
    }   
    else if (description == 'medkit' )  {
        artBanner.updateContents('<img src="asciiArt/medkit.jpg" height="250">');
    } 
     else if (description == 'metaldoor' )  {
        artBanner.updateContents('<img src="asciiArt/metaldoor.jpg" height="300">');
    } 
     else if (description == 'spacestation' )  {
        artBanner.updateContents('<img src="asciiArt/spacestation.jpg" height="300">');
    } 
    else if (description == 'sword' )  {
        artBanner.updateContents('<img src="asciiArt/sword.jpg" height="200">');
    } 
    else if (description == 'veteran' )  {
        artBanner.updateContents('<img src="asciiArt/veteran.jpg" height="250">');
    } 
    else if (description == 'womanzombie' )  {
        artBanner.updateContents('<img src="asciiArt/womanzombie.jpg" height="250">');
    } 
}

}