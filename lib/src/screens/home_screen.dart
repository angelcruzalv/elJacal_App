import 'package:flutter/material.dart';
import 'package:flutter_app/src/services/authentication.dart';
class HomePage extends StatefulWidget {
  static const String routeName= '/home';
  @override
  _HomePageState createState() => new _HomePageState();
 }
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
    home: Scaffold(
      body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            Color(0xff007991),
            Color(0xFF78ffd6),
           ],
       )
      ),    //0xFF21BFBD
       child: ListView(
         children: <Widget>[
           Padding(
             padding: EdgeInsets.only(top: 15.0, left: 10.0),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: <Widget>[
                 Container(
                   width: 125,
                      child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Inicio",
                        style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0 ),
                        ),
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
                          onPressed: (){},
                        )
                      ],
                    ),
                  )
               ],
             ),
           ), 
          // SizedBox(height: 5.0,),
        /*   Padding(
             padding: EdgeInsets.only(top: 15.0 ,left: 40.0),
             child: Row(
               children: <Widget>[
                 Text("Inicio",
                 style: TextStyle(
                   fontFamily: 'Montserrat',
                   color: Colors.white,
                   fontWeight: FontWeight.bold,
                   fontSize: 25.0 ),
                ),
                 SizedBox(width: 10.0),
                 Text("",
                 style: TextStyle(
                   fontFamily: 'Montserrat',
                   color: Colors.white,
                   fontWeight: FontWeight.bold,
                   fontSize: 25.0 ),
                ),
               ],
             ),
           ),*/
           SizedBox(height: 15.0,),
           Container(
             height: MediaQuery.of(context).size.height-50,
             width: MediaQuery.of(context).size.width,
             decoration: BoxDecoration(
               color: Colors.white,
               borderRadius: BorderRadius.only(topLeft: Radius.circular(35.0), topRight: Radius.circular(35.0)),
             ),
             child: ListView(
               primary: false,
               //padding: EdgeInsets.only(left: 5.0, right: 5.0),
               children: <Widget>[
                 Padding(
                   padding: EdgeInsets.only(top: 0.0),
                   child: Container(
                     height: MediaQuery.of(context).size.height - 145.0,
                     width: MediaQuery.of(context).size.width,
                     child: ScrollConfiguration(
                       //Cambia el color del final del scroll del listview
                       behavior: ScrollBehavior(),
                       child: GlowingOverscrollIndicator(
                         axisDirection: AxisDirection.down,
                         color: Color(0xFF78ffd6), 
                          child: ListView(
                           children: <Widget>[
                           
                         
                       ],
                     ),
                   ), 
                  )



                   ),
                 ),
                 
               ],
             ),
           ),
         ],
       ),  )
     ),
    );
  }
}

