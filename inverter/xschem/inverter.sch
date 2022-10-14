v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 1890 -130 1900 -130 { lab=in}
N 1900 -170 1900 -130 { lab=in}
N 1900 -130 1900 -80 { lab=in}
N 1940 -140 1940 -110 { lab=out}
N 1940 -130 2020 -130 { lab=out}
N 1940 -230 1940 -200 { lab=vdd}
N 1940 -230 1950 -230 { lab=vdd}
N 1940 -50 1940 -10 { lab=vss}
N 1940 -10 1950 -10 { lab=vss}
N 1940 -80 1950 -80 { lab=vss}
N 1950 -80 1950 -30 { lab=vss}
N 1940 -30 1950 -30 { lab=vss}
C {sky130_fd_pr/nfet_01v8.sym} 1920 -80 0 0 {name=M1
L=0.18
W=4.5
nf=3
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet3_01v8.sym} 1920 -170 0 0 {name=M2
L=0.18
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
C {devices/ipin.sym} 1890 -130 0 0 {name=p1 lab=in}
C {devices/opin.sym} 2020 -130 0 0 {name=p2 lab=out}
C {devices/iopin.sym} 1950 -230 0 0 {name=p3 lab=vdd}
C {devices/iopin.sym} 1950 -10 0 0 {name=p4 lab=vss}
