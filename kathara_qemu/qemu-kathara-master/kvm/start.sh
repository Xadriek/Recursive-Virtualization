#!/bin/bash


sleep 3
socat stdin,raw,echo=0,escape=0x11 UNIX:/tmp/machine.sock
