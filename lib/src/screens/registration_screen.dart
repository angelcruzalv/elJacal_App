import 'package:flutter/material.dart';
import 'package:flutter_app/src/widgets/app_button.dart';
import 'package:flutter_app/src/widgets/app_textfield.dart';
import 'package:flutter_app/src/services/authentication.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
   static const String routeName= '/registration';


  @override
  _RegistrationScreenState createState() => new _RegistrationScreenState();
 }
class _RegistrationScreenState extends State<RegistrationScreen> {
  String _email;
  String _password;
 bool showSpinner = false;

void setSpinnerStatus(bool status){
  setState(() {
   showSpinner = status; 
  });
}
  @override
  Widget build(BuildContext context) {
   return new Scaffold(
     appBar: AppBar(title: Text("Nuevo usuario"),),
     body: ModalProgressHUD(
        inAsyncCall: showSpinner,
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(height: 48.0,), 
                AppTextField(
                  inputText: "Ingresar email",
                  onSaved:(value){_email= value;
                  print('Email: $_email');},
                ),
                  SizedBox(height: 48.0,),
                AppTextField( inputText: "Ingresar contraseña",
                  obscureText: true,
                  onSaved:(value){_password = value;
                  print('Contraseña: $_password');
                  }
                  ),

                // SizedBox(height: 8.0,),
                AppButton(
                  color: Colors.redAccent,
                  name: "Registrar",
                  onPressed: () async {
                      setSpinnerStatus(true);
                      var newUser = await Authentication().createUser(email: _email, password: _password);
                      if(newUser != null){
                      Navigator.pushNamed(context, '/nav');  
                      
                    }
                    setSpinnerStatus(false); 
                    }
                  
                ),
                
                AppButton(
                  color: Colors.blueAccent,
                  name: "Cancelar",
                  onPressed: (){},
                )
              ],
            ),
          ),)
   );

  }
}