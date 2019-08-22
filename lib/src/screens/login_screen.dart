import 'package:flutter/material.dart';
import 'package:flutter_app/src/mixins/validation_mixins.dart';
import 'package:flutter_app/src/widgets/app_button.dart';
import 'package:flutter_app/src/widgets/app_error_message.dart';
import 'package:flutter_app/src/widgets/app_textfield.dart';
import 'package:flutter_app/src/services/authentication.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';
  @override
  _LoginScreenState createState() => new _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with ValidationMixins {
  // String _email;
  // String _password;
  bool showSpinner = false;
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>(); //validar
  bool _autoValidate = false;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  FocusNode _focusNode;
  String _errorMessage="";

  void setSpinnerStatus(bool status) {
    setState(() {
      showSpinner = status;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose(); //libera el recurso _focusNode
  }

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode(); //inicializa el recurso _focusNode
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false, //permite elementos aunque no quepan
      body: ModalProgressHUD(
          //ProgressBar
          inAsyncCall: showSpinner, //progressbar
          child: Form(
              key: _globalKey,
              child: Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(
                      height: 20.0,
                    ),
                    Image.asset(
                      'images/logo_circ.png',
                      height: 250,
                      width: 250,
                    ),
                    SizedBox(
                      height: 48.0,
                    ),
                    _showErrorMessage(),
                    _emailField(),
                    SizedBox(
                      height: 18.0,
                    ),
                    _passwordField(),
                    _submitButton(),
                    FlatButton(
                      child: Text(
                        "Olvidé mi contraseña",
                        style: TextStyle(
                            color: Colors.red,
                            fontFamily: "Arial",
                            fontSize: 15.0),
                        textAlign: TextAlign.center,
                      ),
                      onPressed: () {
                        print("Presionado");
                      },
                    ),
                  ],
                ),
              ))),
    );
  }

  Widget _emailField() {
    return AppTextField(
      focusNode: _focusNode, //enfoca el textfield del correo
      controller: _emailController,
      autoValidate: _autoValidate,
      validator: validateEmail,
      inputText: "Ingresar email",
      onSaved: (value) {
        print(_emailController.text);
      },
    );
  }

  Widget _passwordField() {
    return AppTextField(
        controller: _passwordController,
        autoValidate: _autoValidate,
        validator: validatePassword,
        inputText: "Ingresar contraseña",
        obscureText: true,
        onSaved: (value) {
          print(_passwordController.text);
        });
  }

  Widget _submitButton() {
    return AppButton(
        color: Color.fromRGBO(0, 191, 166, 1.0),
        name: "Iniciar sesión",
        onPressed: () async {
          if (_globalKey.currentState.validate()) {
            
            setSpinnerStatus(true);
            var auth = await Authentication().signIn(
                email: _emailController.text,
                password: _passwordController.text);
            if (auth.succes) {
              Navigator.pushNamed(context, '/nav');
              FocusScope.of(context).requestFocus(
                  _focusNode); //al cerrar sesión, regresa al login enfocando el emailTextFormField
              _emailController.text = "";
              _passwordController.text = "";
              

            }else{
              print(auth.errorMessage);
              setState(() {
                _errorMessage = auth.errorMessage;
              });
            }
            setSpinnerStatus(false);
            
          } else {
            setState(() => _autoValidate = true);
          }
        });
  }

  Widget _showErrorMessage(){
    if (_errorMessage.length > 0 && _errorMessage != null) {
      return ErrorMessage(errorMessage: _errorMessage);
    }else{
      return Container(height: 0.0,);
    }
  }
}
