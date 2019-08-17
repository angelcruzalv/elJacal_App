import 'package:flutter/material.dart';
import 'package:flutter_app/src/services/authentication.dart';
import 'package:flutter_app/src/services/entrada_services.dart';
import 'package:flutter_app/src/services/salida_services.dart';


class SalidaScreen extends StatefulWidget {
  @override
  _SalidaScreenState createState() => new _SalidaScreenState();
 }
class _SalidaScreenState extends State<SalidaScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getSalidas();
  }

  void _getSalidas() async{
    await for (var snapshot in SalidaService().getSalidasStream()) {
      for (var salida in snapshot.documents) {
        print(salida.data);
      }
      
    }
  }
  Widget build(BuildContext context) {
   return new Scaffold(
     appBar: AppBar(
        title: const Text('Salidas'),
         automaticallyImplyLeading: false,
         actions: <Widget>[
          ButtonBar(children: <Widget>[
            FlatButton(
              child: Text("Salir", style: TextStyle(color: Colors.white),),
              onPressed: (){
                Authentication().signOut();
                Navigator.pushNamed(context, "");
              },
            )
          ],),
        ],
      ),
      body: Column(
        children: <Widget>[
          StreamBuilder(
            stream: SalidaService().getSalidasStream(),
            builder: (context, snapshot){
              if (snapshot.hasData) {
                var salidas = snapshot.data.documents;
                //List<Text> salidaWidgets = [];
                List<SalidaItem> salidaItems = [];
                for (var salida in salidas) {
                  final salidaDpto = salida.data["departamento"];
                  final salidaDesc = salida.data["descripcion"];
                  final salidaFecha = salida.data["fecha"];
                  final salidaTotal = salida.data["total"];
                  final salidaValor = salida.data["valor"];
                  //salidaWidgets.add(Text('$salidaDpto , Descripción: $salidaDesc , Fecha: $salidaFecha , Total: $salidaTotal , Valor: $salidaValor'));
                  salidaItems.add(SalidaItem(departamento: salidaDpto, descripcion: salidaDesc));
                }
                   
                    return Flexible(
                    child: Card(
                      child: ListView(
                        children: salidaItems,
                      ),
                    )
                  );
                
              }
            }
          ),
        ],
      )
           
    
   );
  }
  
}
class SalidaItem extends StatelessWidget {
  final String departamento;
  final String descripcion;
 /* final String fecha;
  final String total;
  final String valor; */

  SalidaItem({this.departamento, this.descripcion});
 @override
 Widget build(BuildContext context) {
  return ListTile(
      leading: CircleAvatar(child: Text("A"),),
      title: Text(departamento),
      subtitle: Text(descripcion),
      isThreeLine: true,
      contentPadding: EdgeInsets.all(10.0),           
      trailing: Icon(Icons.expand_more),
      onTap: (){},
    );
 
 }
}