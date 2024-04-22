import 'package:app/constants/app_colors.dart';
import 'package:app/constants/typography.dart';
import 'package:flutter/material.dart';

class FaqView extends StatefulWidget {
  const FaqView({super.key});

  @override
  State<FaqView> createState() => _FaqViewState();
}

class _FaqViewState extends State<FaqView> {
  List<String> questions = [
    'Enim sodales consequat adipiscing facilisis massa venenatis, non lorem lobortis?',
    'Venenatis nulla sagittis nunc, lobortis nec sollicitudin neque, dolor?',
    'Varius ultricies molestie tellus fermentum, viverra ipsum scelerisque etiam lorem?',
    'Nulla etiam vitae, at sagittis, nibh ultrices mattis feugiat faucibus?',
    'Sagittis consectetur gravida nec turpis eros, id sit et, dictum?',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    'FAQs',
                    style: poppinsMedium.copyWith(fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(height: 37),
              ...List.generate(
                questions.length,
                (index) => Column(
                  children: [
                    const Divider(color: AppColors.primaryColor),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            questions[index],
                            style: poppinsMedium.copyWith(fontSize: 13),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Icon(Icons.keyboard_arrow_down_rounded),
                      ],
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
