import 'dart:async';

import 'package:app/home_screens/views/buy_share_view.dart';
import 'package:app/models/most_viewed_model.dart';
import 'package:app/widgets/custom_button.dart';
import 'package:app/widgets/custom_rich_text.dart';
import 'package:app/widgets/property_details_cards.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import '../app_theme.dart';
import '../widgets/home_carousel.dart';

class PropertyDetails extends StatefulWidget {
  final MostViewedModel propertyData;
  PropertyDetails({super.key, required this.propertyData});

  @override
  State<PropertyDetails> createState() => _PropertyDetailsState();
}

class _PropertyDetailsState extends State<PropertyDetails> {
  bool loading = false;

  double progressValue = 50;
  // late Future<DocumentSnapshot<Map<String, dynamic>>> propertyDetail;

  @override
  void initState() {
    super.initState();
    loading = false;
    progressValue = 0.0;
  }

  void updateProgress() {
    var oneSec = Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer t) {
      setState(() {
        progressValue += 0.1;
        // we "finish" downloading here
        if (progressValue.toStringAsFixed(1) == '1.0') {
          loading = false;
          t.cancel();
          return;
        }
      });
    });
  }

  void shareProperty() {
    final String shareText =
        'Check out this property: ${widget.propertyData.title}\n'
        'Location: ${widget.propertyData.location}\n'
        'Price: \$${widget.propertyData.pricePerMonth}/mo\n'
        'Property Type: ${widget.propertyData.propertyType}\n'
        'Rooms: ${widget.propertyData.rooms}\n'
        'Area: ${widget.propertyData.area}\n'
        'For more details, visit our app.';

    Share.share(shareText);
  }

  void goToBuyOrder() {
    // Navigator.of(context).push(MaterialPageRoute(builder: (_) {
    //   return  UploadFiles();
    // }));
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return BuyShareView();
        },
      ),
    );
  }

  List<String> images = [
    'assets/image1.png',
    'assets/image3.png',
    'assets/image4.png'
  ];
  List<String> titles = [
    'Cash & financing',
    'Property details',
    'Cash & financing',
  ];
  List<String> subtitles = [
    'Offering . Property Activity . financing',
    'Description . Lease detail ',
    'Disclosure and circular . Operating agreements',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 300,
                  child: HomeCarousel(
                    270, // Provide the value for containerSize
                    widget.propertyData.carouselImages.isNotEmpty
                        ? widget.propertyData.carouselImages
                        : [
                            "assets/placeholder_image.png"
                          ], // Provide the value for bannerList
                    key: UniqueKey(), // Provide an optional key if needed
                  ),
                ),
                Positioned(
                    top: 40,
                    left: 20,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: CircleAvatar(
                        backgroundColor: AppTheme.whiteColor,
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 18,
                        ),
                      ),
                    )),
                Positioned(
                  top: 40,
                  right: 20,
                  child: GestureDetector(
                    onTap: shareProperty,
                    child: CircleAvatar(
                      backgroundColor: AppTheme.whiteColor,
                      child: Image(
                        image: ExactAssetImage(
                          'assets/share.png',
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                    bottom: 40,
                    right: 20,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                      decoration: BoxDecoration(
                          color: AppTheme.whiteColor,
                          borderRadius: BorderRadius.circular(22)),
                      child: Text('1 / 11'),
                    )),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image(
                        image: ExactAssetImage(
                          'assets/christmas-stars1.png',
                        ),
                      ),
                      Text(
                        "${widget.propertyData.sharesSoldCount}% SOLD",
                        style: TextStyle(fontFamily: 'Poppins'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          '${widget.propertyData.title}',
                          style: TextStyle(fontSize: 20, fontFamily: 'Poppins'),
                          overflow: TextOverflow
                              .ellipsis, // or TextOverflow.fade, TextOverflow.clip, etc.
                          maxLines:
                              1, // Adjust as needed, or remove for unlimited lines
                        ),
                      ),
                      Image(
                        image: ExactAssetImage(
                          'assets/Group9.png',
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'GA . ${widget.propertyData.status}',
                    style: TextStyle(
                        fontSize: 9,
                        color: AppTheme.kCustomTextFiledHintTextColor),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomRichText(
                    leftText: "\$${widget.propertyData.pricePerMonth}/mo ",
                    leftTextColor: AppTheme.greenColor,
                    leftFontSize: 10,
                    rightText: "${widget.propertyData.propertyType}",
                    rightTextColor: AppTheme.kCustomnavGrayColor,
                    rightFontSize: 10,
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) =>
                      //              UserType() //SignUpView(),
                      //         ));
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Image(image: ExactAssetImage('assets/Group2.png')),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '${widget.propertyData.rooms} room',
                        style: TextStyle(
                            fontSize: 10,
                            color: AppTheme.kCustomnavGrayColor,
                            fontFamily: 'Poppins'),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Image(image: ExactAssetImage('assets/home-hashtag.png')),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '${widget.propertyData.area}',
                        style: TextStyle(
                            fontSize: 10,
                            color: AppTheme.kCustomnavGrayColor,
                            fontFamily: 'Poppins'),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Image(image: ExactAssetImage('assets/location.png')),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '${widget.propertyData.location}',
                        style: TextStyle(
                            fontSize: 10,
                            color: AppTheme.kCustomnavGrayColor,
                            fontFamily: 'Poppins'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'May Dividend',
                    style: TextStyle(
                        color: AppTheme.kCustomCryptoTextColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins'),
                  ),
                  Text(
                    '\$${widget.propertyData.monthlyDividend}',
                    style: TextStyle(
                        color: AppTheme.kCustomCryptoTextColor,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rent',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: AppTheme.kCustomCryptoTextColor),
                      ),
                      Text(
                        '\$${widget.propertyData.rent}',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: AppTheme.greenColor),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Operating expenses',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: AppTheme.kCustomCryptoTextColor),
                      ),
                      Text(
                        '\$${widget.propertyData.operatingExpenses}',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: AppTheme.kCustomCryptoTextColor),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Divider(),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Charge in cash',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: AppTheme.kCustomCryptoTextColor),
                      ),
                      Text(
                        '\$${widget.propertyData.chargeInCash}',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: AppTheme.kCustomCryptoTextColor),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Operating expenses',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: AppTheme.kCustomCryptoTextColor),
                      ),
                      Text(
                        '\$${widget.propertyData.operatingExpenses}',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: AppTheme.kCustomCryptoTextColor),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Share Sold',
                    style: TextStyle(
                        color: AppTheme.kCustomCryptoTextColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins'),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    '${widget.propertyData.sharesSoldCount}',
                    style: TextStyle(
                        color: AppTheme.kCustomCryptoTextColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins'),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      '${(progressValue * 100).round()}%',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        gradient: LinearGradient(colors: [
                          AppTheme.blackColor,
                          AppTheme.whiteColor,
                          Colors.grey,
                        ], stops: [
                          progressValue / 2,
                          progressValue,
                          progressValue,
                        ])),
                    child: SizedBox(height: 10),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Shares Left',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: AppTheme.kCustomCryptoTextColor),
                      ),
                      Text(
                        '\$${widget.propertyData.sharesLeft}',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: AppTheme.kCustomCryptoTextColor),
                      )
                    ],
                  ),

                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Average Purchase',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: AppTheme.kCustomCryptoTextColor),
                      ),
                      Text(
                        '${widget.propertyData.averagePurchase} Shares',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: AppTheme.kCustomCryptoTextColor),
                      )
                    ],
                  ),

                  // LinearProgressIndicator(
                  //   backgroundColor: Colors.grey,
                  //   minHeight: 10,
                  //   valueColor:  AlwaysStoppedAnimation<Color>(Colors.red),
                  //   value: progressValue,
                  //   borderRadius: BorderRadius.circular(12),
                  // ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: titles.length,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return PropertyDetailsCards(
                          title: titles[index],
                          subtitle: subtitles[index],
                          image: images[index]);
                    },
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  CustomButton(
                    isButtonEnable: true,
                    height: 56,
                    onPress: goToBuyOrder,
                    //text: "Complete setup",
                    text:
                        "Buy (${widget.propertyData.pricePerShare}\$ / per share)",
                    containerColor: AppTheme.kCustomButtonColorgreen,
                    fontColor: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
