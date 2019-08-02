import 'package:flutter/material.dart';
import 'package:flutter_app/src/widgets/app_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String routeName= '';

  @override
  _WelcomeScreenState createState() => new _WelcomeScreenState();
}

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
            Image.asset('images/el_jacal.png', height: 200, width: 200,),
            AppButton(
              color: Colors.redAccent,
              name: "Iniciar sesión 2",
              onPressed: (){
                Navigator.pushNamed(context, '/login');
              },
            ),
            AppButton(
              color: Colors.deepOrangeAccent,
              name: "Registrarse 2",
              onPressed: (){
                Navigator.pushNamed(context, '/registration');
              },
            ),
            FlatButton(
              child: Text("Olvidé mi contraseña", style: TextStyle(color: Colors.red, fontFamily: "Arial", fontSize: 15.0), textAlign:TextAlign.center,),
              onPressed: (){
                print("Presionado");
              },
            ),
          ],
        ),
      ),
    );
  }
}