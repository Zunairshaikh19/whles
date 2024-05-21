import 'dart:io';
import 'package:app/Global/variable.dart';
import 'package:app/constants/app_colors.dart';
import 'package:app/constants/typography.dart';
import 'package:app/profile/views/verify_form_pending_view.dart';
import 'package:app/profile/widgets/form_progress_indicator.dart';
import 'package:app/widgets/custom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';

class VerifyFormStep4View extends StatefulWidget {
  const VerifyFormStep4View({Key? key, required this.documentId})
      : super(key: key);

  final String documentId;

  @override
  _VerifyFormStep4ViewState createState() => _VerifyFormStep4ViewState();
}

class _VerifyFormStep4ViewState extends State<VerifyFormStep4View> {
  late ImagePicker _imagePicker;
  XFile? _frontImage;
  XFile? _backImage;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
  }

  Future<void> _pickImage(bool isFront) async {
    final XFile? pickedImage =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        if (isFront) {
          _frontImage = pickedImage;
        } else {
          _backImage = pickedImage;
        }
      });
    }
  }

  Future<String?> _uploadImage(File imageFile) async {
    try {
      final firebase_storage.Reference storageRef = firebase_storage
          .FirebaseStorage.instance
          .ref()
          .child('images/${DateTime.now().millisecondsSinceEpoch}');
      final firebase_storage.UploadTask uploadTask =
          storageRef.putFile(File(imageFile.path));
      final firebase_storage.TaskSnapshot storageSnapshot =
          await uploadTask.whenComplete(() => null);
      final String downloadURL = await storageSnapshot.ref.getDownloadURL();
      return downloadURL;
    } catch (e) {
      print('Error uploading image: $e');
      return null;
    }
  }

  Future<void> _updateFirestore(
      String frontImageUrl, String backImageUrl) async {
    try {
      await FirebaseFirestore.instance
          .collection('onBoarding')
          .doc(widget.documentId)
          .update({
        'frontIDImg': frontImageUrl,
        'backIDImg': backImageUrl,
        'status': false,
        'userId': SaveduserId
      });
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) {
            return const VerifyFormPendingView();
          },
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update Firestore: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back_ios_new),
                    ),
                    const SizedBox(height: 25),
                    const FormProgressIndicator(step: 4),
                    const SizedBox(height: 47),
                    Text(
                      'Upload ID Images',
                      style: poppinsMedium.copyWith(fontSize: 20),
                    ),
                    const SizedBox(height: 27),
                    GestureDetector(
                      onTap: () => _pickImage(true),
                      child: _buildImageContainer(
                          'Upload front page', _frontImage),
                    ),
                    const SizedBox(height: 16),
                    GestureDetector(
                      onTap: () => _pickImage(false),
                      child:
                          _buildImageContainer('Upload back page', _backImage),
                    ),
                    const SizedBox(height: 16),
                    // Replace Spacer with SizedBox to avoid issues
                    const SizedBox(height: 30),
                    PrimaryButton(
                      title: 'Next',
                      onTap: () async {
                        if (_frontImage != null && _backImage != null) {
                          setState(() {
                            _isLoading = true;
                          });
                          final frontImageUrl =
                              await _uploadImage(File(_frontImage!.path));
                          final backImageUrl =
                              await _uploadImage(File(_backImage!.path));
                          if (frontImageUrl != null && backImageUrl != null) {
                            _updateFirestore(frontImageUrl, backImageUrl);
                          } else {
                            setState(() {
                              _isLoading = false;
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text('Failed to upload images')),
                            );
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(
                                    'Please select both front and back images')),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            if (_isLoading)
              Center(
                child: CircularProgressIndicator(),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageContainer(String label, XFile? image) {
    return Container(
      height: 130,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (image != null)
              Image.file(
                File(image.path),
                height: 60,
                width: 60,
              )
            else
              const Icon(Icons.camera_alt_outlined,
                  size: 35, color: AppColors.secondaryColor),
            const SizedBox(height: 10),
            Text(
              label,
              style: poppinsRegular.copyWith(
                  fontSize: 13, color: AppColors.secondaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
