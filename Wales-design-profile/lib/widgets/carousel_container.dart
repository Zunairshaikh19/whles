import 'package:flutter/material.dart';

class CarouselContainer extends StatelessWidget {
  final String banner;
  final double? containerSize;
  // final String title;
  // final String subtitle;
  // final Function tapped;
  // final String buttonTitle;
  // final Color containerColor;
  // final Color buttonColor;
  // final String banner;
  // final bool curve;
  const CarouselContainer({
    required this.banner,

    // required this.title,
    // required this.subtitle,
    // required this.tapped,
    // required this.buttonTitle,
    // required this.containerColor,
    // required this.buttonColor,
    // required this.banner,
    // required this.curve,
    this.containerSize = 270,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: containerSize,
      //width: 350,
      decoration: BoxDecoration(
          // color: containerColor,
          borderRadius:
              //curve ?
              BorderRadius.circular(12),
          image: DecorationImage(image: NetworkImage(banner), fit: BoxFit.cover)
          //: BorderRadius.circular(0),
          ),
      // child: Image.asset(banner)
      // Row(
      //   crossAxisAlignment: CrossAxisAlignment.end,
      //   children: [
      //     SizedBox(
      //       width: 160,
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Text(
      //             title,
      //             style: const TextStyle(
      //                 fontSize: 26,
      //                 fontWeight: FontWeight.bold,
      //                 color: AppTheme.whiteColor),
      //           ),
      //           const SizedBox(
      //             height: 5,
      //           ),
      //           Expanded(
      //             child: Text(
      //               subtitle,
      //               style: const TextStyle(
      //                   overflow: TextOverflow.fade,
      //                   fontSize: 14,
      //                   fontWeight: FontWeight.w500,
      //                   color: AppTheme.whiteColor),
      //             ),
      //           ),
      //           const SizedBox(
      //             height: 5,
      //           ),
      //           ContainerButton(
      //               tapped: tapped,
      //               title: buttonTitle,
      //               backgroundColor: buttonColor,
      //               textColor: AppTheme.whiteColor),
      //           const SizedBox(
      //             height: 15,
      //           ),
      //         ],
      //       ),
      //     ),
      //     const SizedBox(
      //       width: 5,
      //     ),
      //     SizedBox(
      //       height: 180,
      //       width: 160,
      //       child: Image(
      //         fit: BoxFit.fill,
      //         image: AssetImage(banner),
      //       ),
      //     )
      //   ],
      // ),
    );
  }
}
