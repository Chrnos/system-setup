
# template

These are template instructions, including initial installation, that will prepare a base image.  That image is ready for use as a server, workstation, development machine, etc.  It's intended use is to be a "starting point", by making the system more usable from the start.


### hardware configuration & installation

Applications vary wildly, but this machine will run sufficiently on 512MB of RAM, but I tend to use 1GB or more.

I don't create an additional user besides the root account during the initial installation.

I use Logical Volumes for partitioning.  My **preferred partitioning schema** [is in my parted documentation](../shared/parted.md)

For a lightweight installation I only select `system utilities` and deselect the desktop environment and any other combined packages.


### install packages

Since this is just a templte system that should extend to fit many use cases my goal is to limit installed utilities to utilities and services that are important in all cases, or which improve usability.

To speed up package installation I generally install `netselect-apt` first and attempt to determine the best mirrors.  _Due to a bug that can yield "-" as a mirror, this is not always reliable._




---

Refreshed list and loads of changes coming:

netselect-apt

monit
ntp
resolvconf
watchdog
ssh
sudo
uuid-runtime
whois
rsync
curl
e2fsprogs
exfat-fuse
exfat-utils
fuse-utils
sshfs

screen
tmux
vim
command-not-found
git
mercurial
markdown

unace
unalz
unrar
zip
zoo
rzip
p7zip-full
arj
lzop


---


Moving onto our big install list; I've sectioned all the packages into groups that make some sense as far as their purpose on the machine, which may help you decide whether to install them yourself.

**Firmware:**

- firmware-linux
- firmware-linux-free
- firmware-linux-nonfree

You may or may not find any of these to be of help, but if you want to ensure that no hardware you connect is unsupported this is a good first step.  If you never plan to swap parts or connect new hardware, feel free to omit these.

**Hardware Utilities:**

- usbutils
- uuid-runtime
- debconf-utils

I install these packages as support tools for various hardware and software that interacts with hardware.  I recommend all of them.

**Compression Utilities:**

- bzip2
- lzop
- p7zip-full
- zip
- unzip
- unrar
- xz-utils
- unace
- rzip
- unalz
- zoo
- arj

I have listed these packages in the order I find them to be useful.  You are welcome to omit some or all of them if you do not expect to encounter compressed files.

**Network Utilities:**

- netselect-apt
- ssh
- curl
- ntp
- rsync
- whois

As earlier instructed, we should already have `netselect-apt` installed to reduce the load of installing all the remaining packages.  I highly recommend `ssh`, `ntp`, and `curl` as they are all incredibly valuable to have on your system, while `rsync` is a bonus, and `whois` may or may not be of any use to you depending on your intended use of the machine.

**Development Support Utilities:**

- git
- git-flow
- mercurial
- debhelper
- libncurses5-dev
- kernel-package
- build-essential
- fakeroot

The `git` and `mercurial` packages are for popular version control software.  If you use `svn` you can throw that in too.  The last four will install all the necessary tools to build and compile source code, such as a custom kernel, or any software you cannot find in a debian package.

**Text Processing Utilities:**

- vim

The `vim` package is my preferred terminal editor, but there are others such as `nano` and `emacs`.  Your choice will depend on your preferences, and I'd imagine that depends on whichever you have more experience with.

**File System Utilities:**

- e2fsprogs
- parted
- sshfs
- fuse-utils
- gvfs-fuse
- exfat-fuse
- exfat-utils
- fusesmb
- os-prober

I use `parted` regularly, and `e2fsprogs` as well.  The `sshfs` package makes it much easier to secure direct local access to a set of remote files, and all of the fuse packages are excellent if you need to access special file systems such as example samba and exfat.  The `os-prober` package may help if you are troubleshooting drives or partitions.  If you don't plan to be accessing other file systems, then you don't need all of them, but I use them myself, and often.

**Terminal Support Utilities:**

- sudo
- bash-completion
- command-not-found
- tmux
- screen
- bc
- less
- keychain
- pastebinit
- anacron

