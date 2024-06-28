import 'package:app/app_theme.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/attachment_model.dart';
import 'models/drop_down_menu_data.dart';

class Constants {
  static Size imageSize = const Size(500, 500);
  static SharedPreferences? prefs;
  static int imageQuality = 100;
  static final regexForFileName = RegExp(r'^[A-Za-z][A-Za-z0-9_]*$');
  static const adminId = "Pc9SBSvzlZaLzloGWyGJQQ0paCi1";
  static final regexForEmail = RegExp(
      r"^[a-zA-Z0-9.!#$%&\'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$");
  static String noImage =
      "https://firebasestorage.googleapis.com/v0/b/swirl-10996.appspot.com/o/public%2Fno-image.png?alt=media&token=a276ea04-ceaa-447e-8b01-0a6da824c074";

  static getPrefs() async {
    prefs ??= await SharedPreferences.getInstance();
    return prefs;
  }

  static List<DropDownMenuData> propertyTypes = [
    DropDownMenuData("Buy", "Buy"),
    DropDownMenuData("Rent", "Rent"),
  ];
  static List<DropDownMenuData> categoryTypes = [
    DropDownMenuData("Townhouse", "Townhouse"),
    DropDownMenuData("Villa", "Villa"),
    DropDownMenuData("Flat", "Flat"),
  ];
  static void showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppTheme.primaryColor,
      ),
    );
  }

  // static Future<String> uploadMedia(
  //     AttachmentModel attachment, String id, String path) async {
  //   try {
  //     final ref = FirebaseStorage.instance.ref().child(path).child(id);
  //     UploadTask uploadTask = ref.putFile(attachment.file!);
  //     String url = await (await uploadTask).ref.getDownloadURL();
  //     await updateAttachment(path, id, attachment, url);
  //     return url;
  //   } catch (e) {
  //     return "";
  //   }
  // }

  // static Future<bool> updateAttachment(String path, String id,
  //     AttachmentModel attachment, String downloadURL) async {
  //   return FirebaseFirestore.instance
  //       .collection(path)
  //       .doc(id)
  //       .set(attachment.toFirestore(downloadURL))
  //       .then((value) {
  //     return true;
  //   }).catchError((onError) {
  //     return false;
  //   });
  // }

  static InputDecoration getInputDecoration(String hint, bool? isPass,String? prefixText,
      Widget? widget, String prefixIcon, Color? hintTextColor) {
    return InputDecoration(
      border: InputBorder.none,
      prefixText: prefixText,
      hintText: hint,
      hintStyle: TextStyle(
        color: hintTextColor,
        fontSize: 16,
      ),
      prefixIcon: prefixIcon.isNotEmpty
          ? Image(image: ExactAssetImage(prefixIcon))
          : null,
      counterText: '',
      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(1), // Set the border radius
          borderSide:
              const BorderSide(width: 1, color: AppTheme.kCustomBorderColor)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(1),
        borderSide:
            const BorderSide(width: 1, color: AppTheme.kCustomBorderColor),
      ),
      suffixIcon: isPass!
          ? widget
          : Container(
              width: 0.0,
            ),
    );
  }
}
