#!/bin/bash

installPackage=false

function process
{
  packageName=$1
  echo "######### key  : $packageName"
  v=$(eval "apt-cache policy  $packageName | grep 'Candidate:' | cut -c 14-")
  echo "######### version: $v"
  array[$packageName]=$v
#  echo "value: ${array[$packageName]}"
  equivs-control $packageName
  r1="sed -i -- 's/Standards-Version:.*/Version: $v/g' $packageName"
  eval $r1
  r2="sed -i -- 's/Package:.*/Package: $packageName/g' $packageName"
  eval $r2
  equivs-build $packageName

  if [ "$installPackage" = true ] ; then
    genFile=$packageName"_"$v"_all.deb"
    echo "######### install $genFile"
    sudo dpkg -i $genFile
  fi
}

function usage
{
	echo "Usage: " $0 " --install|i [packageName]+"
	echo "E.g: " $0 " -i rfkill nome-bluetooth bluez"
	echo "Note: to remove a deb without removing its dependencies: sudo dpkg -r --force-depends "package""
}

if [ $#  -lt 1 ]; then
	usage
	exit 1
fi

while [ "$1" != "" ]; do
    case $1 in
        -i | --install )        echo "Install"
				installPackage=true
                                ;;
        -h | --help )           usage
                                exit
                                ;;
        * )                     process $1
    esac
    shift
done
