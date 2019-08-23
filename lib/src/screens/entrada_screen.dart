import 'package:flutter/material.dart';
import 'package:flutter_app/src/services/authentication.dart';
import 'package:flutter_app/src/services/entrada_services.dart';
import 'package:flutter_app/src/services/salida_services.dart';


class EntradaScreen extends StatefulWidget {
  @override
  _EntradaScreen createState() => new _EntradaScreen();
 }
class _EntradaScreen extends State<EntradaScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor:  Color.fromRGBO(0, 191, 166, 1.0),
      ),
        
      home: new Scaffold(
        appBar: AppBar(
              title: const Text('Entradas', style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1.0)),),
              automaticallyImplyLeading: false,
              actions: <Widget>[
                ButtonBar(
                  children: <Widget>[
                    FlatButton(
                      child: Text(
                        "Salir", style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1.0)),                      ),
                      onPressed: () {
                        Authentication().signOut();
                        Navigator.pushNamed(context, "");
                      },
                    )
                  ],
                ),
              ],
            ),

        body: Column(
        children: <Widget>[
          StreamBuilder(
            stream: EntradaService().getEntradasStream(),
            builder: (context, snapshot){
              if(snapshot.hasData){
                var entradas = snapshot.data.documents;
                List<EntradaItem> entradaItems = [];
                for (var entrada in entradas){
                  final entradaDpto = entrada.data['departamento'];
                  final entradaDesc = entrada.data['descripcion'];
                  final entradaFecha = entrada.data['fecha'].toString();
                  final entradaValor = entrada.data['valor'].toString();
                  entradaItems.add(EntradaItem(
                    departamento: entradaDpto,
                    descripcion: entradaDesc,
                    fecha: entradaFecha , 
                    valor: entradaValor,
                  ));
                }
                return Flexible(
                  child: MaterialApp(
                    home: Card(
                      child: ListView(
                        children: entradaItems,
                      ),
                    ),
                  ),
                );
              }
            }
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'addEntrada');
        },
        child: Icon(Icons.add,),
        backgroundColor:  Color.fromRGBO(192, 0, 25, 1.0),
        ),
       ),
    );
   
  }
}

class EntradaItem extends StatelessWidget {
  final String departamento;
  final String descripcion;
  final String fecha;
  final String valor;

  EntradaItem({this.departamento, this.descripcion, this.fecha, this.valor});
 @override
 Widget build(BuildContext context) {
  return new ListTile(
    leading: CircleAvatar(
      child: Text(departamento[0], style: TextStyle(color: Colors.white),),
      backgroundColor: Color.fromRGBO(0, 121, 191, 1.0  ),
    ),
    title: Text('$departamento', style:  TextStyle(fontWeight: FontWeight.bold),),
    subtitle: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('$descripcion'),
        Text('Valor: $valor \n', style: TextStyle(fontWeight: FontWeight.bold),)
      ],
    ),
  isThreeLine: true,
  trailing: Icon(Icons.expand_more),
  onTap: (){},
 );
 }
}