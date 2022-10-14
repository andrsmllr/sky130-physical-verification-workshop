#!/bin/sh

netgen -batch lvs "netA.spice test" "netB.spice test" /usr/share/pdk/sky130A/libs.tech/netgen/sky130A_setup.tcl exercise2_comp.out -json | tee lvs.log
