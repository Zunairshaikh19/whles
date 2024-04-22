import 'package:cloud_firestore/cloud_firestore.dart';

class PublicProfileModel {
  String id;
  String firstName;
  String lastName;
  String phoneNo;
  String role;
  String email;
  String profileUrl;
  PublicProfileModel(
    this.id,
    this.firstName,
    this.lastName,
    this.phoneNo,
    this.role,
    this.email,
    this.profileUrl,
  );
  factory PublicProfileModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return PublicProfileModel(
      doc.id,
      data['firstName'] ?? "",
      data['lastName'] ?? "",
      data['phoneNo'] ?? "",
      data['role'] ?? "",
      data['email'] ?? "",
      data['profileUrl'] ?? "",
    );
  }

  static Future<PublicProfileModel?> getPublicProfile(String id) async {
    try {
      return FirebaseFirestore.instance
          .collection('profile')
          .doc(id)
          .get()
          .then((value) {
        if (value.exists) {
          return PublicProfileModel.fromFirestore(value);
        } else {
          return null;
        }
      });
    } catch (e) {
      return null;
    }
  }
}
