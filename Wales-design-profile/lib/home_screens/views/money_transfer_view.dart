import 'package:app/constants/app_colors.dart';
import 'package:app/constants/strings.dart';
import 'package:app/constants/typography.dart';
import 'package:app/home_screens/views/payment_success_view.dart';
import 'package:app/widgets/custom_buttons.dart';
import 'package:flutter/material.dart';

class MoneyTransferView extends StatefulWidget {
  const MoneyTransferView({super.key});

  @override
  State<MoneyTransferView> createState() => _MoneyTransferViewState();
}

class _MoneyTransferViewState extends State<MoneyTransferView> {
  List<Map<String, dynamic>> data = [
    {
      'name': 'Visa Card',
      'accountNumber': '**** **** **** 1234',
      'icon': Strings.visaLogo,
      'isActive': true,
    },
    {
      'name': 'Master Card',
      'accountNumber': '**** **** **** 1234',
      'icon': Strings.masterCardLogo,
      'isActive': false,
    }
  ];

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
                    'Money Transfer',
                    style: poppinsMedium.copyWith(fontSize: 18),
                  ),
                  const Icon(Icons.arrow_back_ios_new, color: Colors.white),
                ],
              ),
              const SizedBox(height: 60),
              ...List.generate(
                data.length,
                (index) => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey.withOpacity(0.3)),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        data[index]['icon'],
                        width: 44,
                        height: 30,
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data[index]['name'],
                            style: poppinsMedium.copyWith(fontSize: 14),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            data[index]['accountNumber'],
                            style: poppinsMedium.copyWith(fontSize: 10, color: AppColors.grey2),
                          ),
                        ],
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            data.forEach((element) {
                              element['isActive'] = false;
                            });
                            data[index]['isActive'] = true;
                          });
                        },
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor:
                              data[index]['isActive'] ? AppColors.primaryColor : Colors.grey.withOpacity(0.3),
                          child: CircleAvatar(
                            radius: 12.5,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 9,
                              backgroundColor: data[index]['isActive'] ? AppColors.primaryColor : Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Spacer(),
              PrimaryButton(
                title: 'Next',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const PaymentSuccessView()),
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
