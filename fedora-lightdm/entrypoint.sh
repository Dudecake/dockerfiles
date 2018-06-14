#!/bin/sh

rm -r /run/dbus/* /tmp/.X11-unix/* /tmp/.ICE-unix/* /run/lightdm/* /run/user/* 2> /dev/null

exec /usr/lib/systemd/systemd --system
