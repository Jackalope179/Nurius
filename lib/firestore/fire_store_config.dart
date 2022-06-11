import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreConnection {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static FireStoreConnection? instance_;
  static FireStoreConnection? getFireStoreInstance() {
    instance_ = instance_ ??= FireStoreConnection();
    return instance_;
  }

  Stream<QuerySnapshot<Object>> getUser() {
    final arrData = _firestore.collection("users").snapshots();
    return arrData;
  }

  void saveUser(String email, String password, String userName) async {
    var data = {
      "email": email,
      "password": password,
      "userName": userName,
    };
    await _firestore.collection("user").add(data);
  }

  Stream<QuerySnapshot<Object>> getDipersProduct() {
    final arrData = _firestore.collection("diapers").snapshots();
    return arrData;
  }

  Stream<QuerySnapshot<Object>> getfashionProduct() {
    final arrData = _firestore.collection("fashion").snapshots();
    return arrData;
  }

  Stream<QuerySnapshot<Object>> getfurnituresProduct() {
    final arrData = _firestore.collection("furnitures").snapshots();
    return arrData;
  }

  Stream<QuerySnapshot<Object>> getDipers() {
    final arrData = _firestore.collection("diapers").snapshots();
    return arrData;
  }

  Stream<QuerySnapshot<Object>> getProducts() {
    final arrData = _firestore.collection("products").snapshots();
    return arrData;
  }

  Stream<QuerySnapshot<Object>> getSpecialist() {
    final arrData = _firestore.collection("specialists").snapshots();
    return arrData;
  }
}
