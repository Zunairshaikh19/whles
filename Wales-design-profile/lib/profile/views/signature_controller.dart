import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:signature/signature.dart';

class SignatureViewController extends GetxController {
  late SignatureController signatureController;
  var padColor = Colors.black.obs;
  var penColor = Colors.white.obs;

  @override
  void onInit() {
    super.onInit();
    initializeSignatureController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    signatureController.dispose();
  }

  void initializeSignatureController() {
    signatureController =
        SignatureController(penColor: penColor.value, penStrokeWidth: 3);
  }

  void selectPadColor() {
    Get.dialog(Center(
      child: Dialog(
        child: ColorPicker(
          pickerColor: padColor.value,
          onColorChanged: (color) {
            padColor.value = color;
          },
          showLabel: true,
          pickerAreaHeightPercent: .8,
        ),
      ),
    ));
  }

  void selectPenColor() {
    Get.dialog(Center(
      child: Dialog(
        child: ColorPicker(
          pickerColor: penColor.value,
          onColorChanged: (color) {
            penColor.value = color;
            initializeSignatureController();
          },
          showLabel: true,
          pickerAreaHeightPercent: .8,
        ),
      ),
    ));
  }

  void exportSignature() async {
    if (signatureController.isNotEmpty) {
      final exportedSignature = SignatureController(
          penColor: penColor.value,
          penStrokeWidth: 3,
          exportBackgroundColor: padColor.value,
          points: signatureController.points);
      final signature = await exportedSignature.toPngBytes();
      if (signature != null) {
        Get.back(result: signature);
      } else {
        Get.snackbar("Error", "Signature not exported",
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    } else {
      Get.snackbar("Error", "Provide signature",
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }
}
