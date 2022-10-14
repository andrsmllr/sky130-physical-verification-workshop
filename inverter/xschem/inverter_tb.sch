v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 1750 -70 1750 -60 { lab=GND}
N 1820 -70 1820 -60 { lab=GND}
N 1750 -60 1820 -60 { lab=GND}
N 1780 -60 1780 -50 { lab=GND}
N 1820 -60 2220 -60 { lab=GND}
N 2200 -100 2220 -100 { lab=GND}
N 2220 -100 2220 -60 { lab=GND}
N 1750 -200 1750 -130 { lab=#net1}
N 1750 -200 2220 -200 { lab=#net1}
N 2200 -140 2220 -140 { lab=#net1}
N 2220 -200 2220 -140 { lab=#net1}
N 2200 -120 2260 -120 { lab=out}
N 1820 -140 1820 -130 { lab=in}
N 1820 -140 1900 -140 { lab=in}
N 1820 -160 1840 -160 { lab=in}
N 1820 -160 1820 -140 { lab=in}
C {devices/vsource.sym} 1750 -100 0 0 {name=V1 value=1.8}
C {devices/vsource.sym} 1820 -100 0 0 {name=V2 value="PWL(0 0 20n 0 900n 1.8)"}
C {devices/opin.sym} 1840 -160 0 0 {name=p1 lab=in}
C {devices/opin.sym} 2260 -120 0 0 {name=p2 lab=out}
C {inverter.sym} 2050 -120 0 0 {name=x1}
C {devices/gnd.sym} 1780 -50 0 0 {name=l1 lab=GND}
C {devices/code_shown.sym} 1760 -360 0 0 {name=s1 only_toplevel=false value=".lib /usr/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt"}
C {devices/code_shown.sym} 1760 -300 0 0 {name=s2 only_toplevel=false value=".control
tran 1n 1u
plot V(in) V(out)
.endc"}
