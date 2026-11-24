# Study Planner

A responsive Flutter and Dart study planner for phones and desktop computers.

## Features

- Responsive dashboard that adapts to narrow phone screens and wide desktop windows.
- Add, complete, delete, and filter study tasks.
- Progress counts for total, completed, and remaining tasks.
- Material 3 interface with touch-friendly controls.

Tasks currently live in memory and reset when the app closes. Persistent storage is not implemented yet.

## Requirements

- Flutter SDK (Dart is included)
- Android Studio with an Android emulator or a connected Android phone
- For Windows desktop builds: Windows and Visual Studio with the Desktop development with C++ workload
- For iOS or macOS builds: macOS with Xcode

## Run on a phone

```bash
flutter pub get
flutter devices
flutter run -d <device-id>
```

For an Android release APK:

```bash
flutter build apk --release
```

The APK is generated at `build/app/outputs/flutter-apk/app-release.apk`.

## Run on a desktop PC

Enable the Windows target if needed, then run:

```bash
flutter config --enable-windows-desktop
flutter run -d windows
```

Build a Windows release:

```bash
flutter build windows --release
```

The Windows build is generated under `build/windows/x64/runner/Release/`.

Linux desktop builds can be run with `flutter run -d linux` on a Linux machine. iOS and macOS targets require macOS and Xcode.

## Project structure

- `lib/main.dart` — Flutter app, responsive layouts, and task interactions.
- `android/`, `ios/`, `windows/`, `linux/`, `macos/` — Flutter platform runners.
- `pubspec.yaml` — Flutter package configuration.

## GitHub

Repository: https://github.com/izabayonazer-hash/Group_7_Study_Planner
