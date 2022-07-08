#!/bin/bash
host=$(hostname)

if [ -d "/hostlab/$host" ]
then
	(cd /hostlab/$host && tar c .) | (cd / && tar xhf -)
fi

if [ -d "/var/www" ] 
then 
	chmod -R 777 /var/www/* 
fi
if [ -d "/etc/quagga" ] 
then 
    chown quagga:quagga /etc/quagga/*
    chmod 640 /etc/quagga/* 
fi

if [ -d "/etc/frr" ]; 
then 
    chown frr:frr /etc/frr/*
    chmod 640 /etc/frr/* 
fi

if [ -f "/hostlab/shared.startup" ] 
then 
	chmod u+x /hostlab/shared.startup
	sed -i "1s;^;set -x\\n\\n;" /hostlab/shared.startup 
    /hostlab/shared.startup &> /var/log/shared.log 
fi

if [ -f "/hostlab/$host.startup" ] 
    then 

    chmod u+x /hostlab/$host.startup

    sed -i "1s;^;set -x\\n\\n;" /hostlab/$host.startup
    /hostlab/$host.startup &> /var/log/startup.log 
fi
