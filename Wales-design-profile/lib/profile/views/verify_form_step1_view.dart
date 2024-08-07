import 'package:app/constants/typography.dart';
import 'package:app/profile/views/verify_form_step2_view.dart';
import 'package:app/profile/widgets/form_progress_indicator.dart';
import 'package:app/widgets/custom_buttons.dart';
import 'package:app/widgets/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VerifyFormStep1View extends StatefulWidget {
  const VerifyFormStep1View({Key? key}) : super(key: key);

  @override
  _VerifyFormStep1ViewState createState() => _VerifyFormStep1ViewState();
}

class _VerifyFormStep1ViewState extends State<VerifyFormStep1View> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _secondNameController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool _isLoading = false;

  void _createFirestoreDocument() async {
    setState(() {
      _isLoading = true;
    });

    String firstName = _firstNameController.text.trim();
    String lastName = _secondNameController.text.trim();

    try {
      DocumentReference docRef = await _firestore.collection('onBoarding').add({
        'firstName': firstName,
        'lastName': lastName,
      });
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String documentId = prefs.getString('userId') ?? '';
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) {
            return VerifyFormStep2View(documentId: documentId);
          },
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to create Firestore document: $e')),
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back_ios_new),
                  ),
                  const SizedBox(height: 25),
                  const FormProgressIndicator(step: 1),
                  const SizedBox(height: 47),
                  Text(
                    'Please enter your Legal\nName',
                    style: poppinsMedium.copyWith(fontSize: 20),
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    hintText: 'First Name',
                    controller: _firstNameController,
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    hintText: 'Second Name',
                    controller: _secondNameController,
                  ),
                  const Spacer(),
                  PrimaryButton(
                    title: 'Next',
                    onTap: _createFirestoreDocument,
                  ),
                ],
              ),
              if (_isLoading)
                Center(
                  child: CircularProgressIndicator(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
