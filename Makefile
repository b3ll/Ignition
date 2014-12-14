all: clean build

clean:
	xctool -project Ignition/IgnitionLauncher/IgnitionLauncher.xcodeproj -scheme IgnitionLauncher -sdk iphoneos -configuration Debug clean
	xctool -project Ignition.xcodeproj -scheme Ignition -sdk iphoneos -configuration Debug clean
	make --directory=Ignition clean

build:
	xctool -project Ignition/IgnitionLauncher/IgnitionLauncher.xcodeproj -scheme IgnitionLauncher -sdk iphoneos -configuration Debug
	xctool -project Ignition.xcodeproj -scheme Ignition -sdk iphoneos -configuration Debug

