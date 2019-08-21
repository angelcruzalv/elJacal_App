import 'package:cloud_firestore/cloud_firestore.dart';
class EntradaService{
  final _firestore= Firestore.instance; 

  void save({String collectionName, Map<String, dynamic> collectiosValues}){
    _firestore.collection(collectionName).add(collectiosValues);
  }
  Stream<QuerySnapshot> getEntradasStream(){
    return _firestore.collection("entradas").snapshots();
  }
}