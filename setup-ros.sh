#!/bin/bash
# ROS1 installation Melodic for Ubuntu 18.04
# - Sets up keys for download pkgs
# - Installs the desktop-full version (most used version)
# - Installs other dependencies (MoveIt!, planning, ..)

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
sudo apt update
sudo apt install ros-melodic-desktop-full
echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
source ~/.bashrc
sudo apt install python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential
sudo rosdep init
rosdep update
sudo apt install ros-melodic-moveit-core ros-melodic-moveit-ros-planning-interface ros-melodic-moveit-visual-tools ros-melodic-control-toolbox ros-melodic-controller-interface ros-melodic-controller-manager ros-melodic-joint-limits-interface ros-melodic-industrial-msgs ros-melodic-moveit-simple-controller-manager ros-melodic-ompl ros-melodic-moveit-planners-ompl ros-melodic-moveit-ros-visualization ros-melodic-joint-state-controller ros-melodic-ros-controllers ros-melodic-moveit-commander ros-melodic-robot-state-publisher python-catkin-tools ros-melodic-joint-state-publisher-gui
echo "export ROSLAUNCH_SSH_UNKNOWN=1" >> ~/.bashrc

