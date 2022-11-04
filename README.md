# Taminations

Taminations for Android, iOS, MacOS, Windows, Web coded in Flutter

## To compile and run this code

- Install [git](https://git-scm.com/) and [flutter](https://flutter.dev/)
- Create a directory for your project and `cd` into it.
- Get this code with `git clone https://github.com/bradchristie/taminations-flutter.git`
- Then you can fetch the extra packages Taminations uses.
```
flutter pub get
```
- Before building the program, you need to run the code-generation program which
builds classes from the xml files.  This is a Dart command-line program:
```
dart util/xml_to_code.dart
```

- For iOS, build and run with these commands
```
cd ios
pod install
cd ..
flutter build ios
flutter run
```
Check out [this link](https://cloud-trends.medium.com/how-to-fix-flutter-idevice-id-running-errors-in-mac-osx-catalina-7aa1f89f61aa)
if you have a security problem with the Mac Gatekeeper
refusing to run flutter utility programs.