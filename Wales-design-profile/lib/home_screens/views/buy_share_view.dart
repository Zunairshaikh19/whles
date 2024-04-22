import 'package:app/constants/typography.dart';
import 'package:app/home_screens/views/doc_sign_view.dart';
import 'package:app/widgets/custom_buttons.dart';
import 'package:app/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class BuyShareView extends StatelessWidget {
  const BuyShareView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back_ios_new),
                  ),
                  Text(
                    'Buy Order',
                    style: poppinsMedium.copyWith(fontSize: 18),
                  ),
                  const Icon(Icons.arrow_back_ios_new, color: Colors.white),
                ],
              ),
              const SizedBox(height: 40),
              Text(
                'Entire Bromo\nmountain view\nCabin in Surabaya',
                style: poppinsRegular.copyWith(fontSize: 20),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('SHARE', style: poppinsBold.copyWith(fontSize: 15)),
                  Text('5\$ / Per share', style: poppinsRegular.copyWith(fontSize: 12)),
                ],
              ),
              const SizedBox(height: 80),
              Expanded(
                child: CustomTextFormField(
                  initialValue: '3',
                  outlineColor: Colors.transparent,
                  focusBorderColor: Colors.transparent,
                  inputTextStyle: poppinsRegular.copyWith(fontSize: 76),
                  textAlign: TextAlign.center,
                  keyBoardType: TextInputType.number,
                  maxLines: 1,
                ),
              ),
              const SizedBox(height: 40),
              PrimaryButton(
                title: 'Next',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const DocSignView()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
