import 'package:app/constants/app_colors.dart';
import 'package:app/constants/strings.dart';
import 'package:app/constants/typography.dart';
import 'package:app/home_screens/views/money_transfer_view.dart';
import 'package:app/widgets/custom_buttons.dart';
import 'package:signature/signature.dart';
import 'package:flutter/material.dart';

class DocSignView extends StatefulWidget {
  const DocSignView({super.key});

  @override
  State<DocSignView> createState() => _DocSignViewState();
}

class _DocSignViewState extends State<DocSignView> {
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.red,
    exportBackgroundColor: Colors.blue,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back_ios_new),
                  ),
                  Text(
                    'Docu sign',
                    style: poppinsMedium.copyWith(fontSize: 18),
                  ),
                  const Icon(Icons.arrow_back_ios_new, color: Colors.white),
                ],
              ),
              const SizedBox(height: 10),
              Image.asset(
                Strings.docSignLogo,
                width: 300,
                height: 100,
              ),
              const SizedBox(height: 30),
              Container(
                width: 500,
                height: 400,
                decoration: BoxDecoration(
                  color: AppColors.grey,
                  border: Border.all(color: AppColors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Signature(
                  controller: _controller,
                  width: 500,
                  height: 390,
                  backgroundColor: AppColors.grey,
                ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child: PrimaryButton(
                  width: 150,
                  onTap: () {
                    _controller.clear();
                  },
                  title: 'Clear',
                ),
              ),
              const Spacer(),
              PrimaryButton(
                title: 'Next',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const MoneyTransferView()),
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
