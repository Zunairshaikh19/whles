import 'package:cloud_firestore/cloud_firestore.dart';

class EstateAgentProfileModel {
  String id;
  String companyName;
  String companyLogo;
  String companyWebsite;
  String role;
  String email;
  String profileUrl;
  EstateAgentProfileModel(
    this.id,
    this.companyName,
    this.companyLogo,
    this.companyWebsite,
    this.role,
    this.email,
    this.profileUrl,
  );
  factory EstateAgentProfileModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return EstateAgentProfileModel(
      doc.id,
      data['companyName'] ?? "",
      data['companyLogo'] ?? "",
      data['companyWebsite'] ?? "",
      data['role'] ?? "",
      data['email'] ?? "",
      data['profileUrl'] ?? "",
    );
  }

  static Future<EstateAgentProfileModel?> getPublicProfile(String id) async {
    try {
      return FirebaseFirestore.instance
          .collection('profile')
          .doc(id)
          .get()
          .then((value) {
        if (value.exists) {
          return EstateAgentProfileModel.fromFirestore(value);
        } else {
          return null;
        }
      });
    } catch (e) {
      return null;
    }
  }
}
