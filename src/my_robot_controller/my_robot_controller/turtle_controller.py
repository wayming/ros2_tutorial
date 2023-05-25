#!/usr/bin/env python3

import rclpy
from rclpy.node import Node
from turtlesim.msg import Pose
from geometry_msgs.msg import Twist
class TurtleControllerNode(Node):
    def __init__(self):
        super().__init__("turtle_controller")
        self.pose_subscriber_ = self.create_subscription(
            Pose, "/turtle1/pose", self.pose_callback, 10
        )
        self.cmd_vel_pub_ = self.create_publisher(
            Twist, "/turtle1/cmd_vel", 10
        )
        self.get_logger().info("Turtle controller has been started.")

    def pose_callback(self, pose: Pose):
        cmd = Twist()
        
        if pose.x > 7.0 or pose.x < 4.0 or pose.y > 7.0 or pose.y < 4.0:
            cmd.linear.x = 1.0
            cmd.angular.z = 3.0
        else:     
            cmd.linear.x = 10.0
            cmd.angular.z = 0.0
        self.cmd_vel_pub_.publish(cmd)
    
def main(args=None):
    rclpy.init(args=args)
    node = TurtleControllerNode()
    rclpy.spin(node)
    rclpy.shutdown()