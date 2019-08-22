import 'package:flutter/material.dart';
import 'package:flutter_app/src/mixins/validation_mixins.dart';
import 'package:flutter_app/src/widgets/app_button.dart';
import 'package:flutter_app/src/widgets/app_error_message.dart';
import 'package:flutter_app/src/widgets/app_textfield.dart';
import 'package:flutter_app/src/services/authentication.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  static const String routeName = '/registration';
  @override
  _RegistrationScreenState createState() => new _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen>
    with ValidationMixins {
  bool showSpinner = false;
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>(); //validar
  bool _autoValidate = false;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String _errorMessage = "";
  void setSpinnerStatus(bool status) {
    setState(() {
      showSpinner = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        body: ModalProgressHUD(
            inAsyncCall: showSpinner,
            child: Form(
              key: _globalKey,
              child: Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(
                      height: 48.0,
                    ),
                    Image.asset(
                      'images/logo_circ.png',
                      height: 250,
                      width: 250,
                    ),
                    SizedBox(
                      height: 18.0,
                    ),
                    _showErrorMessage(),
                    _emailField(),
                    SizedBox(height: 18.0,),
                    _passwordField(),
                    _submitButton(),
                    _cancelButton(),
                  ],
                ),
              ),
            )));
  }

  Widget _emailField() {
    return AppTextField(
      controller: _emailController,
      autoValidate: _autoValidate,
      validator: validateEmail,
      inputText: "Ingresar email",
      onSaved: (value) {},
    );
  }

  Widget _passwordField() {
    return AppTextField(
        controller: _passwordController,
        autoValidate: _autoValidate,
        validator: validatePassword,
        inputText: "Ingresar contraseña",
        obscureText: true,
        onSaved: (value) {}
      );
  }

  Widget _submitButton() {
    return AppButton(
        color: Color.fromRGBO(163, 33, 142, 1.0),
        name: "Registrar",
        onPressed: () async {
          if (_globalKey.currentState.validate()) {
            setSpinnerStatus(true);
            var auth = await Authentication().createUser(
                email: _emailController.text,
                password: _passwordController.text);
            if (auth.succes) {
              Navigator.pushNamed(context, '/nav');
              _emailController.text = "";
              _passwordController.text = "";
            }else {
              print(auth.errorMessage);
              setState(() {
               _errorMessage = auth.errorMessage ;
              });
            }
            setSpinnerStatus(false);
          } else {
            setState(() => _autoValidate = true);
          }
        });
  }

  Widget _cancelButton() {
    return AppButton(
      color: Color.fromRGBO(237, 64, 60, 1.0),
      name: "Cancelar",
      onPressed: () {},
    );
  }

  Widget _showErrorMessage() {
    if (_errorMessage.length > 0 && _errorMessage != null) {
      return ErrorMessage(errorMessage: _errorMessage);
    } else {
      return Container(
        height: 0.0,
      );
    }
  }
}
