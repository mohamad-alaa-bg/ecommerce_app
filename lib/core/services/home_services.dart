import 'package:cloud_firestore/cloud_firestore.dart';

class HomeServices {
  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('Categories');

  final CollectionReference _productsCollectionReference =
      FirebaseFirestore.instance.collection('Products');

  Future<List<QueryDocumentSnapshot>> getCategory() async {
    var value = await _collectionReference.get();
    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getBestSellingProducts() async {
    var value = await _productsCollectionReference.get();
    return value.docs;
  }
}
