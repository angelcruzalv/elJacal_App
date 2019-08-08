import 'package:flutter/material.dart';
import 'package:flutter_app/src/services/authentication.dart';
import 'package:flutter_app/src/services/entrada_services.dart';
import 'package:flutter_app/src/services/salida_services.dart';


class SalidaScreen extends StatefulWidget {
  @override
  _SalidaScreenState createState() => new _SalidaScreenState();
 }
class _SalidaScreenState extends State<SalidaScreen> {
  @override
  Widget build(BuildContext context) {
   return new Scaffold(
     appBar: AppBar(
        title: const Text('Salidas'),
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
      body: Center(child: Text('Hola desde salidas')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          EntradaService().save(
            collectionName: "ingresos",
            collectiosValues: {
              'total': '200',
              'venta': '300'}
          );
                },
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
    
   );
  }
}