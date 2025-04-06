from launch import LaunchDescription
from launch_ros.actions import Node
from launch.launch_description_sources import PythonLaunchDescriptionSource
from launch.actions import IncludeLaunchDescription
from launch.substitutions import PathJoinSubstitution
from launch_ros.substitutions import FindPackageShare
from ament_index_python.packages import get_package_share_directory
import os

def generate_launch_description():
    display_config_file = os.path.join(
        get_package_share_directory('waver_physical_bringup'),
        'params',
        'display_config.yaml'
    )
    return LaunchDescription([
        # Include the teleop_twist_joy launch file with a custom parameter file
        IncludeLaunchDescription(
            PythonLaunchDescriptionSource(
                PathJoinSubstitution([
                    FindPackageShare('teleop_twist_joy'),
                    'launch',
                    'teleop-launch.py'
                ])
            ),
            launch_arguments={
                'config_filepath': PathJoinSubstitution([
                    FindPackageShare('waver_physical_bringup'),
                    'params',
                    'teleop_twist_joy.yaml'
                ])
            }.items()
        ),
        # Node for the battery monitor
        Node(
            package='ina219_battery',
            executable='battery_monitor_node',
            name='battery_monitor_node',
            output='screen'
        ),
        # Node for the SSD1306 OLED display
        Node(
            package='ssd1306_display',
            executable='display_node',
            name='oled_display_node',
            parameters=[display_config_file]
        ),
        # Node for the i2c motor driver
        Node(
            package='i2c_motor_driver',
            executable='i2c_motor_node',
            name='i2c_motor_node',
            output='screen'
        )
    ])
