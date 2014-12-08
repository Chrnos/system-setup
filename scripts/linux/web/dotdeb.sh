#!/bin/bash

# add dotdeb repository
$source_cmd http://www.dotdeb.org/dotdeb.gpg | apt-key add -

# add to sources
echo "deb http://packages.dotdeb.org wheezy all" > /etc/apt/sources.list.d/dotdeb.list
echo "deb-src http://packages.dotdeb.org wheezy all" >> /etc/apt/sources.list.d/dotdeb.list

# update resources
aptitude clean
aptitude update