import 'package:app/constants/typography.dart';
import 'package:app/profile/views/verify_form_step3_view.dart';
import 'package:app/profile/widgets/form_progress_indicator.dart';
import 'package:app/widgets/custom_buttons.dart';
import 'package:app/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VerifyFormStep2View extends StatefulWidget {
  final String documentId;

  const VerifyFormStep2View({super.key, required this.documentId});

  @override
  _VerifyFormStep2ViewState createState() => _VerifyFormStep2ViewState();
}

class _VerifyFormStep2ViewState extends State<VerifyFormStep2View> {
  final TextEditingController _streetAddressController =
      TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _postalCodeController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void _updateFirestore() async {
    String streetAddress = _streetAddressController.text.trim();
    String city = _cityController.text.trim();
    String postalCode = _postalCodeController.text.trim();

    try {
      await _firestore.collection('onBoarding').doc(widget.documentId).update({
        'streetAddress': streetAddress,
        'city': city,
        'postalCode': postalCode,
      });
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) {
            return VerifyFormStep3View(documentId: widget.documentId);
          },
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update Firestore: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
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
              const FormProgressIndicator(step: 2),
              const SizedBox(height: 47),
              Text(
                'Please enter your\nResidential Address',
                style: poppinsMedium.copyWith(fontSize: 20),
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                hintText: 'Street Address',
                controller: _streetAddressController,
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                hintText: 'City',
                controller: _cityController,
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                hintText: 'Postal/Zip',
                controller: _postalCodeController,
              ),
              const Spacer(),
              PrimaryButton(
                title: 'Next',
                onTap: _updateFirestore,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
