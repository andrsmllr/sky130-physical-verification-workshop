v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 610 -1120 610 -1080 { lab=out}
N 520 -1100 540 -1100 { lab=in}
N 540 -1150 570 -1150 { lab=in}
N 540 -1150 540 -1100 { lab=in}
N 540 -1100 540 -1050 { lab=in}
N 540 -1050 570 -1050 { lab=in}
N 610 -1100 720 -1100 { lab=out}
N 610 -1020 610 -980 { lab=vss}
N 610 -1220 610 -1180 { lab=vdd}
N 610 -1050 620 -1050 { lab=vss}
N 620 -1050 620 -1010 { lab=vss}
N 610 -1010 620 -1010 { lab=vss}
N 610 -1220 620 -1220 { lab=vdd}
N 610 -980 620 -980 { lab=vss}
C {sky130_fd_pr/nfet_01v8.sym} 590 -1050 0 0 {name=M1
L=0.18
W=4.5
nf=3

ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {devices/ipin.sym} 520 -1100 0 0 {name=p1 lab=in}
C {devices/opin.sym} 720 -1100 0 0 {name=p2 lab=out}
C {devices/iopin.sym} 620 -980 0 0 {name=p3 lab=vss}
C {devices/iopin.sym} 620 -1220 0 0 {name=p4 lab=vdd}
C {sky130_fd_pr/pfet3_01v8.sym} 590 -1150 0 0 {name=M2
L=0.15
W=3
body=vdd
nf=3
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
