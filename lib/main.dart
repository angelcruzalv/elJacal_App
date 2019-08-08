
import 'package:flutter/material.dart';
import 'package:flutter_app/src/screens/ajustes_screen.dart';
import 'package:flutter_app/src/screens/balance.dart';
import 'package:flutter_app/src/screens/entrada_screen.dart';
import 'package:flutter_app/src/screens/home_screen.dart';
import 'package:flutter_app/src/screens/login_screen.dart';
import 'package:flutter_app/src/screens/registration_screen.dart';
import 'package:flutter_app/src/screens/welcome_screen.dart';
import 'package:flutter_app/src/screens/salida_screen.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
      theme: ThemeData(
          primarySwatch:Colors.red
      ),
      initialRoute: WelcomeScreen.routeName,
      routes: <String, WidgetBuilder>{
        WelcomeScreen.routeName : (BuildContext context) => WelcomeScreen(),
        LoginScreen.routeName: (BuildContext context) => LoginScreen(),
        RegistrationScreen.routeName: (BuildContext context) => RegistrationScreen(),
        HomePage.routeName: (BuildContext context) => HomePage(),
        MyStatefulWidget.routeName: (BuildContext context) => MyStatefulWidget(),
      },
    );
  }
}
//ButtonNavBar

class MyStatefulWidget extends StatefulWidget {
  static const String routeName= '/nav';
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
 final List<Widget> _widgetOptions = <Widget>[
    /*Text(
      'Index 0: Inicio',
      style: optionStyle,
    ), 
    Text(
      'Index 1: Entrada',
      style: optionStyle,
    ),
    Text(
      'Index 2: Salida',
      style: optionStyle,
    ),
    Text(
      'Index 3: Balance',
      style: optionStyle,
    ),
    Text(
      'Index 4: Settings',
      style: optionStyle,
    ),
    */
    HomePage(),
    EntradaScreen(),
    SalidaScreen(),
    BalanceScreen(),
    AjustesScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, //for more than 3 items
        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Inicio'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_downward),
            title: Text('Entrada'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_upward),
            title: Text('Salida'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            title: Text('Balance'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_applications),
            title: Text('Ajustes'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        onTap: _onItemTapped,
      ),
    );
  }
}
