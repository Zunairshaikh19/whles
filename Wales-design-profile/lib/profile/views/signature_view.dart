import 'package:app/profile/views/signature_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signature/signature.dart';

class SignatureView extends GetView<SignatureViewController> {
  @override
  Widget build(BuildContext context) {
    Get.put(SignatureViewController());
    return Scaffold(
      body: Column(
        children: [
          Obx(() => Expanded(
            child: Signature(
                  controller: controller.signatureController,
                  backgroundColor: controller.padColor.value,
                ),
          ),),
          Container(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    controller.selectPadColor();
                  },
                  child: Text(
                    "Pad Color",
                    style: TextStyle(color: Colors.black),
                  ),
                 
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.selectPenColor();
                  },
                  child: Text(
                    "Pen Color",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.exportSignature();
                  },
                  child: Text(
                    "Save",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.signatureController.clear();
                  },
                  child: Text(
                    "Clear",
                    style: TextStyle(color: Colors.black),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}