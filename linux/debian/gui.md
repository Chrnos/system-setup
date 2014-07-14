
# Debian Wheezy GUI Documentation
#### Updated 2014-7-13

These are the instructions for setting up a customized OpenBox window manager, and various role supporting software, as well as a number of utility and development applications.

It assumes that work picks up where the template documentation left off.


## troubleshooting

A graphics card will be required, though driver installation varies wildly and won't be covered here.  If you install the packages below and cannot run startx or telinit 3 into the slim, then you may have to look elsewhere for future guides.


## install packages

**Here is a detailed breakdown of packages grouped by intended purpose or function.**

Desktop Package:

- desktop-base

Window Manager:

- openbox
- obconf
- obmenu
- menu

Menu Subsystem:

- tint2

Monitoring Tools:

- conky-all

Web Browser:

- chromium

Terminal Triggered Popups:

- zenity
- zenity-common

File Browser:

- pcmanfm

Terminal Audio Packages:

- alsa-base
- alsa-utils
- pulseaudio

Desktop Background Utilities:

- feh
- hsetroot

Lightweight Unicode Terminal:

- rxvt-unicode

Graphical Login Manager:

- slim

Xorg Packages:

- xorg
- xserver-xorg-video-all
- x11-server-utils
- xinit
- xinput
- xtightvncviewer
- suckless-tools

Lightweight Launcher:

- gmrun

Graphical Monitor Size & Position Management:

- arandr

Clipboard Utilities:

- clipit
- xsel

Graphical Privileged Prompt:

- gksu

Theming Packages:

- openbox-themes
- dmz-cursor-theme
- gnome-icon-theme
- gnome-icon-theme-extras
- lxappearance

GUI file search tool:

- catfish

_I think this is totally useful and should have an openbox hotkey._

GUI Keyboard Layout Toggle:

- fbxkb

_This package is a gui overlay that shows up in the menu with a flag to coordinate with languages, and is an interface to the xserver keyboard layouts.  It's a very nice lightweight language switcher._


##### commands

_Run to install all packages:

    aptitude install -ryq desktop-base openbox obconf obmenu menu tint2 conky-all chromium zenity zenity-common pcmanfm alsa-base alsa-utils pulseaudio volumeicon-alsa feh hsetroot rxvt-unicode slim xorg xserver-xorg-video-all x11-server-utils xinit xinput xtightvncviewer suckless-tools gmrun arandr clipit xsel gksu catfish fbxkb openbox-themes dmz-cursor-theme gnome-icon-theme gnome-icon-theme-extras lxappearance gparted vlc gtk-recordmydesktop chromium transmission transmission-cli openshot flashplugin-nonfree lame ffmpeg shared-mime-info fontconfig fontconfig-config fonts-droid fonts-droid fonts-freefont fonts-liberation fonts-takao ttf-mscorefonts-installer gimp gimp-plugin-registry evince bpython libX11-dev libmcrypt-dev python-dev python3-dev libperl-dev openjdk-7-jre yeahconsole


## system configuration


### installing custom fonts

This part is entirely optional, but I have some favorite fonts that I usually install:

