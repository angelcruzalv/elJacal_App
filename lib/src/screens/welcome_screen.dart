import 'package:flutter/material.dart';
import 'package:flutter_app/src/widgets/app_button.dart';
//Statefulwidget tutorial
//https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html

class WelcomeScreen extends StatefulWidget {
  static const String routeName= '';

  @override
  _WelcomeScreenState createState() => new _WelcomeScreenState();
}
//Este es la pantalla inicial, la pantalla inicial se cambia desde el main.dart
class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //   backgroundColor: Colors.red,
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 20.0,),
            Image.asset('images/logo_circ.png', height: 250, width: 250,),
            AppButton(
              color: Color.fromRGBO( 0, 191, 166, 1.0),
              name: "Iniciar sesión ",
              onPressed: (){
                Navigator.pushNamed(context, '/login');
              },
            ),
           
            FlatButton(
              child: Text("Resgistrarse", style: TextStyle(color: Color.fromRGBO(0, 191, 166, 1.0), fontFamily: "Arial", fontSize: 15.0), textAlign:TextAlign.center,),
              onPressed: (){
                 Navigator.pushNamed(context, '/registration');
              },
            ),
          ],
        ),
      ),
    );
  }
}