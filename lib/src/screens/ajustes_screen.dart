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
          body: ListView(
            children: <Widget>[
              Card(child: ListTile(leading: Icon(Icons.settings), title: Text("Ajuste 1"),),),
              Card(child: ListTile(leading: Icon(Icons.settings), title: Text("Ajuste 2"),)),
              Card(child: ListTile(leading: Icon(Icons.settings), title: Text("Ajuste 3"),)),
              Card(child: ListTile(leading: Icon(Icons.settings), title: Text("Ajuste 4"),)),
              Card(child: ListTile(
                leading: FlutterLogo(size: 62.0,), 
                title: Text("Ajuste 5"),
                subtitle: Text("Este es un ejemplo de un subtítulo de tres líneas, el problema es que no sé cómo indicarle el salto de línea"),
                contentPadding: EdgeInsets.all(10.0),
                isThreeLine: true, 
                trailing: Icon(Icons.more),
                onTap: (){},))
              ],),
    
   );
  }
}