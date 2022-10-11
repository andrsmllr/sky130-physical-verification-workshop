# sky130-physical-verification-workshop
My notes about the physical verification workshop for the SKY130 PDK held by VSD-IAT in October 2022 .

---

## Day 1 Introduction to SkyWater SKY130 PDK

...

---

## Day 2 DRC/LVS Theory

Verification to ensure design is functional.

Design Rule Checking (DRC)
Makes sure the silicon foundry rules are met.

Layout vs Schematic (LVS)
Makes sure the layout matches the design intent as captured by the schematic.
Cross-Checking for equivalence in results derived from independent sources.
Tools checking tools to make sure nothing went wrong along the way.

### Understanding GDS Format

GDSII format, the best we have, but less horrible than the rest.

Before GDSII CIF was used.
Caltech Intermediate Format (CIF), + human readable ASCII, + extensible, - no true grid, - extensible, broken standard

Graphic Design System (GDS), Graphic Design System 2 (GDSII)
layer purpose pairs, GDS layer:purpose int:int, different for each process, non-standard
GDSII is binary, convert to ASCII to read

Layout data: rectangles, polygons, subcells
meta data: labels, cell names, instance names

Some useful scripts in open_pdks/common.

Future file format OASIS, all binary, good for compression.

### Extraction Commands, Styles and Options in Magic

Extraction creates a (SPICE) netlist from a layout, possibly including parasitics.

Magic does from a .mag file extract a .ext file and then converts to .spice
SPICE netlist can be simulated, e.g. with ngspice

Magic extraction:
extract do local
extract all : extract each cell into a .ext file
ext2spice lvs : set sane options for extraction, useful for LVS checking, ensures output format is compatible to ngspice
ext2spice : create .spice file from .ext file

For verification a .spice testbench is needed, where the circuit under test is instantiated.
The device models also need to be included.
Some control statements that provide stimuli to the circuit in the testbench.

Extraction styles in magic are defined in the pdk/sky130/libts.tech/magic/sky130A.tech
Different "styles" e.g. for extract: ngspice() uses defaults, ngspice(si) uses SI units.

### Advanced Extraction Options in Magic

ext2spice lvs : sets number of generally useful/sane options
ext2spice cthresh <value> : sets threshold for parasitic capacitance output. set to "infinite" to supress all capacitances, set to "0" to output all capacitances.
ext2spice scale <on|off> : manages scale option in ext2spice, always off for sky130.
ext2spice hierarchy <on|off> : controls if output contain subcircuits or not, i.e. if a flat or hierarchical spice netlist is created. Recommended "on".
ext2spice subcircuit top <on|off> : control if top level cell is converted to a subcircuit in the output .spice netlist. Requires port labels in layout. Recommended "on", to make layout more self contained.
ext2spice global <on|off> : control behavior for global nets, which end in "!". Highly recommended "off".
ext2spice merge <on|off> : controls if devices with same size are merged in .spice output.

Parasitic capacitances must only capture capacitances which are not part of a device model, e.g. a MiM capacitance is not a parasitic capacitance.

RC Extraction
Extracts parasitic capacitance as well as parasitic resistance.
"extresist all"

Full RC extraction is very disruptive to .spice netlist, netlist will change a lot.

Recommended right now:
extract all
extresist tolerance 10
ext2spice lvs
ext2spice cthresh 0
ext2spice extresist on
ext2spice

### GDS Reading Options in Magic

Magic command "gds" with some options.
"gds read <file>"
"gds readonly <true|false>" needed since magic layers not always correspond to GSDII layers, use do not change PDK library files
"gds flatten true" : flattens small subcells into parent cell if below 10
"gds noduplicates true" : careful, useful to maintain abstract view of loaded cells when loading GDS file which contains the full cell (of the same name).

### GDS Writing, Input/Output Styles and Output Issues

"gds library true" create a GDS library without
"gds addendum true" : ignores read-only cells when writting outputs, avoids duplicate information, but result is not self-contained, since other GDSII file is required.
"gds merge <true|false>" : merges rectangles into polygons, saves space in output faile.

Remember to set the correct input and output style before reading or writing gds files.
"cif istyle sky130()" or "cif istyle sky130(vendor)", the latter is required to read files which are part of the SKY130 PDK due to reasons.
"style rdlimport" : rdl (redistribution layer) needed for bumping.
"style gdsii" 
"style drc"
"style density" : see sky130/custom/scripts/check_density.py
"style wafflefill" : see sky130/custom/scripts/generate_fill.py

### DRC Rules in Magic

Interactive DRC in Magic, marks errors in white pattern.
Different DRC styles in Magic, fast (typical checks, default), full(complete check, slow), routing (checks metal layers only, fastest).
"drc off" can be useful when loading large layout, to avoid lag.
Sometimes DRC errors exist in a cell, which get fixed in the parent cell (up in the hierarchy). This is fine if intended.
No open format to describe DRC errors, all Magic DRC checks are developed for Magic specifically.

Edge-based DRC rules, fast to check spacing, width, surrounds, extends (overlap).
Boolean geometry rules, object-based, second DRC engine in Magic does this, slower.

See open_pdks/sky130/custom/drc

### Extraction Rules and Errors in Magic

Magic tech file contains info about layer height/thickness, can be used to generate 3D view of layout. Useful for parasitic extraction also.

### LVS Setup for Netgen

Layout tool (Magic) does not do LVS. Netgen does LVS, only knows about netlists and how to compare them.
Subcircuits complicate things, e.g. when pins of a resistor can be swapped (permutable).
Figure out that series or parallel devices can be combined and is equivalent to a single device.

See /usr/share/pdk/sky130A/libs.tech/netgen/sky130A_setup.tcl

LVS issues with hierarchy, hierarchy should be same in schematic and layout to make LVS life easier.
LVS may flatten subcircuits to be able to match hierarchy. Flattening can cause big mess.

Netgen can also do Layout vs Verilog (LVV). Verilog can be seen as a netlist format.
Can match SPICE vs Verilog. Verilog should then only contain library cells.
Cannot run LVS down to transistor level, standard cells (considered correct) must be blackboxed.

### Verification by XOR

Compare two layouts by XOR-ing layers/masks. Highlights differences (or changes) between two layouts A and B.

---

## Day 3 Front-End and Back-End DRC

---

## Day 4 Understanding the PNR and Physical Verification (Bonus)

---

## Day 5 Running LVS

---

## References:

[1] https://thesis.library.caltech.edu/1101/1/Whitney_te_1985.pdf
[2] https://boolean.klassholwerda.nl/interface/bnf/gdsformat.html (down)
