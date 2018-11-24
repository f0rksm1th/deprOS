deprOS  
======
**"Depression Operating System"** or **"Depressed Operating System"** or **"Depressing Operating System"**  

_Status: **pre-release**_  


**Disclaimer**  

I hereby permit using this software.  
Really, this is a conceptual art project which isn't meant to actually be used.  
Using it damages the Tor VPN network by using its resources for shit, damages your computer system by making it vulnerable (this software opens security holes by enabling its webbrowser to execute files with superuser permissions) and using it also damages your brain.   
Hiermit verbiete ich das Benutzen dieser Software.  
Ich stehe unter deutschem Gesetz. Wir können uns gerne über Satire, Freiheit der Kunst und Linklisten unterhalten.  
Lots of love to the open source community, in this case especially the Arch and Tor community.  

**About**  

This repo contains the configuration files of deprOS.  
deprOS is a live OS that is made for browsing the internet in a specific way.  
It comes with only one window of the openbox windowmanager giving the user a reconfigured version of tor-browser in fullscreen.  

You could turn this into a practical Tor-Browser live OS by reseting userChrome.css, rc.xml, torbutton@torproject.org.xpi, tor-launcher@torproject.org.xpi and prefs.js. That's not what I intended this software for, but whatever - copyleft  

A website (/root/index.html) emulates the desktop environment.  

**Requirements**  
- Archiso  


**Devlog**

deprOS is built on a slightly reconfigured installation of Arch Linux as distributed on 2018.11.01 (archlinux-2018.11.01-x86_64.iso).  
The compiled kernel was taken as is.  
At the time of writing, deprOS has only ever been run inside of VirtualBox. That's why wifi, graphic and sound need reconfiguration soon.  
The system has no user, only root.  
It's also pretty big. I built on Arch because I want the conveniences and hardware support. It's not meant to be super optimized. In the spirit of depression: I don't care.  
The Arch installation could probably still use some slimming down... Sub 4GB for the whole image would be nice, or sub 2GB, or 1... It's a little over 4GB now.   
After booting deprOS it automatically logs in as root and gives the user a shell-based WiFi-selection if internet connection is not present.  
After internet connection was established, deprOS starts an openbox-session which has the Tor browser in its autostart, directing it to an index.html file present in file:///root.index.html, which contains the one Website that is your hub / "desktop".  
The browser is reconfigured which means it comes with a custom addon (deprOS-shutdown to shut down your OS from the browser), widely reconfigured to "fit the needs" of the OS and a redesigned interface.  
Changes were also made to tor-launcher and tor-button in terms of css and xul.  

How the software is exactly configured, you can tell from the files in the "important files" folder.  

The following packages are important because they make the "core" of the system:
- xinit / xorg / x11
- openbox
- tor-browser
Other dependancies:
- base-devel
- package-query
- makepkg (needs reconfiguration to and build as root)
- getty
- wget
- grep
- sudo (for getting makepkg to build, more on that further down)

...  

Currently installed that can get rid of:
- yaourt (tor-browser was installed with that)

...  

Have sudo installed because makepkg requires a hack for building it without a user account present: sudo -u nobody makepkg -s --noconfirm || true

**Ideas**
- change url
- add .htacces so only deprOS users can visit website

**ToDo**  
Soon:
- concept how to handle keyboard (remove all keyshortcuts from system or disable entirely? don't want user to browse sites which are not depressing)
- finish frontend, make it dynamic for later
- figure out ways to make a live usb-stick / dvd from this (archiso? dd?)
- keyboard layouts autodetect? wtf
- remove midori
- Release  
- "Meh.." - Error Messages --> Locale files

Before release:
- remove ssh
- systemctl disable dhcpcd (? use netctl underneath wifi-menu instead)
- water-proofed display detection (Xauthority?)
- Drivers:
  - wifi-menu / netctl if internet connection can't be established after boot before running desktop (deprOS checks internet connection before running desktop and halts if there is none), so the users can "just connect" by selecting their network in shell with arrow-keys, pressing enter and entering their password.
  - System independent video and sound drivers (xorg-drivers, PulseAudio (?)). As it is now in VirtualBox, sound-configuration has not been touched at all and is not working.  




**TL;DR**

deprOS depresses you and / or your computer.  
It offers as little interaction and configuration as necessary.  
It's a live operating system for your computer that comes on an USB stick. If you stick it into your computer, it should boot into deprOS instead of your usual operating system.  
Taking control over systems away from the us makes things easier.   While gaining proportionally less control, we have access to a huge amount of more and more information.  
I believe parts of these two trends are not healthy and we the people have not found good ways of dealing with these parts yet. Or is it just me?  
deprOS plays right into the vicious cycle of being informationally overfed and using dumb (aka smart) and restrictious interfaces. This is satire.  
It also plays with the spoiled gluttony of having food, drugs, communication, sex and even intel at the very tip of your finger. All you have to do is click.

I have some questions and I'm tackling them with this conceptual artwork.  
Some of these questions touch the topics of cybernetics, distraction, losing jobs to machines, communication and of course depression.  
One step back, calling an OS a conceptual artwork raises questions in itself. I'd like to hear about more of them. The software should make you feel, but in a conceptual way because it's not using the software itself that should make you feel (please, no!), but knowing of its existence should.  
It was my primary intention to create an artwork which is an OS and vise versa. I think of computer systems and computer memory, huge grids of transistors, as rooms that can be played with.

The OS comes with some depressive analogies in the way it is set up that tech savvy people can observe.  
Some examples: There's no user, only you as root, while still having no access to anything. The internet connection runs on VPN because darkness.  
It's fun to make these analogies up.
Of course you can hack this OS to "break its chains". This would make you perform a metaphorical act of overcoming depression. That is not my intention, but it's there. Learning all that stuff is depressing in itself lol.


Changes Sven

archiso installieren,
releng beispielconfig kopieren
beigefügten stuff importieren
configfiles rein,
