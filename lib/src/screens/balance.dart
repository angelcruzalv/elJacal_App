import 'package:flutter/material.dart';
import 'package:flutter_app/src/services/authentication.dart';

class BalanceScreen extends StatefulWidget {
  @override
  _BalanceScreenState createState() => new _BalanceScreenState();
 }
class _BalanceScreenState extends State<BalanceScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
     appBar: AppBar(
        title: const Text('Balance'),
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
      body: Center(child: Text('Hola desde Balance')),
     
    
   );
  }
}