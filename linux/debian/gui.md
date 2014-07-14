
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

**The volumeicon package is technically not necessary, as the hotkeys to run the amixer commands can be done entirely from the openbox configuration.**

_I am still working on updating the hotkeys, since `XF86` doesn't really exist on my keyboards._






---

## Other Recommended Software


### Sublime Text

_These instructions vary slightly depending on whether you are using Sublime Text 2 or Sublime Text 3, though 3 is in beta it offers many improvements over the second version, and is moderately stable._

Let's start by downloading the latest copy off their website.

Grab the latest version off their website:

    # Download Sublime Text 3
    wget -O ~/sublime.tar.bz2 http://c758482.r82.cf2.rackcdn.com/sublime_text_3_build_3059_x64.tar.bz2
    tar xf sublime.tar.bz2
    rm sublime.tar.bz2

    # Download Sublime Text 2
    wget -O ~/sublime.tar.bz2 http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%202.0.2%20x64.tar.bz2
    tar xf sublime.tar.bz2
    rm sublime.tar.bz2

You have a choice with sublime, you can install a system local copy, but I recommend a local copy per user to avoid version concerns.  It will create a settings folder per user automatically.

To install globally:

    mkdir /usr/local/applications
    mv Sublime* /usr/local/applications/sublime_text/
    ln -s /usr/bin/subl /usr/local/applications/sublime_text/sublime_text

To install locally:

    mkdir ~/applications
    mv Sublime* ~/applications/sublime_text/
    mkdir -p ~/bin
    ln -s ~/applications/sublime_text/sublime_text ~/bin/subl

_Copying with the asterisk may fail if there are multiple items that start with the first word._

I recommend these packages for the editor:

- [Package Control](https://sublime.wbond.net/)
- [Markdown Preview](https://github.com/revolunet/sublimetext-markdown-preview)
- [SublimeCodeIntel](https://github.com/SublimeCodeIntel/SublimeCodeIntel)
- [Origami](https://github.com/SublimeText/Origami)

My sublime text configuration appears as:

    {
        "auto_complete_commit_on_tab": true,
        "caret_style": "phase",
        "color_scheme": "Packages/Color Scheme - Default/Sunburst.tmTheme",
        "font_face": "ForMateKonaVe",
        "font_size": 16.5,
        "highlight_line": true,
        "highlight_modified_tabs": true,
        "match_brackets_angle": true,
        "scroll_past_end": true,
        "scroll_speed": 2.0,
        "translate_tabs_to_spaces": true,
        "trim_trailing_white_space_on_save": true
    }

_This does depend on the custom `ForMateKonaVe` font._

I add also modify the hotkeys for SublimeCodeIntel go-to-definition and Markdown Preview to build to browser:

    [
        { "keys": ["ctrl+enter"], "command": "goto_python_definition"},
        { "keys": ["ctrl+tab"], "command": "next_view" },
        { "keys": ["ctrl+shift+tab"], "command": "prev_view" },
        { "keys": ["alt+m"], "command": "markdown_preview", "args":
            { "target": "browser", "parser": "markdown" }
        }
    ]

I create a desktop launcher using `~/.local/share/applications/subl.desktop` containing:

    [Desktop Entry]
    Name=Sublime Text
    Comment=The World's best text editor!
    TryExec=subl
    Exec=subl
    Icon=~/applications/sublime_text/Icon/256x256/sublime_text.png
    Type=Application
    Categories=GNOME;GTK;Utility;TerminalEmulator;Office;

_While this document is centric to debian, I feel it beneficial to share that fedora and ubuntu both work with the above configuration, however Arch does not read the PATH variable for the local `~/bin` folder, and does not expand the tilde into the home directory, requiring static paths._


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


## [Youtube Downloader](https://github.com/rg3/youtube-dl)

This is a really cool command line utility that you can use to download (the highest quality) youtube videos without any GUI utilities.  It includes asynchronous processing and even spits out the percent status.


##### Commands

_Run these commands to download and install the `youtube-dl` command:_

    git clone https://github.com/rg3/youtube-dl
    cd youtube-dl
    sudo python setup.py install
    cd ..
    rm -rf youtube-dl


## still investigating


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
