import 'package:app/constants/typography.dart';
import 'package:app/profile/documents/widgets/document_menu_dialog.dart';
import 'package:flutter/material.dart';

class DocumentView extends StatelessWidget {
  const DocumentView({super.key});

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
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back_ios_new),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Documents',
                    style: poppinsMedium.copyWith(fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Legal Documents',
                    style: poppinsMedium.copyWith(fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const DocumentMenu();
                        },
                      );
                    },
                    child: const Icon(Icons.menu),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              const Divider(),
              const SizedBox(height: 33),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Legal Documents',
                    style: poppinsMedium.copyWith(fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const DocumentMenu();
                        },
                      );
                    },
                    child: const Icon(Icons.menu),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
