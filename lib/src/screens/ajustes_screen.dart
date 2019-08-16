import 'package:flutter/material.dart';
import 'package:flutter_app/src/services/authentication.dart';

class AjustesScreen extends StatefulWidget {
  @override
  _AjustesScreenState createState() => new _AjustesScreenState();
}

class _AjustesScreenState extends State<AjustesScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: const Text('Configuración'),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          ButtonBar(
            children: <Widget>[
              FlatButton(
                child: Text(
                  "Salir",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Authentication().signOut();
                  Navigator.pushNamed(context, "");
                },
              )
            ],
          ),
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text('1'),
                onTap: () {},
                leading: FlutterLogo(),
              ),
              Divider(
                color: Colors.red,
              ),
              ListTile(
                title: Text('2'),
                onTap: () {},
                leading: FlutterLogo(),
              ),
              Divider(
                color: Colors.red,
              ),
              ListTile(
                title: Text('3'),
                onTap: () {},
                leading: FlutterLogo(),
              ),
              Divider(
                color: Colors.red,
              ),
              ListTile(
                title: Text('4'),
                onTap: () {},
                leading: FlutterLogo(),
              ),
              Divider(
                color: Colors.red,
              ),
              ListTile(
                title: Text('5'),
                onTap: () {},
                leading: FlutterLogo(),
              ),
              Divider(
                color: Colors.red,
              ),
              ListTile(
                title: Text('6'),
                onTap: () {},
                leading: FlutterLogo(),
              ),
              Divider(
                color: Colors.red,
              ),
              ListTile(
                title: Text('7'),
                onTap: () {},
                leading: FlutterLogo(),
              ),
              Divider(
                color: Colors.red,
              ),
              ListTile(
                title: Text('8'),
                onTap: () {},
                leading: FlutterLogo(),
              ),
              Divider(
                color: Colors.red,
              ),
              ListTile(
                title: Text('9'),
                onTap: () {},
                leading: FlutterLogo(),
              ),
              Divider(
                color: Colors.red,
              ),
              ListTile(
                title: Text('10'),
                onTap: () {},
                leading: FlutterLogo(),
              ),
              Divider(
                color: Colors.red,
              ),
              ListTile(
                title: Text('11'),
                onTap: () {},
                leading: FlutterLogo(),
              ),
              Divider(
                color: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
