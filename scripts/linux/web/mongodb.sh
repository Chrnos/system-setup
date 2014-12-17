#!/bin/bash

# set dependent variables for stand-alone execution
[ -z "$dl_cmd" ] && dl_cmd="wget --no-check-certificate -O"
[ -z "$remote_source" ] && remote_source="https://raw.githubusercontent.com/cdelorme/system-setup/master/"

# add aptitude sources & update aptitude
apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/debian-sysvinit dist 10gen' > /etc/apt/sources.list.d/mongodb.list
aptitude clean
aptitude update

# install mongodb
aptitude install -ryq mongodb-org

# configure mongodb (no configuration necessary for my default-state)

# confirm public accessibility & modify iptables
if [ "$public_mongodb" = "y" ]
then
    sed -i "s/#-A INPUT -p tcp -m multiport --dports 27017:27019 -m conntrack --ctstate NEW -j ACCEPT/-A INPUT -p tcp -m multiport --dports 27017:27019 -m conntrack --ctstate NEW -j ACCEPT/" /etc/iptables/iptables.rules
fi

# add monit config & test/restart monit
[ -f "data/etc/monit/monitrc.d/mongod" ] && cp "data/etc/monit/monitrc.d/mongod" "/etc/monit/monitrc.d/mongod"  || $dl_cmd "/etc/monit/monitrc.d/mongod" "${remote_source}data/etc/monit/monitrc.d/mongod"
ln -nsf "../monitrc.d/mongod" "/etc/monit/conf.d/mongod"
monit -t && service monit restart