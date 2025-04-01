cmake_minimum_required(VERSION 3.5)
project(qmi8658_imu)

# Find dependencies
find_package(ament_cmake REQUIRED)
find_package(rclcpp REQUIRED)
find_package(sensor_msgs REQUIRED)

add_executable(qmi8658_node src/qmi8658_node.cpp)

ament_target_dependencies(qmi8658_node rclcpp sensor_msgs)

install(TARGETS
  qmi8658_node
  DESTINATION lib/${PROJECT_NAME})

ament_package()
