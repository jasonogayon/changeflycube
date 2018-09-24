import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

void main() => runApp(ChangeFly());

class ChangeFly extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Cube(),
    );
  }
}

class Cube extends StatefulWidget {
  Cube({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CubeState createState() => _CubeState();
}

class _CubeState extends State<Cube> with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      duration: Duration(milliseconds: 2000),
      vsync: this
    );
    animation = Tween(begin: 0.0, end: 100.0).animate(animationController);
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animationController.forward();
      }
    });
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Stack(
            children: <Widget>[
              CubeLeftAnimation(animation: animation),
              CubeRightAnimation(animation: animation),
            ]
          ),
          CubeTopAnimation(animation: animation),
          CubeNameAnimation(animation: animation),
        ],
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}


class CubeTopAnimation extends AnimatedWidget {
  CubeTopAnimation({Key key, Animation animation})
    : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    Animation animation = listenable;
    return Opacity(
      opacity: animation.value/100,
      child: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(top: 100 + animation.value),
        child: Image.asset(
          'assets/changefly-cube-top.png',
          height: 112.0,
        ),
      ),
    );;
  }
}

class CubeLeftAnimation extends AnimatedWidget {
  CubeLeftAnimation({Key key, Animation animation})
    : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    Animation animation = listenable;
    return Opacity(
      opacity: animation.value/100,
      child: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(top: 200.0, right: 100 - animation.value),
        child: Image.asset(
          'assets/changefly-cube-left.png',
          height: 112.0,
        ),
      ),
    );
  }
}

class CubeRightAnimation extends AnimatedWidget {
  CubeRightAnimation({Key key, Animation animation})
    : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    Animation animation = listenable;
    return Opacity(
      opacity: animation.value/100,
      child: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(top: 200.0, left: 100 - animation.value),
        child: Image.asset(
          'assets/changefly-cube-right.png',
          height: 112.0,
        ),
      ),
    );
  }
}

class CubeNameAnimation extends AnimatedWidget {
  CubeNameAnimation({Key key, Animation animation})
    : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    Animation animation = listenable;
    return Center(
      child: Opacity(
        opacity: animation.value > 90.0 ? animation.value/100 : 0.0,
        child: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.only(top: 340.0),
          child: Image.asset(
            'assets/changefly-name.png',
            width: 224.0,
          ),
        ),
      )
    );
  }
}