I would be at a loss without tools like `tmux` and `screen`.  I find that `bash-completion` and `command-not-found` are fabulous tools to improve my productivity and help me locate things I missed.  The `sudo` command is basically required if you plan to use the system as a non-root user and still maintain easy privilege access.  The `bc` and `less` commands should already be installed and help with text processing and basic calculations.  The `anacron` package is for an asynchronous crontab, great for desktops which do not have a 24/7 uptime (for example, a virtual machine).  The `keychain` package is super helpful to load your ssh key at boot time so you don't have to constantly enter the password for it as you use the system (accessibility vs security).  Finally `pastebinit` is a website specific utility that allows you to easily push output to a public website to share with others, such as troubleshooting or even accessing it from another system.  I recommend all of these tools.

**Misc Utilities:**

- miscfiles
- monit
- markdown

The `miscfiles` package is non-executable files that contain loads of data that other software may find helpful, so I recommend it.  I use `markdown` for literally everything, so I install it.  The `monit` package allows me to specifically monitor important services and keep them from locking up or crashing permanently.

After installing the packages we still have a couple of steps to take care of before we are ready to move forward.  The `command-not-found` package requires a one-time run of `update-command-not-found` to update a local index of packages.


##### commands

_Here are the all the commands I run to cover the entire packages section of documentation:_

    aptitude install -ryq netselect-apt
    netselect-apt -sn
    aptitude clean
    aptitude update
    dpkg -rq vim-common vim-tiny
    aptitude reinstall -ryq firmware-linux firmware-linux-free firmware-linux-nonfree usbutils uuid-runtime debconf-utils bzip2 lzop p7zip-full zip unzip unrar xz-utils unace rzip unalz zoo arj netselect-apt ssh curl ntp rsync whois vim git git-flow mercurial debhelper libncurses5-dev kernel-package build-essential fakeroot e2fsprogs parted sshfs fuse-utils gvfs-fuse exfat-fuse exfat-utils fusesmb os-prober sudo bash-completion command-not-found tmux screen bc less keychain pastebinit anacron miscfiles monit markdown avahi-utils avahi-daemon libnss-mdns wireless-tools htop linux-headers-3.2.0-4-all lm-sensors resolvconf
    aptitude install -ryq firmware-linux firmware-linux-free firmware-linux-nonfree usbutils uuid-runtime debconf-utils cpufrequtils bzip2 lzop p7zip-full zip unzip unrar xz-utils unace rzip unalz zoo arj netselect-apt ssh curl ntp rsync whois vim git git-flow mercurial debhelper libncurses5-dev kernel-package build-essential fakeroot e2fsprogs parted sshfs fuse-utils gvfs-fuse exfat-fuse exfat-utils fusesmb os-prober sudo bash-completion command-not-found tmux screen bc less keychain pastebinit anacron miscfiles monit markdown avahi-utils avahi-daemon libnss-mdns wireless-tools htop linux-headers-3.2.0-4-all lm-sensors resolvconf
    update-command-not-found


#### cron jobs

I schedule a series of custom cronjobs to handle various tasks within the system that keep it up the date and running smoothly.  Generally I only add these to the primary cron folders, but that means they may not execute if the system is not running 24/7, so be sure to adjust your implementation accordingly.

I update packages on the system daily, and run disk maintenance and cleanup weekly.


##### commands & files

_Let's create the system update script at `/etc/cron.daily/system-updates` with these lines:_

    #!/bin/bash
    mv /etc/apt/sources.list /etc/apt/sources.list.bak
    netselect-apt -sn -o /etc/apt/sources.list
    aptitude clean
    if ! aptitude update
    then
        mv /etc/apt/sources.list.bak /etc/apt/sources.list
        aptitude update
    fi
    aptitude upgrade -yq
    update-command-not-found

_Next we can create weekly disk maintenance at `/etc/cron.weekly/disk-maintenance` with these lines:_

    #!/bin/bash
    # search and destroy mac/windows garbage files (assumes mounts for storage disks)
    if [ -d "/media" ]
    then
        find /media -iname "thumbs.db" -exec rm -rf {} \;
        find /media -iname ".ds_store" -exec rm -rf {} \;
        find /media -name '._*' -exec rm -rf {} \;
    fi
    # defragment ext4 devices, and reduce stress by running condensed fstrim operations
    for DEVICE in $(mount | grep ext4 | awk '{print $1}')
    do
        e4defrag "${DEVICE}"
        fstrim "${DEVICE}"
    done

