#!/bin/bash

rm -rf src/aerostack2
git clone https://github.com/aerostack2/aerostack2.git src/aerostack2
git clone https://github.com/aerostack2/project_gazebo src/aerostack2/projects/gazebo

rm -rf $HOME/.ros2.bash
echo "source /opt/ros/humble/setup.bash" >> $HOME/.ros2.bash
echo "source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash" >> $HOME/.ros2.bash
echo "export TURTLEBOT3_MODEL=waffle" >> $HOME/.ros2.bash
echo "export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp" >> $HOME/.ros2.bash
echo "export AEROSTACK2_PATH=$HOME/src/aerostack2" >> $HOME/.ros2.bash
echo "source $HOME/src/aerostack2/as2_cli/setup_env.bash" >> $HOME/.ros2.bash
echo "source $HOME/.ros2.bash" >> $HOME/.bashrc
source $HOME/.ros2.bash

sudo dpkg --configure -a
sudo rosdep init
rosdep update
rosdep install -y -r -q --from-paths src --ignore-src --rosdistro humble

sudo chown -R wayming /home/wayming/
colcon build --symlink-install

echo "source $HOME/install/setup.bash" >> $HOME/.ros2.bash
source $HOME/.ros2.bash 

bash
as2 build
