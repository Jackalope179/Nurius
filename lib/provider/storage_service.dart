import 'package:firebase_storage/firebase_storage.dart' as firbase_storage;

class Storage {
  final firbase_storage.FirebaseStorage storage =
      firbase_storage.FirebaseStorage.instance;

  Future<firbase_storage.ListResult> getFile() async {
    firbase_storage.ListResult results = await storage.ref('images').listAll();
    return results;
  }

  Future<String> downloadURL(String fileName) async {
    String url = await storage.ref('images/$fileName').getDownloadURL();
    return url;
  }
}
