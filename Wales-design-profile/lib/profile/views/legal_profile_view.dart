import 'dart:io';
import 'dart:typed_data';

import 'package:app/constants/app_colors.dart';
import 'package:app/constants/typography.dart';
import 'package:app/models/legal_profile_model.dart';
import 'package:app/profile/views/signature_view.dart';
import 'package:app/widgets/custom_buttons.dart';
import 'package:app/widgets/custom_text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signature/signature.dart';

class LegalProfileView extends StatefulWidget {
  const LegalProfileView({Key? key}) : super(key: key);

  @override
  _LegalProfileViewState createState() => _LegalProfileViewState();
}

class _LegalProfileViewState extends State<LegalProfileView> {
  late Future<Map<String, dynamic>?>
      userDataFuture; // Initialize _pickedFile as PickedFile or null
  bool isEditProfile = false;
  bool isLoading = false;
  LegalProfileModel legalProfileModel = LegalProfileModel.empty();
  final legalIdController = TextEditingController();
  final signaturePathController = TextEditingController();
  final idPathController = TextEditingController();

  @override
  void initState() {
    getPersonalProfileData();
    super.initState();
    // userDataFuture = getUserData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void getPersonalProfileData() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final userId = prefs.getString('userId');
      if (userId == null) return;
      final userData = await FirebaseFirestore.instance
          .collection('legal')
          .doc(userId)
          .get();
      if (userData.exists) {
        setState(() {
          legalProfileModel = LegalProfileModel.fromFirestore(userData);
          legalIdController.text = legalProfileModel.legalId;
          signaturePathController.text = legalProfileModel.signaturePath;
          idPathController.text = legalProfileModel.idPath;
        });
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  XFile? _idCard;
  XFile? get idCard => _idCard;
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  Future<void> _getIdCard(ImageSource source) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? id = prefs.getString('userId');
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      _idCard = XFile(pickedFile.path);
      setState(() {});
      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
          .ref('IdCards/idCard${id.toString()}.jpg');
      firebase_storage.UploadTask uploadTask =
          ref.putFile(File(_idCard!.path).absolute);
      await Future.value(uploadTask);
      final newurl = await ref.getDownloadURL();
      idPathController.text = newurl;
    } else {
      print('No image selected.');
    }
  }

  Uint8List? _signature;
  Uint8List? get signature => _signature;
  final SignatureController signatureController = SignatureController();
  Future<void> _getSignature() async {
    var id = DateTime.now().millisecondsSinceEpoch;
    _signature = await Get.to(() => SignatureView());
    // setState(() {
    if (_signature != null) {
      setState(() {});
      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
          .ref('Signatures/idsigture${id.toString()}.jpg');
      firebase_storage.UploadTask uploadTask = ref.putData(_signature!);
      await Future.value(uploadTask);
      final newurl = await ref.getDownloadURL();
      signaturePathController.text = newurl;
    } else {
      print('No image selected.');
    }
    // });
  }

  Widget uploadWidget(String title, String imagePath, VoidCallback onTap,
      {XFile? pickedImages}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: idPathController.text.isNotEmpty
            ? Image.network(
                idPathController.text,
                width: Get.width,
                height: 180,
                fit: BoxFit.fill,
              )
            : pickedImages != null
                ? Container(
                    width: Get.width,
                    height: 180,
                    decoration: BoxDecoration(
                        // color: ColorManager.kLightBlueColor,
                        border:
                            Border.all(color: Colors.black.withOpacity(0.2)),
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image:
                                FileImage(File(pickedImages.path).absolute))),
                  )
                : SizedBox(
                    width: Get.width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(title,
                              style: poppinsRegular.copyWith(
                                  fontSize: 16,
                                  color: Colors.black.withOpacity(0.6))),
                          SizedBox(height: 20),
                          SvgPicture.asset(
                            imagePath,
                          )
                        ],
                      ),
                    ),
                  ),
      ),
    );
  }

  Widget uploadUinlist8Widget(
      String title, String imagePath, VoidCallback onTap,
      {Uint8List? pickedImages}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: signaturePathController.text.isNotEmpty
            ? Image.network(
                signaturePathController.text,
                width: Get.width,
                height: 180,
                fit: BoxFit.fill,
              )
            : pickedImages != null
                ? Container(
                    width: Get.width,
                    height: 180,
                    decoration: BoxDecoration(
                        // color: ColorManager.kLightBlueColor,
                        border:
                            Border.all(color: Colors.black.withOpacity(0.2)),
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: MemoryImage(pickedImages))),
                  )
                : Container(
                    width: Get.width,
                    decoration: BoxDecoration(
                        // color: ColorManager.kLightBlueColor,
                        border:
                            Border.all(color: Colors.black.withOpacity(0.2)),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(title,
                              style: poppinsRegular.copyWith(
                                  fontSize: 16,
                                  color: Colors.black.withOpacity(0.6))),
                          const SizedBox(height: 20),
                          SvgPicture.asset(
                            imagePath,
                          )
                        ],
                      ),
                    ),
                  ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back_ios_new),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Your Profile',
                      style: poppinsMedium.copyWith(fontSize: 18),
                    ),
                  ],
                ),
                const SizedBox(height: 35),
                const SizedBox(height: 18),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isEditProfile = !isEditProfile;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.edit,
                        size: 17,
                        color: isEditProfile
                            ? AppColors.black2.withOpacity(0.6)
                            : AppColors.redColor2,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        isEditProfile ? 'cancel' : 'Edit Profile',
                        style: poppinsRegular.copyWith(
                          fontSize: 15,
                          color: AppColors.black2.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Legal ID',
                          style: poppinsRegular.copyWith(fontSize: 18)),
                      CustomTextField(
                        controller: legalIdController,
                        prefixIcon: '',
                        readOnly: !isEditProfile,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                uploadWidget('Upload Id', "assets/idCard.svg", () {
                  _getIdCard(ImageSource.gallery);
                }, pickedImages: idCard),
                const SizedBox(height: 40),
                uploadUinlist8Widget("Draw Sugnature", "assets/idCard.svg", () {
                  _getSignature();
                }, pickedImages: signature),
                const SizedBox(height: 20),
                isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : PrimaryButton(
                        onTap: () async {
                          if (isEditProfile) {
                            setState(() {
                              isLoading = true;
                            });
                            try {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              final userId = prefs.getString('userId');
                              if (userId == null) return;
                              LegalProfileModel model = LegalProfileModel(
                                legalId: legalIdController.text,
                                signaturePath: signaturePathController.text,
                                idPath: idPathController.text,
                                address: '',
                                age: '',
                                nationality: '',
                              );
                              await FirebaseFirestore.instance
                                  .collection('legal')
                                  .doc(userId)
                                  .set({
                                'userId': userId,
                                'legalId': model.legalId,
                                'signaturePath': model.signaturePath,
                                'idPath': model.idPath,
                                'address': model.address,
                                'age': model.age,
                                'nationality': model.nationality,
                              });
                              setState(() {
                                isLoading = false;
                                isEditProfile = false;
                              });
                              Get.snackbar(
                                  'Success', 'Profile Updated Successfully');
                            } catch (e) {
                              setState(() {
                                isLoading = false;
                              });
                              Get.snackbar('Error', e.toString());
                            }
                          }else{
                           Get.snackbar('Alert', "Edit first");
                          }
                        },
                        width: 200,
                        title: 'SAVE CHANGES',
                        borderRadius: 60,
                        textStyle: poppinsBold.copyWith(
                            fontSize: 16, color: Colors.white),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
