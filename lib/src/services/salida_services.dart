import 'package:cloud_firestore/cloud_firestore.dart';
class SalidaService{
  final _firestore= Firestore.instance; 

  void save({String collectionName, Map<String, dynamic> collectiosValues}){
    _firestore.collection(collectionName).add(collectiosValues);
  }
}