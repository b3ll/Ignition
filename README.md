Ignition
=============

Negates the need for a "CarPlay supported™" car, and runs the CarPlay UI directly on top of SpringBoard on an iOS device.

**Notice:**  
This is **extremely** buggy and unfinished at the moment. I'm only releasing this now for documentation purposes and to see if anyone else wants to help finish this faster than I can. ;)

This is meant for *developers-only*, I'm not held liable if you brick SpringBoard, so please don't share any compiled debs at the moment! :)

If you do install this and made the mistake of not being a developer who knows what they're doing... ssh into your phone and run this command to uninstall it:

`dpkg -r ca.adambell.ignition`

I noted all the bugs I've currently found / noticed so I'll be working on ironing those out over the coming week(s).

Also I'll be sure to do a formal write-up on how it all works once all of this is finished and useable.

![Screenshot1](https://github.com/b3ll/CarPlayActivator/raw/master/Screenshots/Screenshot1@2x.png "CarPlay Activator Screenshot 1")  
![Screenshot2](https://github.com/b3ll/CarPlayActivator/raw/master/Screenshots/Screenshot2@2x.png "CarPlay Activator Screenshot 2")  
![Screenshot3](https://github.com/b3ll/CarPlayActivator/raw/master/Screenshots/Screenshot3@2x.png "CarPlay Activator Screenshot 3")  
![Screenshot4](https://github.com/b3ll/CarPlayActivator/raw/master/Screenshots/Screenshot4@2x.png "CarPlay Activator Screenshot 4")  

## Explanation
To be honest a lot of this nonsense could be completely avoided if a secondary "fake" FBSDisplay could be created and then used. That way SBApplications could create / own proper carScenes and there'd be a lot less things that were broken...

Most of the CarPlay checking logic involves checking for both multiple UIScreens, the UIScreen interfaceIdiom, and FBSDisplay -> FBScene lookups. However, creating a fake FBSDisplay requires creating a fake CADisplay which isn't a lot of fun :P

Basically here's how it works (I think... some parts are probably wrong or off):

FrontBoard associates one FBSDisplay as the main display and has a bunch of FBScenes which are each SBApplication's mainScene. Once there's a second FBSDisplay available it can then generate a carScene for each SBApplication who's deemed capable. These carScenes would then be presented onto any externally connected screens (secondary FBSDisplay). 

Originally, I had tried high-jacking a FBSDisplay whenever it was created and just duplicating that screen into a secondary FBSDisplay object with the same CADisplay object... and then shoving that FBSDisplay object into it's own lookup table to make it *appear* as if multiple screens were available. However. this causes UIScreen to freak out as it deems both those screens as the same. Also loads of the OS did *not* like this :P

What I'm doing is just making all UIScreens appear as CarPlay screens as well as forcing all applications to render in landscape (as CarPlay on external screens is forced to portrait). In addition this means that each SBApplication's carScene is the mainScene, which doesn't guarantee success.

Creating a local AirPlay server and then hacking touches to work on a view (who's contents are a secondary screen projected locally, using the device to AirPlay + mirroring) could be a neat solution to this, but I haven't tried it yet. That would grant us a legitimate second FBSDisplay to play with.

## How do I compile?
I used Theos for this. You'll need to install them and setup the appropriate environment variables etc as well as configuring. Info on that [here](http://iphonedevwiki.net/index.php/Theos/Getting_Started).

ARM64 support is enabled by default and if you need help setting that up check [here](http://iphonedevwiki.net/index.php/Updating_extensions_for_iOS_7).

I'm using [my own fork of theos](https://github.com/b3ll/theos), which is in-turn forked from @rpetrich's fork.

If you edit the Makefile you can specify your iOS device's ip and such to build and run using `make package install`. Otherwise you can simply `make package` to generate a .deb file and install that by any means.

## Price?
Totally free! If you'd like to support my continuation of this project (and others!), feel free to [donate](http://www.adambell.ca/donate/)! It'd be much appreciated :D

## License?
Pretty much the BSD license, just **don't** repackage it and call it your own please!

Also if you do make some changes, feel free to make a pull request and help make things more awesome!

## Contact Info?
Feel free to follow me on twitter: [@b3ll](https://www.twitter.com/b3ll)!  
Though I don't really like to handle support requests there...

## Special Thanks
[Travis Beckham](http://thenounproject.com/squidfingers) for the vectorized car image!
