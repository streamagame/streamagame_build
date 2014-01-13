
MODE	?= debug

all:
	android update project -p .
	ndk-build
	ant -Dsdk.dir=$(ANDROID_HOME) $(MODE)

clean:
	android update project -p .
	ant clean
	ndk-build clean
	rm -rf libs obj

