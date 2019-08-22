import 'package:flutter/material.dart';
import 'package:flutter_app/src/services/authentication.dart';

class BalanceScreen extends StatefulWidget {
  @override
  _BalanceScreenState createState() => new _BalanceScreenState();
 }
class _BalanceScreenState extends State<BalanceScreen> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
     theme: ThemeData(
        primaryColor:  Color.fromRGBO(0, 191, 166, 1.0),
      ),
     home: Scaffold(
     appBar: AppBar(
        title: const Text('Balance', style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1.0)),),
              automaticallyImplyLeading: false,
              actions: <Widget>[
                ButtonBar(
                  children: <Widget>[
                    FlatButton(
                      child: Text(
                        "Salir", style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1.0)),
                      ),
                      onPressed: () {
                        Authentication().signOut();
                        Navigator.pushNamed(context, "");
                      },
                    )
                  ],
                ),
              ],
        
      ), 
     //appBar: AppBar(title: Text('Inicio')),
     body: Center(
       child: Text("Hola desde balanceScreen"),
       
     ),
    
   )
   );
  }
}