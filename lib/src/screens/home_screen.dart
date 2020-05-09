import 'package:flutter/material.dart';
import 'package:flutter_app/src/services/authentication.dart';
class HomePage extends StatefulWidget {
  static const String routeName= '/home';
  @override
  _HomePageState createState() => new _HomePageState();
 }
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
    home: Scaffold(
      body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            Color(0xff007991),
            Color(0xFF78ffd6),
           ],
       )
      ),    //0xFF21BFBD
       child: ListView(
         children: <Widget>[
           Padding(
             padding: EdgeInsets.only(top: 15.0, left: 10.0),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: <Widget>[
                 Container(
                   width: 125,
                      child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Inicio",
                        style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0 ),
                        ),
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
                          onPressed: (){},
                        )
                      ],
                    ),
                  )
               ],
             ),
           ), 
          // SizedBox(height: 5.0,),
        /*   Padding(
             padding: EdgeInsets.only(top: 15.0 ,left: 40.0),
             child: Row(
               children: <Widget>[
                 Text("Inicio",
                 style: TextStyle(
                   fontFamily: 'Montserrat',
                   color: Colors.white,
                   fontWeight: FontWeight.bold,
                   fontSize: 25.0 ),
                ),
                 SizedBox(width: 10.0),
                 Text("",
                 style: TextStyle(
                   fontFamily: 'Montserrat',
                   color: Colors.white,
                   fontWeight: FontWeight.bold,
                   fontSize: 25.0 ),
                ),
               ],
             ),
           ),*/
           SizedBox(height: 15.0,),
           Container(
             height: MediaQuery.of(context).size.height-50,
             width: MediaQuery.of(context).size.width,
             decoration: BoxDecoration(
               color: Colors.white,
               borderRadius: BorderRadius.only(topLeft: Radius.circular(35.0), topRight: Radius.circular(35.0)),
             ),
             child: ListView(
               primary: false,
               //padding: EdgeInsets.only(left: 5.0, right: 5.0),
               children: <Widget>[
                 Padding(
                   padding: EdgeInsets.only(top: 0.0),
                   child: Container(
                     height: MediaQuery.of(context).size.height - 145.0,
                     width: MediaQuery.of(context).size.width,
                     child: ScrollConfiguration(
                       //Cambia el color del final del scroll del listview
                       behavior: ScrollBehavior(),
                       child: GlowingOverscrollIndicator(
                         axisDirection: AxisDirection.down,
                         color: Color(0xFF78ffd6), 
                         
                          child: ListView(
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                           children: <Widget>[
                           _cardIngresos(),
                           _cardEgresos(),
                           _cardBalance(),
                         
                       ],
                     ),
                   ), 
                  )



                   ),
                 ),
                 
               ],
             ),
           ),
         ],
       ),  )
     ),
    );
  }
  Widget _cardIngresos() {
    return Container(
        padding: EdgeInsets.only(right: 20.0),
        child: Card(
          color: Colors.transparent,
          elevation: 0.0,
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.account_balance_wallet, color: Colors.green,),
                title: Text('Ingresos totales'),
                subtitle:
                    Text('Aquí se muestran todos los ingresos de ventas '),
                
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text('12345678', style: TextStyle(fontSize: 22.0, color: Colors.green ))
                ],
              )
            ],
          ),
        ));
  }
   Widget _cardEgresos() {
    return Container(
        padding: EdgeInsets.only(right: 20.0),
        child: Card(
          color: Colors.transparent,
          elevation: 0.0,
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.account_balance_wallet, color: Colors.red,),
                title: Text('Egresos totales'),
                subtitle:
                    Text('Aquí se muestran el total de salida de dinero'),
                
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text('1345678', style: TextStyle(fontSize: 22.0, color: Colors.red ))
                ],
              )
            ],
          ),
        )
      );
  }

  Widget _cardBalance() {

    return Container(
      padding: EdgeInsets.only(right: 20.0),
      child: Card(
        color: Colors.transparent,
        elevation: 0.0,
        child: Column(
          children: <Widget>[
            ListTile(
                leading: Icon(Icons.attach_money, color: Colors.red,),
                title: Text('Balance'),
                subtitle:
                    Text('Aquí se muestran el total de salida de dinero'),
                
              
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text('110000000', style: TextStyle(fontSize: 22.0, color: Colors.orange),)
              ],
            )
          ],
        ),
      ),
    );

  }

}

