CarPlay Activator
=============

Negates the need for a "CarPlay supported™" car, and runs the CarPlay UI directly on top of SpringBoard on an iOS device.

**Notice:**  
This is **extremely** buggy and unfinished at the moment. I'm only releasing this now for documentation purposes and to see if anyone else wants to help finish this faster than I can. ;)

This is meant for *developers-only*, I'm not held liable if you brick SpringBoard, so please don't share any compiled debs at the moment! :)

If you do install this and made the mistake of not being a developer who knows what they're doing... ssh into your phone and run this command to uninstall it:

`dpkg -r ca.adambell.carplayactivator`

I noted all the bugs I've currently found / noticed so I'll be working on ironing those out over the coming week(s).

Also I'll be sure to do a formal write-up on how it all works once all of this is finished and useable.

Also also CarPlay Activator is an extremely lame codename, so that'll be changing... probably. :)

![Screenshot1](https://github.com/b3ll/CarPlayActivator/raw/master/Screenshots/Screenshot1@2x.png "CarPlay Activator Screenshot 1")  
![Screenshot2](https://github.com/b3ll/CarPlayActivator/raw/master/Screenshots/Screenshot2@2x.png "CarPlay Activator Screenshot 2")  
![Screenshot3](https://github.com/b3ll/CarPlayActivator/raw/master/Screenshots/Screenshot3@2x.png "CarPlay Activator Screenshot 3")  
![Screenshot4](https://github.com/b3ll/CarPlayActivator/raw/master/Screenshots/Screenshot4@2x.png "CarPlay Activator Screenshot 4")  

## How do I compile?
I used Theos for this. You'll need to install them and setup the appropriate environment variables etc as well as configuring. Info on that [here](http://iphonedevwiki.net/index.php/Theos/Getting_Started).

ARM64 support is enabled by default and if you need help setting that up check [here](http://iphonedevwiki.net/index.php/Updating_extensions_for_iOS_7).

If you edit the Makefile you can specify your iOS device's ip and such to build and run using `make package install`. Otherwise you can simply `make package` to generate a .deb file and install that by any means.

## Price?
Totally free! If you'd like to support my continuation of this project (and others!), feel free to [donate](http://www.adambell.ca/donate/)! It'd be much appreciated :D

## License?
Pretty much the BSD license, just **don't** repackage it and call it your own please!

Also if you do make some changes, feel free to make a pull request and help make things more awesome!

## Contact Info?
Feel free to follow me on twitter: [@b3ll](https://www.twitter.com/b3ll)!  
Though I don't really like to handle support requests there...
