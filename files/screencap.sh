#!/bin/sh
#
chmod 755 files/adb.osx files/adb.linux

systype=$(uname -s)

case x"$systype" in
	xLinux*)
		adb="files/adb.linux";;
	xDarwin*)
		adb="files/adb.osx";;
	*)
		echo "Unrecognized system type $systype. adb must be on your path."
		adb="adb";;
esac

adb shell screencap -p | sed 's/\r$//' > $1
