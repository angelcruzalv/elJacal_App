import 'package:flutter/material.dart';
import 'package:flutter_app/src/mixins/validation_mixins.dart';
import 'package:flutter_app/src/widgets/app_button.dart';
import 'package:flutter_app/src/widgets/app_textfield.dart';
import 'package:flutter_app/src/services/authentication.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';


class LoginScreen extends StatefulWidget {

  static const String routeName= '/login';
  @override
  _LoginScreenState createState() => new _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> with ValidationMixins {
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
      resizeToAvoidBottomPadding: false ,
      body: ModalProgressHUD(  //ProgressBar
      inAsyncCall: showSpinner,  //progressbar
      child: Form(
        key: _globalKey,
        child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 20.0,),
            Image.asset('images/logo_circ.png', height: 250, width: 250,),
            SizedBox(height: 48.0,),
            _emailField(),
            SizedBox(height: 18.0,),
            _passwordField(),
            _submitButton(),
            FlatButton(
              child: Text("Olvidé mi contraseña", style: TextStyle(color: Colors.red, fontFamily: "Arial", fontSize: 15.0), textAlign:TextAlign.center,),
              onPressed: (){
                print("Presionado");
              },
            ),
          ],
        ),
      )
      )
      ),

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
                color: Color.fromRGBO(255, 59, 48, 1.0),
                name: "Iniciar sesión",
                onPressed: ()async{
if (_globalKey.currentState.validate()) {
                setSpinnerStatus(true);
                var newUser = await Authentication().signIn(email: _email, password: _password);
                if(newUser != null){
                   Navigator.pushNamed(context, '/nav');
                 
                }
                setSpinnerStatus(false);
              }else{
                setState(() => _autoValidate = true);
              }
}
            );
  }
}