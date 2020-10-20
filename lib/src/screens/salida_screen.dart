import 'package:flutter/material.dart';
import 'package:flutter_app/src/services/authentication.dart';
import 'package:flutter_app/src/services/salida_services.dart';
import 'package:intl/intl.dart';

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
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color.fromRGBO(0, 191, 166, 1.0),
        ),
        home: new Scaffold(
          // appBar: AppBar(
          //   title: const Text('Salidas', style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1.0)),),
          //   automaticallyImplyLeading: false,
          //   actions: <Widget>[
          //     ButtonBar(
          //       children: <Widget>[
          //         FlatButton(
          //           child: Text(
          //             "Salir", style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1.0)),                      ),
          //           onPressed: () {
          //             Authentication().signOut();
          //             Navigator.pushNamed(context, "");
          //           },
          //         )
          //       ],
          //     ),
          //   ],
          // ),
          body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: <Color>[
                //Color(0xFF78ffd6),
                Color(0xff0079991),
                Color(0xff0079991),
                Color(0xff007991),
                Color(0xff007991),
                Color(0xff0079991),
                Color(0xff0079991),
                // Color(0xFF78ffd6),
              ],
            )),
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 15.0, left: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: 125.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Salidas',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25.0),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 125.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.search),
                              color: Colors.white,
                              onPressed: () {},
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Container(
                  height: MediaQuery.of(context).size.height - 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35.0),
                          topRight: Radius.circular(35.0))),
                  child: Container(
                      child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Column(
                      children: <Widget>[
                        StreamBuilder(
                            stream: SalidaService().getSalidasStream(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                var salidas = snapshot.data.documents;
                                //List<Text> salidaWidgets = [];
                                List<SalidaItem> salidaItems = [];
                                List<String> salidaItemsString = [];
                                for (var salida in salidas) {
                                  final salidaDpto =
                                      salida.data["departamento"].toString();
                                  final salidaDesc =
                                      salida.data["descripcion"].toString();
                                  final salidaFecha =
                                      salida.data["fecha"].toString();
                                  final salidaTotal =
                                      salida.data["total"].toString();
                                  final salidaValor =
                                      salida.data["valor"].toString();
                                  //salidaWidgets.add(Text('$salidaDpto , Descripción: $salidaDesc , Fecha: $salidaFecha , Total: $salidaTotal , Valor: $salidaValor'));
                                  salidaItems.add(SalidaItem(
                                    departamento: salidaDpto,
                                    descripcion: salidaDesc,
                                    valor: salidaValor,
                                    total: salidaTotal,
                                    fecha: salidaFecha,
                                  ));
                                  salidaItemsString.add(salidaFecha);
                                }
                                salidaItemsString
                                    .sort((a, b) => a.compareTo(b));
                                print('Ordenado: $salidaItemsString');
                                return Flexible(
                                    child: MaterialApp(
                                        debugShowCheckedModeBanner: false,
                                        //theme: ThemeData(primaryColor: Colors.red),
                                        home: Card(
                                          child: ListView(
                                            children: salidaItems,
                                          ),
                                        )));
                              }
                            }),
                      ],
                    ),
                  )),
                )
              ],
            ),
          ),
          // body: Column(
          //   children: <Widget>[
          //     StreamBuilder(
          //         stream: SalidaService().getSalidasStream(),
          //         builder: (context, snapshot) {
          //           if (snapshot.hasData) {
          //             var salidas = snapshot.data.documents;
          //             //List<Text> salidaWidgets = [];
          //             List<SalidaItem> salidaItems = [];
          //             List<String> salidaItemsString = [];
          //             for (var salida in salidas) {
          //               final salidaDpto = salida.data["departamento"].toString();
          //               final salidaDesc = salida.data["descripcion"].toString();
          //               final salidaFecha = salida.data["fecha"].toString();
          //               final salidaTotal = salida.data["total"].toString();
          //               final salidaValor = salida.data["valor"].toString();
          //               //salidaWidgets.add(Text('$salidaDpto , Descripción: $salidaDesc , Fecha: $salidaFecha , Total: $salidaTotal , Valor: $salidaValor'));
          //               salidaItems.add(SalidaItem(
          //                 departamento: salidaDpto,
          //                 descripcion: salidaDesc,
          //                 valor: salidaValor,
          //                 total: salidaTotal,
          //                 fecha: salidaFecha,
          //               ));
          //               salidaItemsString.add(salidaFecha);

          //             }
          //             salidaItemsString.sort((a, b) => a.compareTo(b));
          //             print('Ordenado: $salidaItemsString');
          //             return Flexible(
          //                 child: MaterialApp(
          //                     //theme: ThemeData(primaryColor: Colors.red),
          //                     home: Card(
          //                       child: ListView(
          //                         children: salidaItems,
          //                       ),
          //                     )
          //                   )
          //                );
          //           }
          //         }
          //       ),
          //   ],
          // ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            backgroundColor: Color.fromRGBO(192, 0, 25, 1.0),
            onPressed: () {
              Navigator.pushNamed(context, 'addSalida');
            },
          ),
        ));
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
    return Container(
        padding: EdgeInsets.only(right: 20.0),
        child: Card(
          color: Colors.transparent,
          elevation: 0.0,
          child: Column(
            children: <Widget>[
              ListTile(
                  leading: Icon(
                    Icons.account_balance_wallet,
                    color: Colors.red,
                  ),
                  title: Text('$departamento'),
                  subtitle: Text('$descripcion'),
                  trailing: Text(
                    fecha[0] +
                        fecha[1] +
                        fecha[2] +
                        fecha[3] +
                        fecha[4] +
                        '\n' +
                        fecha[6] +
                        fecha[7] +
                        fecha[8] +
                        fecha[9],
                    style: TextStyle(fontSize: 10.0),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text('$valor',
                      style: TextStyle(fontSize: 22.0, color: Colors.red))
                ],
              )
            ],
          ),
        ));
  }
}
