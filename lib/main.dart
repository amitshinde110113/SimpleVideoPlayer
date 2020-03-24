import 'package:flutter/material.dart';
import 'package:videoportal/Widgets/home.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Streaming',
      home: Home()
    );
  }
}