_Finally I make sure they are executable:_

    chmod +x /etc/cron.daily/system-updates
    chmod +x /etc/cron.weekly/disk-maintenance


#### optimizations & permissions

This optimization is for LVM with Solid State Drives.  In the `/etc/lvm/lvm.conf` file find the `issue_discards` flag, and set it to `1` to turn it on.

Next I prefer setting the default umask to `002` to allow group read and write by default.  This used to be a problem because users did not have personal groups, but that has long since been addressed and every user is in their own group by default, making it hard to "accidentally" share files.

To make these change we have to modify two files.  First we want to add `session optional pam_umask.so umask=002` to `/etc/pam.d/common-session`.  Second we want to set `UMASK 002` inside `/etc/login.defs`.


##### commands

_The commands to make these optimizations:_

    sed -i 's/issue_discards = 0/issue_discards = 1/' /etc/lvm/lvm.conf
    sed -i 's/UMASK\s*022/UMASK        002/' /etc/login.defs
    echo "session optional pam_umask.so umask=002" >> /etc/pam.d/common-session


#### monit configuration

At a bare minimum monit allows us to ensure that if the system is overloaded or important services such as ssh hangs or dies that it gets rebooted.  It is a very reliable tool and good to have installed for general purpose use.

Configurations should be placed into `/etc/monit/monitrc.d/`, and symlinked to `/etc/monit/conf.d/`.

