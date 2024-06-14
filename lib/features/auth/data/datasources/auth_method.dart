import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kasir_app/features/auth/data/models/user_model.dart';

class AuthMethod {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //Register method
  Future register(UserModel user) async {
    String res = 'Some error occurred';
    try {
      if (user.firstName.isNotEmpty &&
          user.lastName.isNotEmpty &&
          user.lastName.isNotEmpty &&
          user.email.isNotEmpty &&
          user.phoneNumber.isNotEmpty &&
          user.password.isNotEmpty) {
        UserCredential credential = await _auth.createUserWithEmailAndPassword(
            email: user.email.toString(), password: user.password.toString());
        String uid = credential.user!.uid;

        final userData = UserModel(
            userId: uid,
            firstName: user.firstName,
            lastName: user.lastName,
            phoneNumber: user.phoneNumber,
            email: user.email,
            role: "user",
            createdAt: DateTime.now(),
            password: user.password);
        await _firestore.collection('users').doc(uid).set(userData.toJson());
        res = 'Success';
      } else {
        res = 'Please enter all the field';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  //Login method
  Future login(String email, String password) async {
    String res = 'Some error occurred';
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = 'Success';
      } else {
        res = 'Please enter all the field';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
