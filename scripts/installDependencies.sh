#!/bin/bash
# installDependencies.sh
# Install dependencies for  the Intel Realsense library librealsense2 on a Jetson AGX Xaier Developer Kit
# Copyright (c) 2016-19 Jetsonhacks 
# MIT License
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`
# e.g. echo "${red}red text ${green}green text${reset}"
echo "${green}Adding Universe repository and updating${reset}"
echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
apt-add-repository universe
apt-get update
echo "${green}Adding dependencies, graphics libraries and tools${reset}"
apt-get install libssl-dev libusb-1.0-0-dev pkg-config -y -q --no-install-recommends
# This is for ccmake
apt-get install build-essential cmake cmake-curses-gui -y -q --no-install-recommends

# Graphics libraries - for SDK's OpenGL-enabled examples
apt-get install libgtk-3-dev libglfw3-dev libgl1-mesa-dev libglu1-mesa-dev -y -q --no-install-recommends

# QtCreator for development; not required for librealsense core library
apt-get install qtcreator -y -q --no-install-recommends


