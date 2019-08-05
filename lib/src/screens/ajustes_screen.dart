import 'package:flutter/material.dart';
import 'package:flutter_app/src/services/authentication.dart';

class AjustesScreen extends StatefulWidget {
  @override
  _AjustesScreenState createState() => new _AjustesScreenState();
 }
class _AjustesScreenState extends State<AjustesScreen> {
  @override
  Widget build(BuildContext context) {
   return new Scaffold(
     appBar: AppBar(
        title: const Text('Configuración'),
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
      body: Center(child: Text('Hola desde Configuración')),
    
    
   );
  }
}