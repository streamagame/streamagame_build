#!/bin/bash

pushd `dirname $0` > /dev/null
GAPATH=`pwd`
popd > /dev/null

export GADEPS=$GAPATH/deps.posix
export PKG_CONFIG_PATH=$GADEPS/lib/pkgconfig:/opt/local/lib/pkgconfig:/usr/lib/i386-linux-gnu/pkgconfig/:/usr/lib/pkgconfig:/usr/local/Cellar/ffmpeg/1.2.4/lib/pkgconfig/:/usr/local/Cellar/sdl2/2.0.0/lib/pkgconfig/:/usr/local/Cellar/sdl2_ttf/2.0.12/lib/pkgconfig/
export PATH=$GADEPS/bin:$PATH

cd $GAPATH

# Build the dependencies
if [ ! -d "deps.posix" ]; then
	echo "*** Building dependencies ***"
	cd deps.src/
	make || exit 1;
	cd ../
fi

# Build GamingAnywhere
echo "*** Building GamingAnywhere ***"
cd ga/
make all || exit 1;
make install || exit 1;
cd ../

echo "*** Done. ***"
