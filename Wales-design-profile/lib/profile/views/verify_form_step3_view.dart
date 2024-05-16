import 'package:app/constants/typography.dart';
import 'package:app/profile/views/verify_form_step4_view.dart';
import 'package:app/profile/widgets/form_progress_indicator.dart';
import 'package:app/widgets/custom_buttons.dart';
import 'package:app/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VerifyFormStep3View extends StatefulWidget {
  final String documentId;

  const VerifyFormStep3View({super.key, required this.documentId});

  @override
  _VerifyFormStep3ViewState createState() => _VerifyFormStep3ViewState();
}

class _VerifyFormStep3ViewState extends State<VerifyFormStep3View> {
  final TextEditingController _goalDescController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void _updateFirestore() async {
    String goalDescription = _goalDescController.text.trim();

    try {
      await _firestore.collection('onBoarding').doc(widget.documentId).update({
        'goalDesc': goalDescription,
      });
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) {
            return VerifyFormStep4View(documentId: widget.documentId);
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
              const FormProgressIndicator(step: 3),
              const SizedBox(height: 47),
              Text(
                'Please enter your Investing\ngoals',
                style: poppinsMedium.copyWith(fontSize: 20),
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                hintText: 'Description',
                maxLines: 10,
                controller: _goalDescController,
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
