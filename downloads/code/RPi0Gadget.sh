#!/bin/bash
#Updates Kernel to next Branch
sudo BRANCH="next" rpi-update;

#Load Overlay
echo "dtoverlay=dwc2" | sudo tee -a /boot/config.txt

#Load one of the G_xxx Modules (g_ether in this case)
#dwc2 is required only when automatically loading a g_ module,
#due to dwc2 being autoloaded after /etc/modules is read.
echo "dwc2" | sudo tee -a /etc/modules
echo "g_ether" | sudo tee -a /etc/modules

#Configure the new Network Interface to register over DHCP
echo "allow-hotplug usb0" | sudo tee -a /etc/network/interfaces
echo "iface usb0 inet dhcp" | sudo tee -a /etc/network/interfaces
