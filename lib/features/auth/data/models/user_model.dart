import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? userId;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String? role;
  final DateTime? createdAt;
  final String password;

  UserModel(
      {this.userId,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.phoneNumber,
      this.role,
      this.createdAt,
      required this.password});

  static UserModel fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return UserModel(
        userId: snapshot['user_id'],
        firstName: snapshot['last_name'],
        lastName: snapshot['first_name'],
        email: snapshot['email'],
        phoneNumber: snapshot['phone_number'],
        role: snapshot['role'],
        createdAt: snapshot['created_at'],
        password: snapshot['password']);
  }

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "last_name": lastName,
        "first_name": firstName,
        "email": email,
        "phone_number": phoneNumber,
        "role": role,
        "created_at": createdAt?.toIso8601String(),
        "password": password
      };
}
