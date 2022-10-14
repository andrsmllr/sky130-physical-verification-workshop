v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 810 -1170 810 -1140 { lab=#net1}
N 810 -1180 810 -1170 { lab=#net1}
N 380 -1180 810 -1180 { lab=#net1}
N 380 -1180 380 -1140 { lab=#net1}
N 380 -1080 380 -1060 { lab=GND}
N 380 -1060 810 -1060 { lab=GND}
N 810 -1100 810 -1060 { lab=GND}
N 460 -1080 460 -1060 { lab=GND}
N 810 -1120 870 -1120 { lab=out}
N 460 -1160 470 -1160 { lab=in}
N 420 -1060 420 -1050 { lab=GND}
N 460 -1160 460 -1140 { lab=in}
N 460 -1150 480 -1150 { lab=in}
N 480 -1150 480 -1140 { lab=in}
N 480 -1140 510 -1140 { lab=in}
C {devices/vsource.sym} 460 -1110 0 0 {name=V1 value="PWL(0 0 20n 0 900n 1.8)"}
C {devices/vsource.sym} 380 -1110 0 0 {name=V2 value=1.8}
C {devices/gnd.sym} 420 -1050 0 0 {name=l1 lab=GND}
C {devices/opin.sym} 870 -1120 0 0 {name=p1 lab=out}
C {devices/opin.sym} 470 -1160 0 0 {name=p2 lab=in}
C {devices/code_shown.sym} 380 -1300 0 0 {name=s1 only_toplevel=false value=".lib /usr/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt"}
C {devices/code_shown.sym} 380 -1250 0 0 {name=s2 only_toplevel=false value=".control
tran 1n 1u
plot V(in) V(out)
.endc"}
C {inverter.sym} 660 -1120 0 0 {name=x1}
