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
   return new MaterialApp(
     theme: ThemeData(
        primaryColor:  Color.fromRGBO(154, 209, 75, 1.0),
      ),
     home: Scaffold(
     appBar: AppBar(
        title: const Text('Entradas', style: TextStyle(color: Color.fromRGBO(237, 64, 60, 1.0)),),
              automaticallyImplyLeading: false,
              actions: <Widget>[
                ButtonBar(
                  children: <Widget>[
                    FlatButton(
                      child: Text(
                        "Salir",
                        style: TextStyle(color: Color.fromRGBO(237, 64, 60, 1.0)),
                      ),
                      onPressed: () {
                        Authentication().signOut();
                        Navigator.pushNamed(context, "");
                      },
                    )
                  ],
                ),
              ],
        
      ), 
     //appBar: AppBar(title: Text('Inicio')),
     body: Center(
       child: Text("Hola desde homescreen"),
       
     ),
    
   )
   );
  }
}

