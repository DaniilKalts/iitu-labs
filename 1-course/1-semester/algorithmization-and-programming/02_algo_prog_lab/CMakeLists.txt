# Minimum CMake version
cmake_minimum_required(VERSION 3.10)

# Project name and language
project(AlgoProgLab LANGUAGES CXX)

# Set the C++ standard to C++11 (or C++17/20 as needed)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Specify the source directory
add_executable(AlgoProgLab src/main.cpp)