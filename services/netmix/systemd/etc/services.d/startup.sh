#!/bin/bash
#set -e

OPENVPN_CERT_CONF='/etc/openvpn/client.conf'
TINYPROXY_CONF='/etc/tinyproxy/tinyproxy.conf'

# for openvpn
mkdir -p /dev/net
mknod /dev/net/tun c 10 200
chmod 600 /dev/net/tun
chmod -R 777 /etc/openvpn

# 启动php-fpm
if [ -f '/usr/sbin/php-fpm7' ]; then
    /usr/sbin/php-fpm7
fi

# 启动nginx
if [ -f '/usr/sbin/nginx' ]; then
    mkdir -p /run/nginx
    chmod -R 777 /run/nginx
    /usr/sbin/nginx
fi

# 有openvpn证书时连接vpn
if [ -f $OPENVPN_CERT_CONF ]; then
  /usr/sbin/openvpn --user nobody --group nobody --daemon --config $OPENVPN_CERT_CONF
fi

# 启动tinyproxy
/usr/local/bin/tinyproxy -c $TINYPROXY_CONF

# 启动ssh
/usr/sbin/sshd -D
