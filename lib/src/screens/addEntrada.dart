import 'package:flutter/material.dart';
import 'package:flutter_app/src/services/entrada_services.dart';
import 'package:flutter_app/src/widgets/app_button.dart';
import 'package:flutter_app/src/widgets/app_textfield.dart';

class AddEntradaScreen extends StatefulWidget {
  static const String routeName = "\addEntrada";
  @override
  _AddEntradaScreenState createState() => new _AddEntradaScreenState();
}

class _AddEntradaScreenState extends State<AddEntradaScreen> {
  TextEditingController _valorController = TextEditingController();
  TextEditingController _descripcionController = TextEditingController();

  var _currencies = ['Ventas'];
  var _currentItemSelected;

  @override
  Widget build(BuildContext context) {
    _currentItemSelected = _currencies[0];
    return new Scaffold(
      appBar: AppBar(
        title: Text('Agregar Entrada'),
        backgroundColor: Color.fromRGBO(0, 191, 166, 1.0),
      ),
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 18.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Departamento: ",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  width: 20.0,
                ),
                DropdownButton<String>(
                  items: _currencies.map((String dropDownStringItem) {
                    return DropdownMenuItem<String>(
                      value: dropDownStringItem,
                      child: Text(dropDownStringItem),
                    );
                  }).toList(),
                  onChanged: (String newValueSelected) {
                    setState(() {
                      this._currentItemSelected = newValueSelected;
                      // item = _currentItemSelected;
                    });
                  },
                  value: _currentItemSelected,
                  elevation: 1,
                ),
              ],
            ),
            SizedBox(
              height: 18.0,
            ),
            _descripcion(),
            SizedBox(
              height: 18.0,
            ),
            _valor(),
            SizedBox(
              height: 18.0,
            ),
            _buttonSave(),
            SizedBox(
              height: 18.0,
            ),
            _buttonCancel()
          ],
        ),
      ),
    );
  }

  Widget _descripcion() {
    return AppTextField(
      textType: TextInputType.text,
      controller: _descripcionController,
      inputText: 'Descripción',
      autoValidate: false,
      onSaved: (value) {
        print(_descripcionController.text);
      },
    );
  }

  Widget _valor() {
    return AppTextField(
      textType: TextInputType.number,
      inputText: "Costo ",
      autoValidate: false,
      controller: _valorController,
      onSaved: (value) {
        print(_valorController.text);
      },
    );
  }

  Widget _buttonSave() {
    return AppButton(
      color: Color.fromRGBO(192, 0, 25, 1.0),
      name: 'Guardar',
      onPressed: () {
        EntradaService().save(
          collectionName:"entradas",
          collectionValues:{
            'departamento': _currentItemSelected,
            'descripcion': _descripcionController.text,
            'valor': int.parse(_valorController.text),
          }
        );
        Navigator.pop(context);
      },
    );
  }

  Widget _buttonCancel() {
    return FlatButton(
      child: Text(
        "Cancelar",
        style: TextStyle(
            color: Color.fromRGBO(192, 0, 25, 1.0),
            fontFamily: "Arial",
            fontSize: 15.0),
        textAlign: TextAlign.center,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
