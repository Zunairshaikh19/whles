import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class PublicProfileModel {
  String id = '';
  String firstName = '';
  String lastName = '';
  String phoneNo = '';
  String age = '';
  String gender = '';
  String address = '';
  String nationality = '';
  String role = '';
  String email = '';
  String profileUrl = '';
  PublicProfileModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNo,
    required this.age,
    required this.gender,
    required this.address,
    required this.nationality,
    required this.role,
    required this.email,
    required this.profileUrl,
  });
  
 
  factory PublicProfileModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return PublicProfileModel(
      id: doc.id,
      firstName:  data['firstName'] ?? "",
      lastName:  data['lastName'] ?? "",
      phoneNo:  data['phoneNo'] ?? "",
      age:  data['age'] ?? "",
      address:  data['address'] ?? "",
      gender:  data['gender'] ?? "",
      nationality:  data['nationality'] ?? "", 
      role:  data['role'] ?? "",
      email:  data['email'] ?? "",
      profileUrl:  data['profileUrl'] ?? "",
    );
  }

  static Future<PublicProfileModel?> getPublicProfile(String id) async {
    try {
      return FirebaseFirestore.instance
          .collection('users')
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

  static Future<void> addPublicProfile(PublicProfileModel publicProfile) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(publicProfile.id)
          .set({
        'firstName': publicProfile.firstName,
        'lastName': publicProfile.lastName,
        'phoneNo': publicProfile.phoneNo,
        'age': publicProfile.age,
        'address': publicProfile.address,
        'gender': publicProfile.gender,
        'national': publicProfile.nationality,
        'role': publicProfile.role,
        'email': publicProfile.email,
        'profileUrl': publicProfile.profileUrl,
      });
    } catch (e) {
      Get.snackbar('Error', '$e');
    }
  }
        
}
