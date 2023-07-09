FROM ros:humble
ARG USERNAME=wayming
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    #
    # [Optional] Add sudo support. Omit if you don't need to install software after connecting.
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y python3-pip
ENV SHELL /bin/bash

# ********************************************************
# * Anything else you want to do like clean up goes here *
# ********************************************************
RUN apt-get install software-properties-common -y
RUN add-apt-repository universe
RUN apt-get update && apt-get install curl -y && apt-get install wget -y

RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get install ros-humble-desktop -y
RUN apt-get install ros-dev-tools -y
RUN apt-get install python3-colcon-common-extensions -y
RUN apt-get install git python3-rosdep python3-pip python3-colcon-common-extensions -y
RUN apt-get install ros-geometry-msgs -y
RUN apt-get install ros-humble-navigation2 ros-humble-nav2-bringup -y
RUN apt-get install ros-humble-rmw-cyclonedds-cpp -y
RUN apt-get install tmux tmuxinator iputils-ping -y
RUN apt-get install vim -y
RUN pip3 install setuptools==58.2.0
RUN pip3 install PySimpleGUI

#gazebo simulator
RUN sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list'
RUN wget http://packages.osrfoundation.org/gazebo.key -O - | sudo apt-key add -
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install ignition-fortress -y
RUN apt-get install ros-humble-turtlebot4-simulator -y
# RUN apt-get install libignition-cmake2-dev

# [Optional] Set the default user. Omit if you want to keep the default as root.
USER $USERNAME

CMD ["/bin/bash"]