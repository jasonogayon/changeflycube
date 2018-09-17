import 'package:flutter/material.dart';

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

class _CubeState extends State<Cube> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Center(
            child: Container(
              padding: EdgeInsets.only(top: 100.0),
              child: Image.asset(
                'assets/changefly-cube.png',
                height: 200.0,
              ),
            ),
          ),
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
}
