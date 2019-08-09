import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {

  final String inputText;
  final ValueChanged<String> onSaved;
  final bool obscureText ;

  const AppTextField({this.inputText, this.onSaved, this.obscureText});

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        hintText: inputText,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0))
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
            borderSide: BorderSide(color: Colors.red[200], width: 2)
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
            borderSide: BorderSide(color: Colors.red[400], width: 2)
        ),


      ),
      onSaved: onSaved,
      textAlign: TextAlign.center,
      obscureText: obscureText == null ? false: obscureText,

    );
  }
}