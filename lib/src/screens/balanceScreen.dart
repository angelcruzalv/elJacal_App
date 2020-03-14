import 'package:flutter/material.dart';
import 'package:flutter_app/src/services/authentication.dart';

class BalanceScreen extends StatefulWidget {
  @override
  _BalanceScreenState createState() => new _BalanceScreenState();
 }
class _BalanceScreenState extends State<BalanceScreen> {
  @override
  Widget build(BuildContext context) {
     return new MaterialApp(
      home: Scaffold(
      // backgroundColor: Color(0xFF21BFBD),
          body: Container(
                decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            //Color(0xFF78ffd6),
                            Color(0xff0079991),
                            Color(0xff0079991),
                            Color(0xff007991),
                            Color(0xff007991),
                            Color(0xff0079991),
                            // Color(0xff0079991),
                        // Color(0xFF78ffd6),
                      ],
                    )
                ),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 15.0, left: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 125.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Balance',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 125.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.search),
                          color: Colors.white,
                          onPressed: () {},
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              height: MediaQuery.of(context).size.height - 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35.0),
                      topRight: Radius.circular(35.0))),
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                children: <Widget>[
                 
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}