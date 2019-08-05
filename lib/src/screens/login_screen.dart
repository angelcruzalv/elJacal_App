import 'package:flutter/material.dart';
import 'package:flutter_app/src/widgets/app_button.dart';
import 'package:flutter_app/src/widgets/app_textfield.dart';
import 'package:flutter_app/src/services/authentication.dart';

class LoginScreen extends StatefulWidget {

  static const String routeName= '/login';
  @override
  _LoginScreenState createState() => new _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  String _email;
  String _password;
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //appBar: AppBar(title: Text("Login")),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset('images/el_jacal.png', height: 200, width: 200,),
            SizedBox(height: 48.0,),
            AppTextField(
              inputText: "Ingresar email",
              onChanged:(value){_email= value;
              print('Email: $_email');},
            ),

            SizedBox(height: 18.0,),
            AppTextField(

              inputText: "Ingresar contraseña",
              obscureText: true,
              onChanged:(value){_password= value;},),

            // SizedBox(height: 8.0,),
            AppButton(
                color: Colors.redAccent,
                name: "Iniciar sesión",
                onPressed: ()async{
                  var newUser = await Authentication().signIn(email: _email, password: _password);
                 if(newUser != null){
                 Navigator.pushNamed(context, '/nav');
                }
                                }
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