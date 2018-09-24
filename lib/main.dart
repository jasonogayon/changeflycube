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
      duration: Duration(milliseconds: 5000),
      vsync: this
    );
    animation = Tween(begin: 0.0, end: 120.0).animate(animationController);
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animationController.fling();
      }
    });
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(bottom: 200.0)),
          LogoAnimation(animation: animation),
          Center(
            child: Container(
              padding: EdgeInsets.only(top: 20.0),
              child: Image.asset(
                'assets/changefly-name.png',
                width: 224.0,
              ),
            ),
          ),
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

class LogoAnimation extends AnimatedWidget {
  LogoAnimation({Key key, Animation animation})
    : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    Animation animation = listenable;
    return Center(
      child: Container(
        height: animation.value,
        width: animation.value,
        child: Image.asset('assets/changefly-cube.png'),
      ),
    );
  }
}
