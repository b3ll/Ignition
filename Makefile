all: clean build

clean:
	xctool -project CarPlayActivator/CarPlayActivatorLauncher/CarPlayActivatorLauncher.xcodeproj -scheme CarPlayActivatorLauncher -sdk iphoneos -configuration Debug clean
	xctool -project CarPlayActivator.xcodeproj -scheme CarPlayActivator -sdk iphoneos -configuration Debug clean
	make --directory=CarPlayActivator clean

build:
	xctool -project CarPlayActivator/CarPlayActivatorLauncher/CarPlayActivatorLauncher.xcodeproj -scheme CarPlayActivatorLauncher -sdk iphoneos -configuration Debug
	xctool -project CarPlayActivator.xcodeproj -scheme CarPlayActivator -sdk iphoneos -configuration Debug

