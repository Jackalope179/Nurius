import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreConnection {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static FireStoreConnection? instance_;
  static FireStoreConnection? getFireStoreInstance() {
    instance_ = instance_ ??= FireStoreConnection();
    return instance_;
  }

  Stream<QuerySnapshot<Object>> getUser(String email, String password) {
    var user = _firestore
        .collection('user')
        .where('email', isEqualTo: email)
        .where('password', isEqualTo: password)
        .snapshots();

    return user;
  }

  Stream<QuerySnapshot<Object>> getAllUsers() {
    final arrData = _firestore.collection("user").snapshots();
    return arrData;
  }

  void saveUser(String email, String password, String userName) {
    var data = {
      "email": email,
      "password": password,
      "userName": userName,
    };
    _firestore.collection("user").add(data);
  }

  Future<bool> checkExistUser(String email) async {
    var user = await _firestore
        .collection('user')
        .where('email', isEqualTo: email)
        .get();
    if (user.docs.isNotEmpty) {
      return true;
    }
    return false;
  }

  Future<bool> checkExistUserWithpw(String email, String password) async {
    print("check" + email + password);
    var user = await _firestore
        .collection('user')
        .where('email', isEqualTo: email)
        .where('password', isEqualTo: password)
        .get();

    if (user.docs.isNotEmpty) {
      return true;
    } else {
      print("Empty user");
      return false;
    }
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
