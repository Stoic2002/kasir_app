import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

import 'package:kasir_app/features/home/data/models/product_new_model.dart';

class FirebaseRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final uid = FirebaseAuth.instance.currentUser!.uid;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // Add Product
  Future<void> addProduct(String categoryName, String name, String description,
      String imageUrl, int price, DateTime createdAt) async {
    final col = _firestore.collection('products');
    final doc = col.doc();

    ProductNewModel product = ProductNewModel(
        id: doc.id,
        categoryName: categoryName,
        name: name,
        description: description,
        imageUrl: imageUrl,
        price: price,
        created_at: createdAt);

    await _firestore.collection('products').doc(doc.id).set(product.toMap());
  }

  // Add image to storage
  Future<String> uploadImageToStorage(XFile image) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();

    Reference referenceRoot = _storage.ref();
    Reference referenceDir = referenceRoot.child('products');
    Reference referenceImageUpload = referenceDir.child(fileName);

    try {
      await referenceImageUpload.putFile(File(image.path));
      return await referenceImageUpload.getDownloadURL();
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return '';
    }
  }

  // Delete previous image
  void deletePreviousPhoto(String previousImageUrl) async {
    if (previousImageUrl.isNotEmpty) {
      final storageRef = FirebaseStorage.instance.refFromURL(previousImageUrl);
      await storageRef.delete();
    }
  }

//get list product
  Stream<List<ProductNewModel>> getListProduct() {
    return _firestore.collection('products').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

        return ProductNewModel(
            id: doc.id,
            categoryName: data['category_name'],
            name: data['name'],
            description: data['description'],
            imageUrl: data['imageUrl'],
            price: data['price'],
            created_at: data['created_at']);
      }).toList();
    });
  }

  //get list product by category
  Stream<List<ProductNewModel>> getListFood() {
    return _firestore
        .collection('products')
        .where('categoryName', isEqualTo: 'makanan')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

        return ProductNewModel(
          id: doc.id,
          categoryName: data['categoryName'],
          name: data['name'],
          description: data['description'],
          imageUrl: data['imageUrl'],
          price: data['price'],
          created_at: (data['created_at'] as Timestamp).toDate(),
        );
      }).toList();
    });
  }

  //get list product by category
  Stream<List<ProductNewModel>> getListDrink() {
    return _firestore
        .collection('products')
        .where('categoryName', isEqualTo: 'minuman')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

        return ProductNewModel(
          id: doc.id,
          categoryName: data['categoryName'],
          name: data['name'],
          description: data['description'],
          imageUrl: data['imageUrl'],
          price: data['price'],
          created_at: (data['created_at'] as Timestamp).toDate(),
        );
      }).toList();
    });
  }

  //search product
  Stream<List<ProductNewModel>> searchProducts(String query) {
    final queryLowerCase = query.toLowerCase();
    return _firestore
        .collection('products')
        .where('name', isGreaterThanOrEqualTo: query)
        .where('name', isLessThanOrEqualTo: '$query\uf8ff')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

        return ProductNewModel(
          id: doc.id,
          categoryName: data['categoryName'],
          name: data['name'],
          description: data['description'],
          imageUrl: data['imageUrl'],
          price: data['price'],
          created_at: (data['created_at'] as Timestamp).toDate(),
        );
      }).toList();
    });
  }
}
