import 'package:flutter/material.dart';

class AjustesScreen extends StatefulWidget {
  @override
  _AjustesScreenState createState() => new _AjustesScreenState();
}
int _i= 0;
class _AjustesScreenState extends State<AjustesScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: <Color>[
            Color(0xFF78ffd6),
            Color(0xff00791),
          ],
        )), //0xFF21BFBD
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
                        Text(
                          "Ajustes",
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0),
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
                    topRight: Radius.circular(35.0)),
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
                              padding: EdgeInsets.symmetric(vertical: 10.0),
                              children: <Widget>[
                                
                                _cardConf(),
                                _cardConf(),
                                _cardConf(),
                                _cardConf(),
                                _cardConf(),
                                _cardConf(),
                                _cardConf(),
                                                              ],
                                                            ),
                                                          ),
                                                        )),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                    );
                                  }
                                }
                                Widget _cardConf(){
                                  return Container(
                                    padding: EdgeInsets.all(10.0),

                                    child: Card(
                                      color: Colors.transparent,
                                        elevation: 0.0,
                                      child: Column(children: <Widget>[
                                        ListTile(
                                          leading: Icon(Icons.settings),
                                          title: Text("Notificaciones"),
                                          subtitle: Text("Recibir notificaciones acerca de los movimientos en tiempo real"),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: <Widget>[
                                            Switch(
                                            value: true,
                                            )
                                          ],
                                        )
                                      ],),
                                    ),
                                  );
                                }