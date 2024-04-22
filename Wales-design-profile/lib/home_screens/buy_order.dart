import 'package:app/home_screens/sign_document.dart';
import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../widgets/custom_button.dart';

class BuyOrder extends StatefulWidget {
  const BuyOrder({super.key});

  @override
  State<BuyOrder> createState() => _BuyOrderState();
}

class _BuyOrderState extends State<BuyOrder> {
  void goTo() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return const SignDocument();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.greyColor,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios,
            size: 18,
            color: AppTheme.whiteColor,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Buy Order',
          style: TextStyle(
              color: AppTheme.blackColor, fontWeight: FontWeight.w600),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(14.0),
        child: Column(
          children: [
            Text(
              "Entire Bromo\nmountain view\nCabin in Surabaya",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  overflow: TextOverflow.visible,
                  fontSize: 20,
                  fontFamily: 'Poppins'),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "SHARE",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      overflow: TextOverflow.visible,
                      fontSize: 20,
                      fontFamily: 'Poppins'),
                ),
                Text(
                  "5\$ / Per share",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      overflow: TextOverflow.visible,
                      fontSize: 12,
                      fontFamily: 'Poppins'),
                ),
                // HomeHeadingWidget(
                //   title: "SHARE",
                //   type: "5\$ / Per share",
                //   showView: true,
                // ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(14.0),
        child: CustomButton(
            isButtonEnable: false,
            height: 56,
            onPress: goTo,
            text: "Next",
            fontSize: 16,
            fontColor: AppTheme.blackColor,
            fontWeight: FontWeight.w500,
            fontFamily: 'Poppins',
            containerColor: AppTheme.blackColor),
      ),
    );
  }
}
