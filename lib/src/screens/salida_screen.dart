import 'package:flutter/material.dart';
import 'package:flutter_app/src/screens/addSalida.dart';
import 'package:flutter_app/src/services/authentication.dart';
import 'package:flutter_app/src/services/entrada_services.dart';
import 'package:flutter_app/src/services/salida_services.dart';

import 'package:flutter_app/src/widgets/app_textfield.dart';


class SalidaScreen extends StatefulWidget {
  @override
  _SalidaScreenState createState() => new _SalidaScreenState();
}

class _SalidaScreenState extends State<SalidaScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getSalidas();
  }

  void _getSalidas() async {
    await for (var snapshot in SalidaService().getSalidasStream()) {
      for (var salida in snapshot.documents) {
        print(salida.data);
      }
    }
  }

  Widget build(BuildContext context) {
    return new MaterialApp(
        theme: ThemeData(
        primaryColor:  Color.fromRGBO(0, 191, 166, 1.0),
      ),
        home: new Scaffold(
            appBar: AppBar(
              title: const Text('Salidas', style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1.0)),),
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
                    stream: SalidaService().getSalidasStream(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var salidas = snapshot.data.documents;
                        //List<Text> salidaWidgets = [];
                        List<SalidaItem> salidaItems = [];
                        for (var salida in salidas) {
                          final salidaDpto = salida.data["departamento"];
                          final salidaDesc = salida.data["descripcion"];
                          final salidaFecha = salida.data["fecha"].toString();
                          final salidaTotal = salida.data["total"].toString();
                          final salidaValor = salida.data["valor"].toString();
                          //salidaWidgets.add(Text('$salidaDpto , Descripción: $salidaDesc , Fecha: $salidaFecha , Total: $salidaTotal , Valor: $salidaValor'));
                          salidaItems.add(SalidaItem(
                            departamento: salidaDpto,
                            descripcion: salidaDesc,
                            valor: salidaValor,
                            total: salidaTotal,
                            fecha: salidaFecha,
                          ));
                        }

                        return Flexible(
                            child: MaterialApp(                                                         
                                //theme: ThemeData(primaryColor: Colors.red),
                                home: Card(
                                  child: ListView(
                                    children: salidaItems,
                                  ),
                                )
                              )
                           );
                      }
                    }
                  ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              backgroundColor: Color.fromRGBO(192, 0, 25, 1.0),
              onPressed: (){
                Navigator.pushNamed(context, 'addSalida');
              },
            ),
          )
        );
  }
}

class SalidaItem extends StatelessWidget {
  final String departamento;
  final String descripcion;
  final String fecha;
  final String total;
  final String valor;
  SalidaItem(
      {this.departamento,
      this.descripcion,
      this.total,
      this.valor,
      this.fecha});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(departamento[0], style: TextStyle(color: Colors.white),),
        backgroundColor: Color.fromRGBO(0, 121, 191, 1.0),
      ),
      title: Text('$departamento', style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('$descripcion'),
          Text('Valor: $valor\n',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
      isThreeLine: true,
      contentPadding: EdgeInsets.all(10.0),
      trailing: Icon(Icons.expand_more),
      onTap: () {
     
      },
    );
  }
}
