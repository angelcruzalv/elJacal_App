import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter_app/src/services/salida_services.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/widgets/app_button.dart';
import 'package:flutter_app/src/widgets/app_textfield.dart';

class AddSalidaScreen extends StatefulWidget {
  static const String routeName = "\addSalida";
  @override
  AddSalidaScreenState createState() => AddSalidaScreenState();
}

class AddSalidaScreenState extends State<AddSalidaScreen> {
  TextEditingController _valorController = TextEditingController();
  TextEditingController _descripcionController = TextEditingController();
  var _currencies = ['Combustible', 'Mantenimiento', 'Sueldos', 'Prueba'];
  var _currentItemSelected;
  final format = DateFormat('dd-MM-yyyy');
  @override
  
  Widget build(BuildContext context) {
    // _currentItemSelected = _currencies[0];
     return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(0, 191, 166, 1.0),
          automaticallyImplyLeading: true,
          title: Text("Agregar salida", style: TextStyle(color: Colors.white),),
          actions: <Widget>[
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: Text(
                    "Guardar",
                    style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1.0)),
                  ),
                  onPressed: () {},
                )
              ],
            )
          ],
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
                         print(_currentItemSelected);
                        }
                      );
                      _currentItemSelected = _currentItemSelected;
                        
                      },
                      value: _currentItemSelected,
                      elevation: 1,
                    ), 
                  ],
                ),
    
                SizedBox(
                  height: 28.0,
                ),
                _descripcion(),
                SizedBox(
                  height: 28.0,
                ),
                _valor(),
                SizedBox(
                  height: 28.0,
                ),
                //Text('Ingresar fecha'),
                DateTimeField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    hintText: 'Selecciona la fecha',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0))),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        borderSide:
                            BorderSide(color: Color.fromRGBO(0, 191, 166, 1.00), width: 2)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        borderSide:
                            BorderSide(color: Color.fromRGBO(255, 149, 0, 1.0), width: 2)),
                  ),
                  format: format,
                  onShowPicker: (context, currentValue) {
                    return showDatePicker(
                      
                      context: context,
                      firstDate: DateTime(1900),
                      initialDate: currentValue ?? DateTime.now(),
                      lastDate: DateTime(2100),
                    );
                  },
                ),
                SizedBox(
                  height: 28.0,
                ),
                _buttonSave(),
               
                _buttonCancel(),
              ]),
        )
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
        SalidaService().save(
          collectionName:"salidas",
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
              child: Text("Cancelar", style: TextStyle(color: Color.fromRGBO(192, 0, 25, 1.0), fontFamily: "Arial", fontSize: 15.0), textAlign:TextAlign.center,),
              onPressed: (){
                Navigator.pop(context);
                print("Presionado");
              },
            );
  }
}
