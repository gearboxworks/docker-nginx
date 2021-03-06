#!/bin/bash
# Created on 2020-03-14T02:13:05+1100, using template:nginx.sh.tmpl and json:gearbox.json

test -f /etc/gearbox/bin/colors.sh && . /etc/gearbox/bin/colors.sh

c_ok "Started."

c_ok "Installing packages."
if [ -f /etc/gearbox/build/nginx.apks ]
then
	APKS="$(cat /etc/gearbox/build/nginx.apks)"
	apk update && apk add --no-cache ${APKS}; checkExit
fi

if [ -f /etc/gearbox/build/nginx.env ]
then
	. /etc/gearbox/build/nginx.env
fi

if [ ! -d /usr/local/bin ]
then
	mkdir -p /usr/local/bin; checkExit
fi

chown -fhR gearbox:gearbox /var/cache/nginx /var/log/nginx /etc/nginx /usr/lib/nginx /usr/sbin/nginx /usr/share/nginx

c_ok "Finished."
