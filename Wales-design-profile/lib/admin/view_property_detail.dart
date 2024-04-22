import 'dart:async';

import 'package:app/admin/profileInfo.dart';
import 'package:app/models/trending_model.dart';
import 'package:app/widgets/custom_rich_text.dart';
import 'package:flutter/material.dart';

import '../app_theme.dart';
import '../widgets/custom_button.dart';
import '../widgets/home_carousel.dart';

class ViewPropertyDetails extends StatefulWidget {
  final TrendingModel trendingList;
  const ViewPropertyDetails({required this.trendingList, super.key});

  @override
  State<ViewPropertyDetails> createState() => _ViewPropertyDetailsState();
}

class _ViewPropertyDetailsState extends State<ViewPropertyDetails> {
  double progressValue = 50;
  bool loading = false;
  @override
  void initState() {
    super.initState();
    loading = false;
    progressValue = 0.0;
  }

  void updateProgress() {
    const oneSec = Duration(seconds: 1);
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

  void goToProfile() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return const ProfileInfo();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.raisinColor,
      appBar: AppBar(
        backgroundColor: AppTheme.greyShadeColor,
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
        centerTitle: false,
        title: Text(
          'Property Details',
          style: TextStyle(color: AppTheme.whiteColor),
        ),
        actions: [
          Text(
            'English',
            style: TextStyle(fontSize: 14, color: AppTheme.whiteColor),
          ),
          const SizedBox(
            width: 10,
          ),
          const Image(
            image: ExactAssetImage('assets/bell.png'),
          ),
          const SizedBox(
            width: 10,
          ),
          const Image(
            image: ExactAssetImage('assets/search.png'),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'John Doe',
                style: TextStyle(fontSize: 10, color: AppTheme.whiteColor),
              ),
              Text(
                'Available',
                style: TextStyle(fontSize: 10, color: AppTheme.whiteColor),
              ),
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: goToProfile,
            child: const Image(
              image: ExactAssetImage('assets/account1.png'),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppTheme.greyShadeColor,
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            const SizedBox(
                                height: 199,
                                width: 128,
                                child: HomeCarousel(199)),
                            Positioned(
                                bottom: 20,
                                right: 10,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 6),
                                  decoration: BoxDecoration(
                                      color: AppTheme.whiteColor,
                                      borderRadius: BorderRadius.circular(22)),
                                  child: const Text('1 / 11'),
                                )),
                          ],
                        ),

                        // SizedBox(
                        //   height: 189,
                        //   width: 108,
                        //   child: ClipRRect(
                        //       borderRadius: const BorderRadius.only(
                        //           topLeft: Radius.circular(12),
                        //           bottomLeft: Radius.circular(12)),
                        //       child: Image(
                        //         image: NetworkImage(widget.trendingList.cardImage),
                        //         fit: BoxFit.cover,
                        //       )),
                        // ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 8),
                            Text(
                              widget.trendingList.propertyName,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  color: AppTheme.whiteColor),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              widget.trendingList.houseSize,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 9,
                                  fontFamily: 'Poppins',
                                  color: AppTheme.kCustomnavGrayColor),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Image(
                                  image: ExactAssetImage(
                                      widget.trendingList.roomIcon),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(widget.trendingList.noOfRooms,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13,
                                        fontFamily: 'Poppins',
                                        color: AppTheme.kCustomnavGrayColor)),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Image(
                                  image: ExactAssetImage(
                                      widget.trendingList.distanceIcon),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(widget.trendingList.noOfDistance,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13,
                                        fontFamily: 'Poppins',
                                        color: AppTheme.kCustomnavGrayColor)),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const Image(
                                  image: ExactAssetImage('assets/location.png'),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  widget.trendingList.location,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13,
                                      fontFamily: 'Poppins',
                                      color: AppTheme.kCustomnavGrayColor),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CustomRichText(
                                  onTap: () {},
                                  leftText: widget.trendingList.price,
                                  leftTextColor: AppTheme.whiteColor,
                                  leftFontSize: 18,
                                  leftFontWeight: FontWeight.w700,
                                  rightText: "/ month",
                                  rightFontSize: 12,
                                  rightTextColor: AppTheme.whiteColor,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Share Sold',
                              style: TextStyle(
                                  color: AppTheme.whiteColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Poppins'),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '8,101',
                              style: TextStyle(
                                  color: AppTheme.whiteColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Poppins'),
                            ),
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              '${(progressValue * 100).round()}%',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.whiteColor),
                            ),
                          ),
                          const SizedBox(
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
                            child: const SizedBox(height: 10),
                          ),
                          const SizedBox(
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
                                    color: AppTheme.whiteColor),
                              ),
                              Text(
                                '\$1,899',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: AppTheme.whiteColor,
                                ),
                              )
                            ],
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
                                    color: AppTheme.whiteColor),
                              ),
                              Text(
                                '7 Shares',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: AppTheme.whiteColor),
                              )
                            ],
                          ),
                          const Divider(),
                          const SizedBox(
                            height: 15,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'May Dividend',
                              style: TextStyle(
                                  color: AppTheme.whiteColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Poppins'),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '\$512.66',
                              style: TextStyle(
                                  color: AppTheme.whiteColor,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Poppins'),
                            ),
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
                                    color: AppTheme.whiteColor),
                              ),
                              Text(
                                widget.trendingList.rent,
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: AppTheme.whiteColor),
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
                                    color: AppTheme.whiteColor),
                              ),
                              Text(
                                widget.trendingList.operatingExpense,
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: AppTheme.whiteColor),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Divider(),
                          const SizedBox(
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
                                    color: AppTheme.whiteColor),
                              ),
                              Text(
                                widget.trendingList.chargeInCash,
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: AppTheme.whiteColor),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomButton(
                            isButtonEnable: false,
                            height: 56,
                            width: MediaQuery.of(context).size.width / 1.2,
                            onPress: updateProgress,
                            text: "Edit",
                            fontSize: 16,
                            fontColor: AppTheme.blackColor,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                            containerColor: AppTheme.blackColor,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomButton(
                            isButtonEnable: false,
                            height: 56,
                            width: MediaQuery.of(context).size.width / 1.2,
                            onPress: updateProgress,
                            text: "Delete",
                            fontSize: 16,
                            fontColor: AppTheme.blackColor,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                            containerColor: AppTheme.redColor,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
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