- [ForMateKonaVe](https://github.com/cdelorme/system-setup/raw/develop/data/fonts/ForMateKonaVe.ttf)
- [epkyouka](https://github.com/cdelorme/system-setup/raw/develop/data/fonts/epkyouka.ttf)

Custom fonts can be installed globally into `/usr/share/fonts/`, or per-user at `~/.fonts/`; simply copy the font files into those folders.

After copying the files you will need to refresh the font cache using the `fc-cache` utility.


##### commands

_Run this to rebuild font cache:_

    fc-cache -fr


### configuring & theming slim

Slim is a UI that can be configured to run when the system starts and give you a UI to login with.  It is both lightweight and customizable.

_I often find myself using the terminal exclusively when accessing my system, so I don't really make use of slim, but if you want a system with multiple users or a graphical login it is excellent._

You may have to set it to boot at startup.

The theme configuration file can be found at `/`.


#### tips when using slim

To shutdown the system enter `halt` as the username followed by the root password.  Similarly to reboot the system use `reboot` as the username.


##### commands

_Run to activate slim at boot time:_

    INCOMPLETE

_my preferred slim configuration (`/`):_

    INCOMPLETE


### configuring & theming openbox

Files of importance:

- rc.xml config
- menu.xml config




### configuring pcmanfm



### configuring & theming conky

I usually have two conky processes running as it allows me to separately print out certain sets of data, and at different intervals.  For example log output does not need to be as commonly parsed, and separating it lets me reduce the amount of processing necessary.

_I may also use a lua script to enable transparency effects._





### configuring & theming tint2



### configuring & theming urxvt

Currently using this (it's pretty but not full-featured or matching my choice theme):

    !-------------------------------------------------------------------------------
    ! Xft settings
    !-------------------------------------------------------------------------------

    Xft.dpi:                    96
    Xft.antialias:              false
    Xft.rgba:                   rgb
    Xft.hinting:                true
    Xft.hintstyle:              hintslight

    !-------------------------------------------------------------------------------
    ! URxvt settings
    ! Colours lifted from Solarized (http://ethanschoonover.com/solarized)
    ! More info at:
    ! http://pod.tst.eu/http://cvs.schmorp.de/rxvt-unicode/doc/rxvt.1.pod
    !-------------------------------------------------------------------------------

    URxvt.depth:                32
    URxvt.geometry:             90x30
    URxvt.transparent:          false
    URxvt.fading:               0
    ! URxvt.urgentOnBell:         true
    ! URxvt.visualBell:           true
    URxvt.loginShell:           true
    URxvt.saveLines:            50
    URxvt.internalBorder:       3
    URxvt.lineSpace:            0

    ! Fonts
    URxvt.allow_bold:           false
    /* URxvt.font:                 -*-terminus-medium-r-normal-*-12-120-72-72-c-60-iso8859-1 */
    URxvt*font: xft:Monospace:pixelsize=14
    URxvt*boldFont: xft:Monospace:pixelsize=14

    ! Fix font space
    URxvt*letterSpace: -1

    ! Scrollbar
    URxvt.scrollStyle:          rxvt
    URxvt.scrollBar:            false

    ! Perl extensions
    URxvt.perl-ext-common:      default,matcher
    URxvt.matcher.button:       1
    URxvt.urlLauncher:          firefox

    ! Cursor
    URxvt.cursorBlink:          true
    URxvt.cursorColor:          #657b83
    URxvt.cursorUnderline:      false

    ! Pointer
    URxvt.pointerBlank:         true

    !!Source http://github.com/altercation/solarized

    *background: #002b36
    *foreground: #657b83
    !!*fading: 40
    *fadeColor: #002b36
    *cursorColor: #93a1a1
    *pointerColorBackground: #586e75
    *pointerColorForeground: #93a1a1

    !! black dark/light
    *color0: #073642
    *color8: #002b36

    !! red dark/light
    *color1: #dc322f
    *color9: #cb4b16

    !! green dark/light
    *color2: #859900
    *color10: #586e75

    !! yellow dark/light
    *color3: #b58900
    *color11: #657b83

    !! blue dark/light
    *color4: #268bd2
    *color12: #839496

    !! magenta dark/light
    *color5: #d33682
    *color13: #6c71c4

    !! cyan dark/light
    *color6: #2aa198
    *color14: #93a1a1

    !! white dark/light
    *color7: #eee8d5
    *color15: #fdf6e3


Found this on the web, may tailor to my liking:

    # these three lines enable clicking on links to open them ;)
    ## if you want to enable tab support, append ,tabbed to the next line
    ## then use shift+down arrow to create tabs and shift+{left,right} arrows to switch between them
    URxvt*perl-ext-common: default,matcher,-option-popup,-selection-popup,-realine
    URxvt*matcher.button: 1
    # don't forget to change this to your favorite browser
    URxvt*urlLauncher: chromium


### user configuration

For full privileges users should belong to these groups:

- fuse
- scanner
- bluetooth
- netdev
- audio
- video
- adm
- pulse-access

Many of these groups are assigned by default when a new user is created through the UI.

The `adm` group is necessary for log access; fuse gives the user mounting privileges.  The `pulse-access` group is intended for specific volume controls.  The others are all rather self-explanitory.


##### commands

_This can be done via a **single** command line:_

    usermod -aG adm,audio,video,fuse,scanner,netdev,bluetooth,pulse-access username


### gui volume controls with pulse and alsa

This uses the `volumeicon-alsa` package, and requires the user to be in the `pulse-access` group in order to modify the volume state.

Preferred volume config (`~/.???`):

    [StatusIcon]
    stepsize=3
    lmb_slider=false
    mmb_mute=false
    use_horizontal_slider=true
    show_sound_level=true
    onclick=urxvt -e 'alsamixer'
    theme=Default

    [Hotkeys]
    up_enabled=true
    down_enabled=true
    mute_enabled=true
    up=XF86AudioRaiseVolume
    down=XF86AudioLowerVolume
    mute=XF86AudioMute

    [Alsa]
    card=default

**The volumeicon package provides a UI component, but is not required to adjust the volume by hotkeys.**

**Still researching the volume controls via `XF86`.**


## [Youtube Downloader](https://github.com/rg3/youtube-dl)

This is a really cool command line utility that you can use to download (the highest quality) youtube videos without any GUI utilities.  It includes asynchronous processing and even spits out the percent status.


##### Commands

_Run these commands to download and install the `youtube-dl` command:_

    git clone https://github.com/rg3/youtube-dl
    cd youtube-dl
    sudo python setup.py install
    cd ..
    rm -rf youtube-dl











## Google Chrome Dev Channel

I prefer the dev channel of google chrome.  The easy way to install it is to go to your current web browser, search "Google Chrome Dev Channel" and then download the `.deb` and install it with `sudo dpkg -i`.

It should ask to be set as the default browser at first launch.


##### Commands

_Register google's apt key:_

    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -

_Create a file at `/etc/apt/sources.list.d/google` with these lines:_

    # Google Chrome repo http://www.google.com/linuxrepositories/
    deb http://dl.google.com/linux/chrome/deb/ stable main
    deb http://dl.google.com/linux/talkplugin/deb/ stable main
    deb http://dl.google.com/linux/earth/deb/ stable main
    deb http://dl.google.com/linux/musicmanager/deb/ stable main

_Run these commands to update aptitude:_

    sudo aptitude clean
    sudo aptitude update

_Install these packages:_

    sudo aptitude install -ryq google-chrome-stable google-chrome-unstable google-talkplugin

_Set as default browser:_

    update-alternatives --set x-www-browser /usr/bin/google-chrome-unstable
















## still investigating

I have a lot of software that I have not yet finished researching or have not successfully setup and want to add it to my list someday.


### console enhancements

Looking into `yeahconsole` to make `rxvt-unicode` operate similarly to guake.


### multiple keyboard layout configuration

This depends on `xorg` currently, but I have a lot of details to work out still.


### pipelight

For linux this is the alternative to silverlight.  You can run a browser in linux while it connects silverlight plugin through a wine bottle.

I have not yet tested this.


### [viewnoir](https://github.com/xsisqox/Viewnior)

Most other viewing or previewing software is extremely bad in either speed or simplicity.

Unfortunately this software requires newer packages than are available to debian, and attempts to build it have been unsuccessful.  I would like to try previous versions, or in the worst case scenario plan on installing it when Debian Jessie is released as the new stable.





























---

### [sublime text](http://www.sublimetext.com/)

Sublime Text is easily the best text editor I've used, featuring extremely speedy launch times, excellent plugin support, nearly identical UI cross platform, and font aliasing on windows.  It is well worth the sale price, but they currently offer it for use free of charge.

The first step is downloading it off their website; **we want the tarball and not the ubuntu `.deb` file.**

Simply extract the contents, and move the folder to where-ever you wish the software to live.

If you want to make your copy shared, install it to `/usr/local/`, otherwise you may consider creating a user folder like `~/applications/`.  _I prefer a local copy._

Next we want to install [package control](https://sublime.wbond.net/installation) for sublime text, which will give us the ability to effortlessly install any package and update it going forward.

I recommend these packages for the editor:

- [Package Control](https://sublime.wbond.net/)
- [Markdown Preview](https://github.com/revolunet/sublimetext-markdown-preview)
- [SublimeCodeIntel](https://github.com/SublimeCodeIntel/SublimeCodeIntel)
- [Origami](https://github.com/SublimeText/Origami)
- [EncodingHelper](https://github.com/SublimeText/EncodingHelper)

All sublime text configuration files are raw text, and can be easily modified.  Additionally they are mostly portable between platforms.


##### commands

_Grab the latest version off their website, and install it locally (asterisk `cp` mail fail if multiple items start with the same characters):_

    # Download Sublime Text 3
    curl -o ~/sublime.tar.bz2 http://c758482.r82.cf2.rackcdn.com/sublime_text_3_build_3059_x64.tar.bz2
    tar xf sublime.tar.bz2
    rm sublime.tar.bz2
    mkdir ~/applications
    mv Sublime* ~/applications/sublime_text/
    mkdir -p ~/bin
    ln -s ~/applications/sublime_text/sublime_text ~/bin/subl

_Install package control, run this inside sublime text console:_

    import urllib.request,os,hashlib; h = '7183a2d3e96f11eeadd761d777e62404' + 'e330c659d4bb41d3bdf022e94cab3cd0'; pf = 'Package Control.sublime-package'; ipp = sublime.installed_packages_path(); urllib.request.install_opener( urllib.request.build_opener( urllib.request.ProxyHandler()) ); by = urllib.request.urlopen( 'http://sublime.wbond.net/' + pf.replace(' ', '%20')).read(); dh = hashlib.sha256(by).hexdigest(); print('Error validating download (got %s instead of %s), please try manual install' % (dh, h)) if dh != h else open(os.path.join( ipp, pf), 'wb' ).write(by)

_User configuration `/` (assumes `ForMateKonaVe` font is installed):_

    {
        "auto_complete_commit_on_tab": true,
        "caret_style": "phase",
        "color_scheme": "Packages/Color Scheme - Default/Sunburst.tmTheme",
        "font_face": "ForMateKonaVe",
        "font_size": 14,
        "highlight_line": true,
        "highlight_modified_tabs": true,
        "match_brackets_angle": true,
        "scroll_past_end": true,
        "scroll_speed": 2.0,
        "translate_tabs_to_spaces": true,
        "trim_trailing_white_space_on_save": true
    }

_Custom hotkeys `/`:_

    [
        { "keys": ["ctrl+enter"], "command": "goto_python_definition"},
        { "keys": ["ctrl+tab"], "command": "next_view" },
        { "keys": ["ctrl+shift+tab"], "command": "prev_view" },
        { "keys": ["alt+m"], "command": "markdown_preview", "args":
            { "target": "browser", "parser": "markdown" }
        }
    ]

_Optional desktop launcher `~/.local/share/applications/subl.desktop`:_

    [Desktop Entry]
    Name=Sublime Text
    Comment=The World's best text editor!
    TryExec=subl
    Exec=subl
    Icon=~/applications/sublime_text/Icon/256x256/sublime_text.png
    Type=Application
    Categories=GNOME;GTK;Utility;TerminalEmulator;Office;





# References

- [wallpapers wa](http://wallpaperswa.com/)
- [google repo info](https://www.google.com/linuxrepositories/)
- [google deb sources list](https://sites.google.com/site/mydebiansourceslist/)
- [volume management](http://urukrama.wordpress.com/2007/12/19/managing-sound-volumes-in-openbox/)
- [slim manual](http://slim.berlios.de/manual.php)
- [pipelight](https://launchpad.net/pipelight)
- [viewnior](https://github.com/xsisqox/Viewnior)
- [gmrun in openbox](http://naniland.wordpress.com/2011/10/25/alt-f2-on-openbox/)
- [openbox pulseaudio through amixer adjusted hotkeys](https://wiki.archlinux.org/index.php/openbox#Pulseaudio)
- [urxvt popup options](https://bbs.archlinux.org/viewtopic.php?id=57202)
