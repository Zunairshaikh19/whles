import 'package:cloud_firestore/cloud_firestore.dart';

class LegalProfileModel {
  String legalId = '';
  String signaturePath = '';
  String idPath = '';
  String address = '';
  String age = '';
  String nationality = '';
  String gender = '';

  LegalProfileModel(
      {required this.legalId,
      required this.signaturePath,
      required this.idPath,
      required this.address,
      required this.age,
      required this.nationality});

  LegalProfileModel.empty();

  factory LegalProfileModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return LegalProfileModel(
      legalId: data['legalId'] ?? "",
      signaturePath: data['signaturePath'] ?? "",
      idPath: data['idPath'] ?? "",
      address: data['address'] ?? "",
      age: data['age'] ?? "",
      nationality: data['nationality'] ?? "",
    );
  }

  static Future<LegalProfileModel?> getLegalProfile(String id) async {
    try {
      return FirebaseFirestore.instance
          .collection('legal')
          .doc(id)
          .get()
          .then((value) {
        if (value.exists) {
          return LegalProfileModel.fromFirestore(value);
        } else {
          return null;
        }
      });
    } catch (e) {
      return null;
    }
  }

  static Future<bool> updateLegalProfile(LegalProfileModel model) async {
    try {
      await FirebaseFirestore.instance
          .collection('legal')
          .doc(model.legalId)
          .set({
        'legalId': model.legalId,
        'signaturePath': model.signaturePath,
        'idPath': model.idPath,
        'address': model.address,
        'age': model.age,
        'nationality': model.nationality,
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<void> addLegalProfile(LegalProfileModel legalProfile) async {
    try {
      await FirebaseFirestore.instance
          .collection('legal')
          .doc(legalProfile.legalId)
          .set({
        'legalId': legalProfile.legalId,
        'signaturePath': legalProfile.signaturePath,
        'idPath': legalProfile.idPath,
        'address': legalProfile.address,
        'age': legalProfile.age,
        'nationality': legalProfile,
      });
    } catch (e) {
      print(e);
    }
  }
}
