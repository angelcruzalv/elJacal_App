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
      body: ListView.builder(
       itemBuilder: (context, position) {
        return Card(
          child: ListTile(
                leading: Icon(Icons.monetization_on, size: 62.0, color: Color.fromRGBO(255, 59, 53, 1.0),), 
                title: Text("Gasolina"),
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
          SalidaService().save(
            collectionName: "ingresos",
            collectionValues: {
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