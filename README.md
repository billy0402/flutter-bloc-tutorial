# flutter-bloc-tutorial

A new Flutter application.

## environment
- [macOS 10.15.3](https://www.apple.com/tw/macos/catalina/)
- [Android Studio 3.6.1](https://developer.android.com/studio)
- [Xcode 11.3.1](https://developer.apple.com/xcode/)
- [Flutter 1.12.13](https://flutter.dev/)
- [Dart 2.7.0](https://dart.dev/)
- iOS emulator iPhone 11 Pro Max
- Android emulator Pixel 2 (API 29)

## tutorial
- [Bloc](https://bloclibrary.dev/#/zh-cn/)

## [API](https://www.metaweather.com/api/)
- [Location Search](https://www.metaweather.com/api/location/search/?query=taipei)
- [Location Weather](https://www.metaweather.com/api/location/2306179/)

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Android Emulator DNS setup
```shell
# emulator path
$ cd ~/Library/Android/sdk/emulator/

# show your emulator list
$ ./emulator -list-avds

# set dns and start your emulator
$ ./emulator -avd Pixel_2_API_29 -dns-server 8.8.8.8,8.8.8.4
```
