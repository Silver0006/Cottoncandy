cmake_minimum_required(VERSION 3.10)

project(Cottoncandy VERSION 0.2.0)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED True)

include_directories(include)

set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -g -O0 -Wall -Wextra -Wpedantic")

set(SOURCES
    src/main.cpp
    src/windows/win32_interface.cpp
)

add_executable(Cottoncandy ${SOURCES})

# if (WIN32)
#     ##Adding admin prompt for windows
#     add_custom_command(TARGET Cottoncandy POST_BUILD
#         COMMAND "${CMAKE_SOURCE_DIR}/mt.exe" -manifest "${CMAKE_SOURCE_DIR}/Cottoncandy.exe.manifest" -outputresource:$<TARGET_FILE:Cottoncandy>;#1
#         )
# endif()