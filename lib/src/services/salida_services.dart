import 'package:cloud_firestore/cloud_firestore.dart';
class SalidaService{
  final _firestore= Firestore.instance; 

  void save({String collectionName, Map<String, dynamic> collectionValues}){
    _firestore.collection(collectionName).add(collectionValues);
  }

  Stream<QuerySnapshot> getSalidasStream(){
    return _firestore.collection("salidas").snapshots();
  }
  

}