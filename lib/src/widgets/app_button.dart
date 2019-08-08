import 'package:flutter/material.dart';


class AppButton extends StatelessWidget {

  final MaterialAccentColor color;
  final VoidCallback onPressed;
  final String name;

  const AppButton({this.color, this.name, this.onPressed});


  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: Material(
        child: SizedBox(
            height: 50,
            //color: color,
            // borderRadius: BorderRadius.circular(30.0),
            child: FlatButton(

              color: color,
              child: Text(name, style: TextStyle(color: Colors.white),),
              // borderSide: BorderSide(color: color),
              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
              onPressed: onPressed,
            )
        ),
      ),

    );
  }
}


  
