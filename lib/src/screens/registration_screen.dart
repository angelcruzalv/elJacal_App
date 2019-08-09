import 'package:flutter/material.dart';
import 'package:flutter_app/src/mixins/validation_mixins.dart';
import 'package:flutter_app/src/widgets/app_button.dart';
import 'package:flutter_app/src/widgets/app_textfield.dart';
import 'package:flutter_app/src/services/authentication.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
   static const String routeName= '/registration';
  @override
  _RegistrationScreenState createState() => new _RegistrationScreenState();
 }
class _RegistrationScreenState extends State<RegistrationScreen> with ValidationMixins{
  String _email;
  String _password;
  bool showSpinner = false;
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>(); //validar
  bool _autoValidate = false;

void setSpinnerStatus(bool status){
  setState(() {
   showSpinner = status; 
  });
}
  @override
  Widget build(BuildContext context) {
   return new Scaffold(
     resizeToAvoidBottomPadding: false,
     appBar: AppBar(title: Text("Nuevo usuario"),),
     body: ModalProgressHUD(
        inAsyncCall: showSpinner,
          child: Form( 
            key: _globalKey,
            child: Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(height: 48.0,), 
                _emailField(),
                //SizedBox(height: 48.0,),
                _passwordField(),
                _submitButton(),
                _cancelButton(),
              ],
            ),
          ),)
          )
   );

  }
  Widget _emailField(){
    return AppTextField(
                  autoValidate: _autoValidate,
                  validator: validateEmail,
                  inputText: "Ingresar email",
                  onSaved:(value){_email= value;
                  print('Email: $_email');},
                );

  }
  Widget _passwordField(){
    return AppTextField( 
                  autoValidate: _autoValidate,
                  validator: validatePassword,
                  inputText: "Ingresar contraseña",
                  obscureText: true,
                  onSaved:(value){_password = value;
                  print('Contraseña: $_password');
                  }
                  );
    
  }
  Widget _submitButton(){
    return AppButton(
                  color: Colors.redAccent,
                  name: "Registrar",
                  onPressed: () async {
                    if (_globalKey.currentState.validate()) {
                      setSpinnerStatus(true);
                      var newUser = await Authentication().createUser(email: _email, password: _password);
                      if(newUser != null){
                      Navigator.pushNamed(context, '/nav');                       
                    }
                    setSpinnerStatus(false); 
                    } else{
                setState(() => _autoValidate = true);
              }                 
                  }
                );
  }
  Widget _cancelButton(){
    return AppButton(
                  color: Colors.blueAccent,
                  name: "Cancelar",
                  onPressed: (){},
                );
  }
}