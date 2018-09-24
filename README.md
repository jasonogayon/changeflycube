# CHANGEFLY CUBE #

A code challenge assignment from Changefly for a part-time internship program.

---

## Overview

1. [Clone the project](#clone-the-project)
2. [Install app dependencies](#install-app-dependencies)
3. [Run app](#run-app)
4. [Code overview](#code-overview)

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

---

## Code overview

The app has only one screen, which is composed of four images being animated by a single animation controller. The images used in the app can be found inside the `/assets` directory.

Each animated image is its own class:

* CubeTopAnimation (uses the `changefly-cube-top.png` image), moving from top to center
* CubeLeftAnimation (uses the `changefly-cube-left.png` image), moving from left to center
* CubeRightAnimation (uses the `changefly-cube-right.png` image), moving from right to center
* CubeNameAnimation (uses the `changefly-name.png` image), appears when the cube is formed at the center

although they may be refactored into a single class. At the moment they're separated because I thought they're easier to read that way.

The images are being displayed in the screen in a stack so that they align properly in the center.

The animation happens by changing the opacity and padding values of the images while time passes, to show that they appear or disapper as well as to show that they move from a desired direction.

The animation is set to go on reverse once the initial animation behavior gets completed. The original animation behavior also runs again after the reversed animation finishes. The animation is then in a loop.
