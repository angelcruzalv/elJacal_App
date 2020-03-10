import 'package:flutter/material.dart';
import 'package:flutter_app/src/services/authentication.dart';
import 'package:flutter_app/src/services/entrada_services.dart';


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
        
      home: Scaffold(
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
                          'Entradas',
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
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                children: <Widget>[
                  
                ],
              ),
            )
          ],
        ),
        ),
      //   body: Container(
      //   children: <Widget>[
      //     StreamBuilder(
      //       stream: EntradaService().getEntradasStream(),
      //       builder: (context, snapshot){
      //         if(snapshot.hasData){
      //           var entradas = snapshot.data.documents;
      //           List<EntradaItem> entradaItems = [];
      //           for (var entrada in entradas){
      //             final entradaDpto = entrada.data['departamento'];
      //             final entradaDesc = entrada.data['descripcion'];
      //             final entradaFecha = entrada.data['fecha'].toString();
      //             final entradaValor = entrada.data['valor'].toString();
      //             entradaItems.add(EntradaItem(
      //               departamento: entradaDpto,
      //               descripcion: entradaDesc,
      //               fecha: entradaFecha , 
      //               valor: entradaValor,
      //             ));
      //           }
      //           return Flexible(
      //             child: MaterialApp(
      //               home: Card(
      //                 child: ListView(
      //                   children: entradaItems,
      //                 ),
      //               ),
      //             ),
      //           );
      //         }
      //       }
      //     )
      //   ],
      // ),
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

   return Container(
        padding: EdgeInsets.only(right: 20.0),
        child: Card(
          color: Colors.transparent,
          elevation: 0.0,
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.account_balance_wallet, color: Colors.green,),
                title: Text('$departamento'),
                subtitle:
                    Text('$descripcion'),
                trailing: Text(fecha[0]+fecha[1]+fecha[2]+fecha[3]+ fecha[4]
                 +'\n'+fecha[6]+fecha[7]+fecha[8]+fecha[9]
                 ,style: TextStyle(fontSize: 10.0),)               
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text('$valor', style: TextStyle(fontSize: 22.0, color: Colors.green ))
                ],
              )
            ],
          ),
        )
      );
//   return new ListTile(
//     leading: CircleAvatar(
//       child: Text(departamento[0], style: TextStyle(color: Colors.white),),
//       backgroundColor: Color.fromRGBO(0, 121, 191, 1.0  ),
//     ),
//     title: Text('$departamento', style:  TextStyle(fontWeight: FontWeight.bold),),
//     subtitle: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Text('$descripcion'),
//         Text('Valor: $valor \n', style: TextStyle(fontWeight: FontWeight.bold),)
//       ],
//     ),
//   isThreeLine: true,
//   trailing: Text(
//         fecha[0]+fecha[1]+fecha[2]+fecha[3]+ fecha[4]
//         +'\n'+fecha[6]+fecha[7]+fecha[8]+fecha[9]
//         ,style: TextStyle(fontSize: 10.0),),
//   onTap: (){},
//  );
 }
}