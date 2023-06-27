#/bin/bash

rm -rf src/aerostack2
git clone https://github.com/aerostack2/aerostack2.git src/
git clone https://github.com/aerostack2/project_gazebo src/aerostack2/projects/gazebo

source ~/.bashrc
sudo rosdep update
sudo rosdep install --from-paths src --ignore-src -y
sudo chown -R wayming /home/wayming/
colcon build --symlink-install
as2 build