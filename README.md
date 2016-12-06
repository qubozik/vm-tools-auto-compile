# vm-tools-auto-compile
Installs/Reinstall VMTools on boot of Linux machines. 

When the machine is booted, the script will check to see if VMTools are installed. If not, VMTools will be compiled. This is most useful to auto-recompile VM Tools after a kernel update is applied.

# Installation

* Upload script to a location of your choice.
* Make the script executable.
* Add the script to rc.local to run a start-up.
