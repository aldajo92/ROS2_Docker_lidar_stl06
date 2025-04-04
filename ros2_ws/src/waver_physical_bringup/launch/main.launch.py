from launch import LaunchDescription
from launch_ros.actions import Node
from launch.launch_description_sources import PythonLaunchDescriptionSource
from launch.actions import IncludeLaunchDescription
from launch.substitutions import PathJoinSubstitution
from launch_ros.substitutions import FindPackageShare

def generate_launch_description():
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
        # Node for the i2c motor driver
        Node(
            package='i2c_motor_driver',
            executable='i2c_motor_node',
            name='i2c_motor_node',
            output='screen'
        )
    ])