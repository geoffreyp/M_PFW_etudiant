cmake_minimum_required( VERSION 3.0 )
project( myhello )
add_executable( myhello.out myhello.cpp )
install( TARGETS myhello.out DESTINATION bin )

