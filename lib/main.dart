import 'package:flutter/material.dart';
import 'package:flutter_app/src/screens/addEntrada.dart';
import 'package:flutter_app/src/screens/addSalida.dart';
import 'package:flutter_app/src/screens/ajustes_screen.dart';
import 'package:flutter_app/src/screens/balanceScreen.dart';
import 'package:flutter_app/src/screens/entrada_screen.dart';
import 'package:flutter_app/src/screens/home_screen.dart';
import 'package:flutter_app/src/screens/login_screen.dart';
import 'package:flutter_app/src/screens/registration_screen.dart';
import 'package:flutter_app/src/screens/welcome_screen.dart';
import 'package:flutter_app/src/screens/salida_screen.dart';
//Favor de leer todos los comentarios, para que puedas entender cómo
//funciona esta aplicación
//si tienes dudas puedes llamar a Ángel C. al 4521129745

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: MyStatefulWidget(),
      theme: ThemeData(
        primaryColor: Color.fromRGBO(237, 64, 60, 1.0),
      ),
      //Main es el archivo que se lee antes de iniciar la aplicación
      //aquí se agregan todas las páginas consu respectiva ruta, el initialRoute es
      //la página que inicia al iniciar la aplicación
      //la ruta inicial es WelcomeScreen,
      initialRoute: WelcomeScreen.routeName,
      routes: <String, WidgetBuilder>{
        WelcomeScreen.routeName: (BuildContext context) => WelcomeScreen(),
        LoginScreen.routeName: (BuildContext context) => LoginScreen(),
        RegistrationScreen.routeName: (BuildContext context) =>
            RegistrationScreen(),
        HomePage.routeName: (BuildContext context) => HomePage(),
        MyStatefulWidget.routeName: (BuildContext context) =>
            MyStatefulWidget(),
        AddSalidaScreen.routeName: (BuildContext context) => AddSalidaScreen(),
        AddEntradaScreen.routeName: (BuildContext context) =>
            AddEntradaScreen(),
      },
    );
  }
}
//ButtonNavBar

class MyStatefulWidget extends StatefulWidget {
  static const String routeName = '/nav';
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _widgetOptions = <Widget>[
    //se ponen las diferentes Screen, en el orden deseado
    //para acceder desde la barra de navegación
    //Cómo crear un ButtonNavigarorBar
    //https://api.flutter.dev/flutter/material/BottomNavigationBar-class.html
    HomePage(),
    EntradaScreen(),
    SalidaScreen(),
    // BalanceScreen(),
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
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.attach_money),
          //   title: Text('Balance'),
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_applications),
            title: Text('Ajustes'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromRGBO(0, 191, 166, 1.0),
        onTap: _onItemTapped,
      ),
    );
  }
}
