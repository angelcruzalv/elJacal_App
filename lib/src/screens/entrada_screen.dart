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
        title: const Text('Entradas', style: TextStyle(color: Color.fromRGBO(250,250,250, 1.0))),
         automaticallyImplyLeading: false,
        actions: <Widget>[
          ButtonBar(children: <Widget>[
            FlatButton(
              child: Text("Salir", style: TextStyle(color: Color.fromRGBO(255,255,255, 1.0)),),
              onPressed: (){
                Authentication().signOut();
                Navigator.pushNamed(context, "");
              },
            )
          ],),
        ],
      ),
      body: ListView.builder(
       itemBuilder: (context, position) {
        return Card(
          child: ListTile(
                leading: CircleAvatar( child: Text("V"),), 
                title: Text("Ventas"),
                subtitle: Text("Este es un ejemplo de un subtítulo de tres líneas, el problema es que no sé cómo indicarle el salto de línea"),
                contentPadding: EdgeInsets.all(10.0),
                isThreeLine: true, 
                trailing: Icon(Icons.expand_more),
                onTap: (){},
          ),
    );
  },
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

class name extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
  return new MaterialApp(
  
 );
 }
}