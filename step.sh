#!/bin/bash

set -e

echo "This is Mussel"

if [ $launch_or_close_mussel = "launch" ]
then
    if [ -d "/Users/vagrant/git/build-for-testing/Build/Products/Debug-iphonesimulator/Mussel/Mussel.framework" ]
    then
        mussel_server_dir="/Users/vagrant/git/build-for-testing/Build/Products/Debug-iphonesimulator/Mussel/Mussel.framework"
        mussel_server_file_path=$mussel_server_dir/MusselServer.app
        chmod +x $mussel_server_file_path
        open -a $mussel_server_file_path
        echo "Mussel Server Launched"
    else
        open -a "MusselServer.app"
        echo "Mussel Server Launched"
    fi
else
    pkill -x MusselServer
    echo "Mussel Server Closed"
fi
