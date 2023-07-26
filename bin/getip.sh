#!/bin/sh

#ip addr show dev eth0 | grep inet -m 1 | awk '{print $2}'
hostname -I | awk '{print $1}'