I create one for `ssh`, one for `system`, and one for `web` accessibility by default.  The configuration you choose may vary greatly, and I recommend [reading their documentation](https://mmonit.com/monit/documentation/monit.html) before simply copying my own suggested contents.


##### commands & files

_Let's start by creating these files:_

**`/etc/monit/monitrc.d/ssh`:**

    check process sshd with pidfile /var/run/sshd.pid
        start program = "/etc/init.d/ssh start"
        stop program  = "/etc/init.d/ssh stop"
        if cpu > 80% for 5 cycles then restart
        if totalmem > 200.00 MB for 5 cycles then restart
        if 3 restarts within 8 cycles then timeout


**`/etc/monit/monitrc.d/system`:**

    check system localhost
        if loadavg (1min) > 10 then alert
        if loadavg (5min) > 8 then alert
        if memory usage > 80% then alert
        if cpu usage (user) > 70% for 2 cycles then alert
        if cpu usage (system) > 50% for 2 cycles then alert
        if cpu usage (wait) > 50% for 2 cycles then alert
        if loadavg (1min) > 20 for 3 cycles then exec "/sbin/reboot"
        if loadavg (5min) > 15 for 5 cycles then exec "/sbin/reboot"
        if memory usage > 97% for 3 cycles then exec "/sbin/reboot"

**`/etc/monit/monitrc.d/web`:**

    # Establish Web Server on a custom port and restrict access to localhost
    set httpd port ####
        allow 127.0.0.1

_Be sure to substitute the port number of your choice with `####` in the above configuration.  Then you can securely access it using ssh tunneling: `ssh -f -N username@remote_ip -L ####:localhost:####`_

_Finally, we run these commands to add symlinks

    cd /etc/monit/conf.d
    ln -s ../monitrc.d/ssh ssh
    ln -s ../monitrc.d/system system
    ln -s ../monitrc.d/web web

_You can then test, and restart monit:_

    monit -t && service monit restart


#### system timezone

If you run `date` and the system spits out a time from a different timezone it is very likely that you will have to fix it by replacing the file at `/etc/localtime` with a file containing your own timezone signature.

You can find the list of timezones in `/usr/share/zoneinfo`.


##### commands

_To set the US Eastern timezone run this command:_

    sudo ln -sf /usr/share/zoneinfo/US/Eastern /etc/localtime


#### domain name

If you did not do so during the installation, you can setup a fully established domain name by adding the machine name to the file `/etc/hostname`, then running `hostname -F /etc/hostname`.

To add the domain name you can edit `/etc/hosts` and add a record for `127.0.1.1` with your hostname, and fully qualified domain name.


##### commands

_To add a hostname and FQDN, here are the commands:_

    echo "hostname" > /etc/hostname
    hostname -F /etc/hostname

_Edit the `/etc/hosts` file manually, and add or replace this line:_

    127.0.1.1 hostname.domain.dev hostname

_Now if we type `hostname -f` we will get the whole domain name._


#### fixing grub panics

Sometimes there are problems and a kernel panic happens.  While rare, this can be a huge problem if the system is remote, so I add another flag to attempt to tell the system to automatically reboot shortly after a panic.

To do this, we want to add a configuration change to grub!


##### commands

_Run this to add another option to your grub, then run the next command to update the grub config:_

    sed -i "s/quiet/quiet panic=10/" /etc/default/grub
    update-grub


#### static ip address

On most of my desktop systems inside a local network I assign a static IP.  I do this to make SSH access simpler, and to reduce routing traffic.

These instructions are primarily for wired connections and may require significant changes to be useful for wireless connections.


##### commands

_Edit the `/etc/network/interfaces` file by replacing or adding these lines:_

    allow-hotplug eth0
    iface eth0 inet static
        address 10.0.5.8
        gateway 10.0.5.1
        netmask 255.255.255.0
        dns-nameservers 10.0.5.1

_Your network device name, and address are dependent on your system and intranet._

_The use of `dns-nameservers` requires the `resolvconf` package, and will automatically populate `/etc/resolve.conf` with the supplied value (helpful if you switch between dhcp and static)._


#### ssh configuration

The first step I take to securing SSH is to obfuscate the port by changing it to a different number in `/etc/ssh/sshd_config`.

Next it would be wise to add any keys to `~/.ssh/authorized_keys` under a user account (generally not under the root account), and prevent access via passwords.  To do this set `PasswordAuthentication no` inside `/etc/ssh/sshd_config`.  If you use [github](https://github.com/), you can use `curl` or `wget` to grab your accounts trusted public keys from terminal.

If you don't use `sudo` often, you can further lock down accounts by preventing password logins and authentication in general via `passwd -l username`.  This can have unexpected consequences, but is another way to limit password authentication.

Finally, preventing root login is usually a good move, set `PermitRootLogin no` in `/etc/ssh/sshd_config`.

**Be sure to reboot or restart the ssh service for these changes to take affect.**

You should also generate an SSH key for your user account.  _Passwordless keys are as insecure as automatically loading your key, so for greater security it is advisable to use a key with a password, and not to automatically load it._  However, I often use the `keychain` package to automatically load my keys into the ssh-agent if I am not concerned about the security of the account or need it for automation of some sort.

You can also add a generated key to your github account via their api using curl.

_Don't forget a space in front to prevent it from showing in your `history` (since it has username & password)._


##### commands

_These commands will secure your ssh service:_

    sed -i "s/Port\s*[0-9].*/Port ####/" /etc/ssh/sshd_config
    sed -i "s/^#\?PasswordAuthentication\s*[yn].*/PasswordAuthentication no/" /etc/ssh/sshd_config
    sed -i "s/^#\?PermitRootLogin.*[yn].*/PermitRootLogin no/" /etc/ssh/sshd_config
    service ssh restart

_Be sure to replace `####` with a port number of your choosing.  This number will also be important for a later step._

_These commands will grab your trusted keys off the net, and add your newly generated public key to your account (**swap your username and password, and be sure to clear your `history` after**)._

    curl -o ~/.ssh/authorized_keys "https://github.com/username.keys"
    curl -i -u "username:password" -H "Content-Type: application/json" -H "Accept: application/json" -X POST -d "{\"title\":\"name this key\",\"key\":\"$(cat ~/.ssh/id_rsa.pub)\"}' https://api.github.com/user/keys

_To generate an ssh key, here is the command (prompts will be required after):_

    ssh-keygen -t rsa -b 4096


#### iptables (firewall) configuration

The `iptables` package makes for an excellent firewall.  However, its configuration can be quite confusing.  I recommend reading up on it if you want a solid understanding.

The standard location for iptables configuration is `/etc/iptables/iptables.rules`, though unless you have installed additional utilities the directory will likely not exist.
I usually create a set of rules in `/etc/firewall.conf`, though some services would have you place it into `/etc/iptables/iptables.rules` and auto-load it by default.  However, I do not use the iptables daemon, instead I connect them to my `network up` sequence by creating a file in `/etc/network/if-up.d/` to reload the iptable rules.


##### commands & files

_Begin by creating the directory:_

    mkdir -p /etc/iptables

_Next let's populate `/etc/iptables/iptables.rules` with some basic compliant rules:_

    *filter

    # accept established connections
    -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

    # accept local traffic
    -A INPUT -i lo -j ACCEPT
    -A OUTPUT -o lo -j ACCEPT

    # accept ping
    -A INPUT -p icmp -m icmp --icmp-type 8 -m conntrack --ctstate NEW -j ACCEPT

    # accept ssh with rate limiting
    -N LOGDROP
    -A LOGDROP -j LOG --log-prefix "iptables deny: " --log-level 7
    -A LOGDROP -j DROP
    -A INPUT -p tcp -m tcp --dport ssh -m conntrack --ctstate NEW -m recent --set --name SSH --rsource
    -A INPUT -p tcp -m tcp --dport ssh -m conntrack --ctstate NEW -m recent --update --seconds 60 --hitcount 4 --name SSH --rttl --rsource -j LOGDROP
    -A INPUT -p tcp -m tcp --dport ssh -j ACCEPT

    # drop invalid
    -A INPUT -m conntrack --ctstate INVALID -j DROP

    # reject all others (linux compliant blacklist)
    -A INPUT -p udp -j REJECT --reject-with icmp-port-unreachable
    -A INPUT -p tcp -j REJECT --reject-with tcp-rst
    -A INPUT -j REJECT --reject-with icmp-proto-unreachable

    # drop forwards
    -A FORWARD -j DROP

    COMMIT

_Remember that the `ssh` port number varies and the string evaluates to port 22 (the default)._

**_It would be wise to test that you can still access remote systems with these rules active before setting them at boot time._**

_Next let's create our file `/etc/network/if-up.d/iptables` with loading code:_

    #!/bin/bash
    iptables-restore < /etc/iptables/iptables.rules

_Finally, we need to make the iptables script executable:_

    chmod +x /etc/network/if-up.d/iptables


#### locale support

If you happen to dabble in other languages besides english (as I'm sure do many), then you can add another locale and generate related files.

The interactive way to do this is to use `dpkg-reconfigure locales`.  This will let you pick the options from an ncurses gui.

If you want to make it happen manually instead you can modify the `/etc/locale.gen` file, by removing comments next to the locale of your choice, then running `locale-gen`.


##### commands

_I usually add japanese locale for language support:_

    echo "ja_JP.UTF-8 UTF-8" >> /etc/locale.gen
    locale-gen


#### using watchdog

The watchdog is a hardware (or sometimes software) timer that runs behind the OS (hardware implementation is not dependent on the OS).  It effectively performs a check-in every 60 seconds, if the system has locked up or frozen and no response is sent the watchdog timer will automatically reboot the system.

This is absolutely fantastic for headless or remote machines (granted a bit unsafe if your concerned for data loss), if in fact they do lock up and you need them to be rebooted in order to login and fix the problem, you can rely on the watchdog timer to take care of this.

To my understanding if the system supports watchdog it will appear at `/dev/watchdog`, as a device.  If you open this device-file and do not provide it with data within 60 seconds, or do not close it properly, the system will reboot.  You can easily test it by typing a simple echo into the file.  To my knowledge, you can cancel the watchdog by echoing a "V" into the device-file.

Finally, you will want to install the `watchdog` package, and tell it to run at boot time.  It's job is to ping the `/dev/watchdog` file with data within every 60 seconds to keep the watchdog from rebooting while the system remains responsive.  You may also need to compile watchdog support into your kernel.

**The `watchdog` package can be used for much more than just a watchdog timer, but also a system monitor, similar to monit but more limited in scope.**


##### commands

_Run these commands to install the watchdog package and tell it to run at boot:_

    aptitude install -ryq watchdog
    update-rc.d watchdog defaults


#### log access

The default user group for log files found in `/var/log` is `adm`.  However, some of the files do not have that as the default permissions, and if you need to give your user read access to your logs you may consider making some changes.

Besides adding your log-privileged users to the `adm` group you will need to check out the `/etc/logrotate.conf` file and the `/etc/logrottate.d/` files.  Many of them either have no permissions setting, or have root as the group owner.  In some cases it makes sense to restrict things to root only, so your actions are your own choice.

Here are some of the items I found:

- For the `wtmp` and/or `utmp` log files, we have to modify `/etc/logrotate.conf`.
- For the `dpkg` and `alternatives.log` files we must modify `/etc/logrotate.d/dpkg`.
- For `apt/` and `aptitude` log files, add the create lines to their respective logrotate configs
- For `ConsoleKit` same as apt and aptitude

Still not sure about the files & folders in this list:

- /var/log/faillog
- /var/log/fontconfig.log
- /var/log/fsck/
- /var/log/news/
- /var/log/ntpstats/
- /var/log/slim.log
- /var/log/Xorg.0.log
- /var/log/bootstrap.log

**My guess is if we need to adjust the permissions we can add new `logrotate` files with the appropriate lines, but many of these log files may be generated by software, which means you may have to find the software creating the log file and change its behavior or configuration.**


##### commands

_Add a/your user to the log group:_

    usermod -aG adm username

_Even after applying patches to the logrotate files, to fix the current permissions on existing files one must execute a recursive permission fix:_

    sudo chown -R root:adm /var/log/*


#### creating a user

**Before creating a new user I highly recommend preparing your system for new users with my [dot-files repository](https://github.com/cdelorme/dot-files), which contains a number of prompt enhancements, vim plugins and configuration, and numerous user-configuration defaults that improve overall performance.**

Provided all the configuration files you desire are in the `/etc/skel/` path, you can proceed with creating a new user.  I do so using the `useradd` command, but if you prefer an interactive approach then the `adduser` perl script should do nicely.

After adding a user you will want to set their password with `passwd username`.  Also, don't forget to add your user to appropriate groups, such as the `sudo` group.


##### commands

_Here is how I create my new users:_

    useradd -m -s /bin/bash username
    passwd username
    usermod -aG sudo username


#### automate updating access keys

Over the years I've found that I reinstall systems often enough to never have had an SSH key last more than a year.  This is fine, ssh keys are intended to identify a single system, when you reinstall that system is not the same.

So, one problem I've had has been redistributing keys to servers such that my new systems can access.  Fortunately we can fix that by adding a script to the user bin, and a crontab to run it regularly.


##### commands

_Create a file `~/.bin/update-keys` with these lines (placing your github username where the command is):_

    #!/bin/bash
    keys=$(wget -qO- https://github.com/$(whoami).keys)
    echo "$keys" | while read -r key
    do
        if [ -f "${HOME}/.ssh/authorized_keys" ] && ! grep $key "${HOME}/.ssh/authorized_keys" &> /dev/null
        then
            echo $key >> "${HOME}/.ssh/authorized_keys"
        fi
    done

_Then run `crontab -e` and add this line:_

    */5 * * * * /home/cdelorme/.bin/update-keys


## references

- [iptables securing ssh](http://www.rackaid.com/blog/how-to-block-ssh-brute-force-attacks/)
- [best practices 2010: "Don’t set the default policy to DROP"](http://major.io/2010/04/12/best-practices-iptables/)
- [reject > drop](http://unix.stackexchange.com/questions/109459/is-it-better-to-set-j-reject-or-j-drop-in-iptables)
- [reject & drop equally susceptable to DoS](http://www.linuxquestions.org/questions/linux-security-4/drop-vs-reject-685942/)
