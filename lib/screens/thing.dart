import 'package:flutter/material.dart';
import 'package:flutter_app/screens/custom/left_navigation.dart';

class Thing extends StatefulWidget {
  @override
  _ThingState createState() => _ThingState();
}

class _ThingState extends State<Thing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: LeftNavigation(),
      appBar: AppBar(
        backgroundColor: Color(0Xff5f72a9),
        elevation: 10.0,
        title: Text('Thing'),
      ),
      //drawer: LeftNavigation(),
      body: Center(
        child: Container(
          child: Text(
            "Thing",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 50,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Add Thing");
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0Xff5f72a9),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
