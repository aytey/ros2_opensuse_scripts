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
lsb_release  -a
LSB Version:    core-2.0-noarch:core-3.2-noarch:core-4.0-noarch:core-2.0-x86_64:core-3.2-x86_64:core-4.0-x86_64:desktop-4.0.fake-amd64:desktop-4.0.fake-noarch:graphics-2.0-amd64:graphics-2.0-noarch:graphics-3.2-amd64:graphics-3.2-noarch:graphics-4.0.fake-amd64:graphics-4.0.fake-noarch
Distributor ID: openSUSE
Description:    openSUSE Tumbleweed
Release:        20210830
Codename:       n/a
```

```
g++ --version
g++ (SUSE Linux) 11.2.1 20210816 [revision 056e324ce46a7924b5cf10f61010cf9dd2ca10e9]
Copyright (C) 2021 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
```

## Successful build

A successful build will end with something like:

```
Summary: 330 packages finished [32min 16s]
  12 packages had stderr output: fastrtps foonathan_memory_vendor google_benchmark_vendor iceoryx_posh mimick_vendor rmw_connextdds_common ros1_bridge rti_connext_dds_cmake_module rviz_common rviz_default_plugins rviz_rendering uncrustify_vendor
```

(notice: there are no packages that failed to compile or were skipped)

## Notes

OpenEXR recently (as of August 26, https://lwn.net/Articles/867482/) has had a vulnerability that has taken some of then openSUSE packages offline.

If you see:

```
Resolving package dependencies...

Problem: nothing provides 'libIlmImf-2_5.so.25()(64bit)' needed by the to be installed libopencv_imgcodecs4_5-4.5.2-1.6.x86_64
 Solution 1: do not install opencv-devel-4.5.2-1.6.x86_64
 Solution 2: break libopencv_imgcodecs4_5-4.5.2-1.6.x86_64 by ignoring some of its dependencies

Choose from above solutions by number or cancel [1/2/c/d/?] (c): 
```

then you need to run the `zypper install` command from `get_deps.sh` manually (and **without** `-y`) and enter `2` at the prompt. We never run Ros2, only build it under VectorCAST, so it is fine if OpenCV is "broken".

This is attempted to be avoided by adding https://download.opensuse.org/repositories/home:dirkmueller:Factory/standard/home:dirkmueller:Factory.repo as an additional repo.
