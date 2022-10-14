echo "##########################################################"

echo "### Git status"
#cd ~/workspace/open_pdks && git status

echo "### Program locations"
echo "magic => $(which magic)"
echo "ngspice => $(which ngspice)"
echo "xschem => $(which xschem)"

echo "### Environment variables"
export PDK_ROOT=/usr/share/pdk
echo "PDK_ROOT = ${PDK_ROOT}"


echo "##########################################################"
echo "Happy Coding!"
cd ~/workspace

alias ll='ls -lha'
alias magicx='magic -d XR'
