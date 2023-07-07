#/bin/bash
set -x

echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
echo "source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash" >> ~/.bashrc
echo "export TURTLEBOT3_MODEL=waffle" >> ~/.bashrc
echo "export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp" >> ~/.bashrc
. ~/.bashrc

sudo dpkg --configure -a
rosdep update

sudo chown -R wayming /home/wayming/
colcon build --symlink-install

echo "source $HOME/install/setup.bash" >> ~/.bashrc
. ~/.bashrc
