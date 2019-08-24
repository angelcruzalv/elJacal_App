import 'package:cloud_firestore/cloud_firestore.dart';
class EntradaService{
  final _firestore= Firestore.instance; 

  void save({String collectionName, Map<String, dynamic> collectionValues}){
    _firestore.collection(collectionName).add(collectionValues);
  }
  Stream<QuerySnapshot> getEntradasStream(){
    return _firestore.collection("entradas").snapshots();
  }
}