import 'package:flutter/material.dart';
import 'package:flutter_app/src/services/authentication.dart';
class HomePage extends StatefulWidget {
  static const String routeName= '/home';
  @override
  _HomePageState createState() => new _HomePageState();
 }
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
   return new Scaffold(
     appBar: AppBar(title: Text('Inicio')),
  
   );
  }
}