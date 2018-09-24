# CHANGEFLY CUBE #

A code challenge assignment from Changefly for a part-time internship program.

---

## Overview

1. [Clone the project](#clone-the-project)
2. [Install app dependencies](#install-app-dependencies)
3. [Run app](#run-app)

___

## Clone the project

Please make sure that you have the following tools installed in your machine:

* [Git](https://git-scm.com/downloads)
* [Flutter](https://flutter.io/)

Clone the project by running:

~~~~
git clone https://github.com/jasonogayon/changeflycube.git
~~~~

And then go inside the project directory:

~~~~
cd changeflycube
~~~~

---

## Install app dependencies

To install test dependencies, run the following inside the root project directory:

~~~~
flutter packages get
~~~~

The app Flutter SDK dependency is set to version `>=2.0.0-dev.68.0 <3.0.0` as of `09/24/2018`. There may be problems if dependencies if the Flutter SDK in a local machine is not a match with this version. If no installation problems occur, you're good to go.

---

## Run app

Run the app by running the following command:

~~~~
flutter run
~~~~


![alt text](https://github.com/jasonogayon/changeflycube/raw/master/screenshots/demo_ios.gif "iOS Demo")
![alt text](https://github.com/jasonogayon/changeflycube/raw/master/screenshots/demo_android.gif "Android Demo")

The app launcher icon is configured to use the `changefly-cube` logo, through the `flutter_launcher_icons` library. If that's not the case, please run the following commands and try running the app again:

~~~
flutter pub get
flutter pub pub run flutter_launcher_icons:main
~~~
