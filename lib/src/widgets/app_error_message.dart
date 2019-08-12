import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  final String errorMessage;

  ErrorMessage({this.errorMessage});
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      errorMessage,
      style: TextStyle(
          fontSize: 15.0,
          color: Colors.red,
          height: 1.0,
          fontWeight: FontWeight.w300),
    ));
  }
}
