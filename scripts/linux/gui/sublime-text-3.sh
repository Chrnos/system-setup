#!/bin/bash

# set dependent variables for stand-alone execution
[ -z "$dl_cmd" ] && dl_cmd="wget --no-check-certificate -O"
[ -z "$remote_source" ] && remote_source="https://raw.githubusercontent.com/cdelorme/system-setup/master/"

# download & extract sublime text
$dl_cmd /tmp/sublime.tar.bz2 http://c758482.r82.cf2.rackcdn.com/sublime_text_3_build_3065_x64.tar.bz2
tar xf /tmp/sublime.tar.bz2 -C /tmp
rm /tmp/sublime.tar.bz2

# install global copy
cp -R /tmp/sublime_text_3 /usr/local/sublime-text
ln -nsf /usr/local/sublime-text/sublime_text /usr/sbin/subl

# user installation customization
if [ -n "$username" ]
then

    # install user copy
    mkdir -p "/home/${username}/applications" "/home/${username}/.bin"
    cp -R "/tmp/sublime_text_3" "/home/${username}/applications/sublime-text"
    ln -nsf "/home/${username}/applications/sublime-text/sublime_text" "/home/${username}/.bin/subl"

    # install sublime package control
    mkdir -p "/home/${username}/.config/sublime-text-3/Installed Packages/"
    $dl_cmd "/home/${username}/.config/sublime-text-3/Installed Packages/Package Control.sublime-package" "https://sublime.wbond.net/Package%20Control.sublime-package"

    # download configuration files
    mkdir -p "/home/${username}/.config/sublime-text-3/Packages/User"
    [ -f "data/home/.config/sublime-text-3/Packages/User/Default (Linux).sublime-keymap" ] && cp "data/home/.config/sublime-text-3/Packages/User/Default (Linux).sublime-keymap" "/home/${username}/.config/sublime-text-3/Packages/User/Default (Linux).sublime-keymap"  || $dl_cmd "/home/${username}/.config/sublime-text-3/Packages/User/Default (Linux).sublime-keymap" "${remote_source}data/home/.config/sublime-text-3/Packages/User/Default (Linux).sublime-keymap"
    [ -f "data/home/.config/sublime-text-3/Packages/User/Default (OSX).sublime-keymap" ] && cp "data/home/.config/sublime-text-3/Packages/User/Default (OSX).sublime-keymap" "/home/${username}/.config/sublime-text-3/Packages/User/Default (OSX).sublime-keymap"  || $dl_cmd "/home/${username}/.config/sublime-text-3/Packages/User/Default (OSX).sublime-keymap" "${remote_source}data/home/.config/sublime-text-3/Packages/User/Default (OSX).sublime-keymap"
    [ -f "data/home/.config/sublime-text-3/Packages/User/Default (Windows).sublime-keymap" ] && cp "data/home/.config/sublime-text-3/Packages/User/Default (Windows).sublime-keymap" "/home/${username}/.config/sublime-text-3/Packages/User/Default (Windows).sublime-keymap"  || $dl_cmd "/home/${username}/.config/sublime-text-3/Packages/User/Default (Windows).sublime-keymap" "${remote_source}data/home/.config/sublime-text-3/Packages/User/Default (Windows).sublime-keymap"
    [ -f "data/home/.config/sublime-text-3/Packages/User/Preferences.sublime-settings" ] && cp "data/home/.config/sublime-text-3/Packages/User/Preferences.sublime-settings" "/home/${username}/.config/sublime-text-3/Packages/User/Preferences.sublime-settings"  || $dl_cmd "/home/${username}/.config/sublime-text-3/Packages/User/Preferences.sublime-settings" "${remote_source}data/home/.config/sublime-text-3/Packages/User/Preferences.sublime-settings"
    [ -f "data/home/.config/sublime-text-3/Packages/User/default_file_type.sublime-settings" ] && cp "data/home/.config/sublime-text-3/Packages/User/default_file_type.sublime-settings" "/home/${username}/.config/sublime-text-3/Packages/User/default_file_type.sublime-settings"  || $dl_cmd "/home/${username}/.config/sublime-text-3/Packages/User/default_file_type.sublime-settings" "${remote_source}data/home/.config/sublime-text-3/Packages/User/default_file_type.sublime-settings"
    [ -f "data/home/.config/sublime-text-3/Packages/User/GoSublime.sublime-settings" ] && cp "data/home/.config/sublime-text-3/Packages/User/GoSublime.sublime-settings" "/home/${username}/.config/sublime-text-3/Packages/User/GoSublime.sublime-settings"  || $dl_cmd "/home/${username}/.config/sublime-text-3/Packages/User/GoSublime.sublime-settings" "${remote_source}data/home/.config/sublime-text-3/Packages/User/GoSublime.sublime-settings"
    [ -f "data/home/.config/sublime-text-3/Packages/User/MarkdownPreview.sublime-settings" ] && cp "data/home/.config/sublime-text-3/Packages/User/MarkdownPreview.sublime-settings" "/home/${username}/.config/sublime-text-3/Packages/User/MarkdownPreview.sublime-settings"  || $dl_cmd "/home/${username}/.config/sublime-text-3/Packages/User/MarkdownPreview.sublime-settings" "${remote_source}data/home/.config/sublime-text-3/Packages/User/MarkdownPreview.sublime-settings"

    # installation of plugins is left to the user
fi