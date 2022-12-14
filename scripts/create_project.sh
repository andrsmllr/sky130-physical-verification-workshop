#!/bin/sh

##########################################################################
# project setup, folder structure etc

# Since script can not be made executable on the lab instance,
# it must be sourced, set correct project name before doing so.
project_name=new_project
project_dir=$(pwd)/${project_name}

mkdir -p ${project_dir}
cd ${project_dir}

mkdir mag netgen ngspice xschem

##########################################################################
# xschem setup

cd ${project_dir}/xschem
ln -s /usr/share/pdk/sky130A/libs.tech/ngspice/spinit .spiceinit
ln -s /usr/share/pdk/sky130A/libs.tech/xschem/xschemrc xschemrc

##########################################################################
# magic setup

cd ${project_dir}/mag
ln -s /usr/share/pdk/sky130A/libs.tech/magic/sky130A.magicrc .magicrc
extract_script=${project_dir}/mag/do_extract.tcl
echo "extract do local" > ${extract_script}
echo "extract all" >> ${extract_script}
echo "ext2spice lvs" >> ${extract_script}
echo "ext2spice" >> ${extract_script}

extract_script=${project_dir}/mag/do_extract_caps.tcl
echo "extract do local" > ${extract_script}
echo "extract all" >> ${extract_script}
echo "ext2spice lvs" >> ${extract_script}
echo "ext2spice cthresh 0.01" >> ${extract_script}
echo "ext2spice" >> ${extract_script}

extract_script=${project_dir}/mag/do_extract_fullrc.tcl
echo "extract do local" > ${extract_script}
echo "extract all" >> ${extract_script}
echo "ext2sim labels on" >> ${extract_script}
echo "ext2sim" >> ${extract_script}
echo "extresist tolerance 10" >> ${extract_script}
echo "extresist all" >> ${extract_script}
echo "ext2spice cthresh 0.01" >> ${extract_script}
echo "ext2spice extresist on" >> ${extract_script}
echo "ext2spice" >> ${extract_script}

##########################################################################
# netgen setup

cd ${project_dir}/netgen
lvs_subcircuit=${project_name}
echo '#!/bin/sh' > ./run_lvs.sh
echo 'netgen -batch lvs "../mag/${subcircuit_name} ${subcircuit_name}" "../xschem/${subcircuit_name} ${subcircuit_name}"' >> run_lvs.sh

##########################################################################

cd ${project_dir}
