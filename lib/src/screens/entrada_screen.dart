import 'package:flutter/material.dart';
import 'package:flutter_app/src/services/authentication.dart';


class EntradaScreen extends StatefulWidget {
  @override
  _EntradaScreen createState() => new _EntradaScreen();
 }
class _EntradaScreen extends State<EntradaScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        child: Scaffold(
          appBar: AppBar(
        title: const Text('Entradas'),
         automaticallyImplyLeading: false,
        actions: <Widget>[
          ButtonBar(children: <Widget>[
            FlatButton(
              child: Text("Salir", style: TextStyle(color: Colors.white),),
              onPressed: (){
                Authentication().signOut();
                Navigator.pushNamed(context, "");
              },
            )
          ],),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
        ),
      ),
    );
   
  }
}