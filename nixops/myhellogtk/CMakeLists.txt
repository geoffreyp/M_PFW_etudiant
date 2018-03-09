cmake_minimum_required( VERSION 3.0 )
project( myhellogtk )

set( CMAKE_CXX_FLAGS "-std=c++11 ${CMAKE_CXX_FLAGS}" )

find_package( PkgConfig REQUIRED )
pkg_check_modules( GTKMM REQUIRED gtkmm-3.0 )
include_directories( ${GTKMM_INCLUDE_DIRS} )

add_executable( myhellogtk.out myhellogtk.cpp )
target_link_libraries( myhellogtk.out ${GTKMM_LIBRARIES} )
install( TARGETS myhellogtk.out DESTINATION bin )

