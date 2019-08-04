import 'package:flutter/material.dart';
import 'package:flutter_app/src/widgets/app_button.dart';
import 'package:flutter_app/src/widgets/app_textfield.dart';
import 'package:flutter_app/src/services/authentication.dart';

class RegistrationScreen extends StatefulWidget {
   static const String routeName= '/registration';


  @override
  _RegistrationScreenState createState() => new _RegistrationScreenState();
 }
class _RegistrationScreenState extends State<RegistrationScreen> {
  String _email;
  String _password;
  @override
  Widget build(BuildContext context) {
   return new Scaffold(
     appBar: AppBar(title: Text("Nuevo usuario"),),
     body: Container(
       padding: EdgeInsets.all(10.0),
       child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
         children: <Widget>[
           SizedBox(height: 48.0,), 
           AppTextField(
             inputText: "Ingresar email",
             onChanged:(value){_email= value;
             print('Email: $_email');},
           ),
            SizedBox(height: 48.0,),
           AppTextField( inputText: "Ingresar contraseña",
             obscureText: true,
             onChanged:(value){_password = value;
             print('Contraseña: $_password');
             }
             ),

          // SizedBox(height: 8.0,),
           AppButton(
             color: Colors.redAccent,
             name: "Registrar",
             onPressed: () async {

                 var newUser = await Authentication().createUser(email: _email, password: _password);
                 if(newUser != null){
                 Navigator.pushNamed(context, '/navbar');
               
              
               }
               }
             
           ),
           
           AppButton(
             color: Colors.blueAccent,
             name: "Cancelar",
             onPressed: (){},
           )
         ],
       ),
     ),
   );

  }
}