#!/bin/bash

set -eu

venv="colcon_venv"
colcon_src="colcon_src"
ros2_src="ros2_src"
unbuffer="stdbuf -i0 -o0 -e0"
bison_src="bison"

clean_up()
{
    rm -rf ${venv}
    rm -rf ${colcon_src}
    rm -rf ${ros2_src}
    rm -rf ${bison_src}
}

activate_venv()
{
    set +eu
    source ${venv}/bin/activate
    set -eu
}

setup_venv()
{
    rm -rf ${venv}
    python3 -m venv ${venv} --system-site-packages
    activate_venv
    pip install -U pip
    curl --output ${venv}/requirements.txt https://raw.githubusercontent.com/colcon/colcon.readthedocs.org/main/requirements.txt
    pip install -r ${venv}/requirements.txt
    pip install -U argcomplete flake8 flake8-blind-except flake8-builtins flake8-class-newline flake8-comprehensions flake8-deprecated flake8-docstrings flake8-import-order flake8-quotes importlib-metadata importlib-resources lark-parser pytest pytest-cov pytest-repeat pytest-rerunfailures pytest-runner setuptools vcstool numpy
}


activate_colcon()
{
    set +eu
    source ${colcon_src}/install/local_setup.sh
    set -eu
}

setup_colcon()
{
    rm -rf ${colcon_src}
    mkdir ${colcon_src}
    cd ${colcon_src}
    curl --output colcon.repos https://raw.githubusercontent.com/colcon/colcon.readthedocs.org/main/colcon.repos
    mkdir src
    vcs import src < colcon.repos
    ./src/colcon-core/bin/colcon build --paths src/*
    cd ..
}

setup_ros2()
{
    rm -rf ${ros2_src}
    mkdir ${ros2_src}
    cd ${ros2_src}
    curl --output ros2.repos https://raw.githubusercontent.com/ros2/ros2/humble/ros2.repos
    mkdir src
    vcs import src < ros2.repos
    cd ..
}

patch_ros2()
{
    here=$(readlink -f "$(pwd)")
    patches=$(readlink -f "patches")
    cd ${ros2_src}/src/ament/google_benchmark_vendor
    # cp ${patches}/google_benchmark_vendor_benchmark_register.patch .
    # git apply ${patches}/google_benchmark_vendor_cmakelists.patch
    git reset
    cd ${here}

    cd ${ros2_src}/src/ros2/rcpputils
    git clean -f -d -x .
    git checkout .
    # git apply ${patches}/ros2_rcpputils.patch
    git reset
    cd ${here}

    cd ${ros2_src}/src/ros2/realtime_support
    git clean -f -d -x .
    git checkout .
    # git apply ${patches}/fa9a5545db8f641212de78c5924f1305e01bc7a8.patch
    git reset
    cd ${here}

    cd ${ros2_src}/src/ros2/demos
    git clean -f -d -x .
    git checkout .
    # git apply ${patches}/demos_pendulum_control.patch
    git reset
    cd ${here}
}

build_ros2()
{
    cd ${ros2_src}
    rm -rf log install build
    ROS2_FLAGS="-fno-strict-aliasing"
    export CFLAGS="${ROS2_FLAGS}"
    export CXXFLAGS="${ROS2_FLAGS}"
    ${unbuffer} \
        colcon \
        build \
        --symlink-install \
        --cmake-args \
        ' -DCMAKE_EXPORT_COMPILE_COMMANDS=ON' \
        ' -DCMAKE_BUILD_TYPE=Debug' \
        ' -DTHIRDPARTY_Asio=ON' \
        ' -DCMAKE_CXX_FLAGS='${CXXFLAGS}' '\
        ' -DCMAKE_C_FLAGS='${CFLAGS}' ' \
        --no-warn-unused-cli \
        --cmake-force-configure \
        --event-handlers \
        "compile_commands+" \
        |& tee log.txt
    cd ..
}

setup_bison()
{
    rm -rf ${bison_src}
    mkdir ${bison_src}
    cd ${bison_src}
    wget "https://ftp.gnu.org/gnu/bison/bison-3.7.6.tar.gz"
    tar -xzvf bison-3.7.6.tar.gz
    cd bison-3.7.6
    ./configure --prefix=$(readlink -f ../root)
    make -j$(nproc)
    make install -j$(nproc)
    cd ..
    cd ..
}

activate_bision()
{
    export PATH=$(readlink -f ${bison_src}/root/bin):$PATH
}

# clean_up
# setup_venv
activate_venv
# setup_colcon
activate_colcon
# setup_bison
activate_bision
setup_ros2
patch_ros2
build_ros2

exit 0

# EOF
