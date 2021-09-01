# ros2_opensuse_scripts

This repo is a set of scripts for going from a fresh, openSUSE Tumbleweed install, to having a full build of Ros2 'Galatic'.

## Steps

To build:

```bash
./get_deps.sh
./steps.sh
```

## Last tested on

```
lsb_release  -a
LSB Version:    n/a
Distributor ID: openSUSE
Description:    openSUSE Tumbleweed
Release:        20210820
Codename:       n/a
```

```
g++ --version
g++ (SUSE Linux) 11.1.1 20210721 [revision 076930b9690ac3564638636f6b13bbb6bc608aea]
Copyright (C) 2021 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
```

