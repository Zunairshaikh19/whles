import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../app_theme.dart';
import '../widgets/custom_button.dart';

class HostPlace extends StatefulWidget {
  const HostPlace({super.key});

  @override
  State<HostPlace> createState() => _HostPlaceState();
}

class _HostPlaceState extends State<HostPlace> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
            tileMode: TileMode.clamp,
            begin: Alignment.center,
            end: Alignment.centerRight,
            colors: [
              AppTheme.kCustomButtonColorgreen,
              Color.fromARGB(221, 241, 213, 137).withOpacity(0.4)
            ]),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Want to host\nyour own place?",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: AppTheme.whiteColor,
                          fontFamily: 'Poppins'),
                    ),
                    Text(
                      "Lorem Ipsum is simply\ndummy text of the\nprinting",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: AppTheme.whiteColor,
                          fontFamily: 'Poppins'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                CustomButton(
                    isButtonEnable: true,
                    height: 34,
                    radius: 26,
                    width: 150,
                    onPress: () {},
                    text: "Become a host",
                    fontSize: 16,
                    fontColor: AppTheme.blackColor,
                    fontWeight: FontWeight.bold,
                    containerColor: AppTheme.whiteColor,
                    fontFamily: 'Poppins'),
              ],
            ),
          ),
          const SizedBox(
            height: 210,
            width: 123,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: Image(
                image: AssetImage(
                  'assets/unsplash.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
