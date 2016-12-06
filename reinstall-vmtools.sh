#! /bin/bash
# Following lines auto-recompile VM Tools when kernel updated.
# Script shoudl start on boot.
 VMToolsCheckFile="/lib/modules/`uname -r`/misc/.vmware_installed"
 VMToolsVersion=`vmware-config-tools.pl --help 2>&1 | awk '$0 ~ /^VMware Tools [0-9]/ { print $3,$4 }'`

 printf "\nCurrent VM Tools version: $VMToolsVersion\n\n"

 if [[ ! -e $VMToolsCheckFile || `grep -c "$VMToolsVersion" $VMToolsCheckFile` -eq 0 ]]; then
 [ -x /usr/bin/vmware-config-tools.pl ] && \
 printf "Automatically compiling new build of VMware Tools\n\n" && \
 /usr/bin/vmware-config-tools.pl --default && \
 printf "$VMToolsVersion" > $VMToolsCheckFile && \
 rmmod pcnet32
 rmmod vmxnet
 depmod -a
 modprobe vmxnet
 fi
