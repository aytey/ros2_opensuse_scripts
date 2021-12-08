# ros2_opensuse_scripts

This repo is a set of scripts for going from a fresh, openSUSE Tumbleweed install, to having a full build of Ros2 'Galatic'.

## Steps

To build:

```bash
sudo zypper install git
git clone https://github.com/andrewvaughanj/ros2_opensuse_scripts
cd ros2_opensuse_scripts
./get_deps.sh
./steps.sh
```

## Last tested on

```
LSB Version:    core-2.0-noarch:core-3.2-noarch:core-4.0-noarch:core-2.0-x86_64:core-3.2-x86_64:core-4.0-x86_64:desktop-4.0.fake-amd64:desktop-4.0.fake-noarch:graphics-2.0-amd64:graphics-2.0-noarch:graphics-3.2-amd64:graphics-3.2-noarch:graphics-4.0.fake-amd64:graphics-4.0.fake-noarch
avj@ros2tw:~/ros2_opensuse_scripts> lsb_release  -a
LSB Version:    core-2.0-noarch:core-3.2-noarch:core-4.0-noarch:core-2.0-x86_64:core-3.2-x86_64:core-4.0-x86_64:desktop-4.0.fake-amd64:desktop-4.0.fake-noarch:graphics-2.0-amd64:graphics-2.0-noarch:graphics-3.2-amd64:graphics-3.2-noarch:graphics-4.0.fake-amd64:graphics-4.0.fake-noarch
Distributor ID: openSUSE
Description:    openSUSE Tumbleweed
Release:        20211205
Codename:       n/a
```

```
g++ (SUSE Linux) 11.2.1 20211124 [revision 7510c23c1ec53aa4a62705f0384079661342ff7b]
Copyright (C) 2021 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
```

## Successful build

A successful build will end with something like:

```
Summary: 331 packages finished [40min 18s]
  98 packages had stderr output: action_tutorials_py ament_clang_format ament_clang_tidy ament_copyright ament_cppcheck ament_cpplint ament_flake8 ament_index_python ament_lint ament_lint_cmake ament_mypy ament_package ament_pclint ament_pep257 ament_pycodestyle ament_pyflakes ament_uncrustify ament_xmllint cyclonedds demo_nodes_py domain_coordinator examples_rclpy_executors examples_rclpy_guard_conditions examples_rclpy_minimal_action_client examples_rclpy_minimal_action_server examples_rclpy_minimal_client examples_rclpy_minimal_publisher examples_rclpy_minimal_service examples_rclpy_minimal_subscriber examples_rclpy_pointcloud_publisher examples_tf2_py foonathan_memory_vendor google_benchmark_vendor iceoryx_posh launch launch_ros launch_testing launch_testing_ros launch_xml launch_yaml mimick_vendor osrf_pycommon pendulum_control quality_of_service_demo_py rmw_connextdds_common ros1_bridge ros2action ros2bag ros2cli ros2component ros2doctor ros2interface ros2launch ros2lifecycle ros2multicast ros2node ros2param ros2pkg ros2run ros2service ros2test ros2topic ros2trace rosidl_cli rosidl_runtime_py rpyutils rqt rqt_action rqt_bag rqt_bag_plugins rqt_console rqt_graph rqt_gui rqt_gui_py rqt_msg rqt_plot rqt_publisher rqt_py_console rqt_reconfigure rqt_service_caller rqt_shell rqt_srv rqt_top rqt_topic rti_connext_dds_cmake_module rviz_common rviz_default_plugins rviz_rendering sensor_msgs_py sros2 test_launch_ros tf2_ros_py tf2_tools topic_monitor tracetools_launch tracetools_read tracetools_trace uncrustify_vendor
```

(notice: there are no packages that failed to compile or were skipped)

