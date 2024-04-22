import 'package:flutter/material.dart';

import '../app_theme.dart';
import '../widgets/custom_button.dart';

class Crypto extends StatefulWidget {
  const Crypto({super.key});

  @override
  State<Crypto> createState() => _CryptoState();
}

class _CryptoState extends State<Crypto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppTheme.greyColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Image(
              image: ExactAssetImage(
                'assets/earning1.png',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Set Up Your Account to Begin building your portfolio',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              isButtonEnable: false,
              height: 56,
              onPress: () {},
              text: "Get Started",
              fontColor: Colors.white,
              fontWeight: FontWeight.bold,
              containerColor: AppTheme.kCustomButtonColorgreen,
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2.2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Shares',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                            color: AppTheme.kCustomCryptoTextColor
                                .withOpacity(0.50)),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        '\$0',
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                            color: AppTheme.kCustomCryptoTextColor),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2.3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Cash',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                            color: AppTheme.kCustomCryptoTextColor
                                .withOpacity(0.50)),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        '\$0',
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                            color: AppTheme.kCustomCryptoTextColor),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
