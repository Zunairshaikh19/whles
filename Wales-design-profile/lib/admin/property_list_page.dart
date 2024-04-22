import 'dart:math';
import 'package:app/admin/profileInfo.dart';
import 'package:app/admin/view_property_detail.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../app_theme.dart';
import '../constants.dart';
import '../models/trending_model.dart';

class PropertyListPage extends StatefulWidget {
  const PropertyListPage({super.key});

  @override
  State<PropertyListPage> createState() => _PropertyListPageState();
}

class _PropertyListPageState extends State<PropertyListPage> {
  bool loading = false;
  List<TrendingModel> trendingProperty = [];
  List<String> properties = [];
  List<String> trendingImage = [];
  String firstName = '';
  String lastName = '';
  bool selected = false;
  @override
  initState() {
    super.initState();

    // getTrends();
    getPrefs();
  }

  // void getTrends() async {
  //   if (loading) {
  //     return;
  //   }
  //   User? user = FirebaseAuth.instance.currentUser;
  //   if (user == null) {
  //     return;
  //   }
  //   setState(() {
  //     loading = true;
  //   });
  //   try {
  //     await FirebaseFirestore.instance
  //         .collection('property')
  //         .get()
  //         .then((value) {
  //       for (var doc in value.docs) {
  //         List<dynamic> images = doc.data()['mediaImages'];
  //         for (dynamic image in images) {
  //           trendingImage.add(
  //             image,
  //           );
  //         }
  //         trendingProperty.add(TrendingModel(
  //           doc.id,
  //           doc.data()['cardImage'],
  //           trendingImage,
  //           doc.data()['propertyName'],
  //           doc.data()['houseSize'],
  //           doc.data()['location'],
  //           doc.data()['rent'],
  //           "assets/Group2.png",
  //           doc.data()['room'],
  //           "assets/home-hashtag.png",
  //           doc.data()['location'],
  //           doc.data()['chargeInCash'],
  //           doc.data()['operatingExpense'],
  //           doc.data()['chargeInCash'],
  //           doc.data()['capacity'],
  //           doc.data()['area'],
  //           doc.data()['averagePurchase'],
  //           doc.data()['sharesSold'],
  //           doc.data()['sharesLeft'],
  //         ));
  //       }
  //     }).catchError((onError) {
  //       log(onError);
  //     });
  //   } catch (e) {}
  //   setState(() {
  //     loading = false;
  //   });
  // }

  void goTo(TrendingModel trending, int index) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return ViewPropertyDetails(
        trendingList: trending,
      );
    }));
  }

  void goToProfile() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return const ProfileInfo();
    }));
  }

  void getPrefs() async {
    SharedPreferences prefs = await Constants.getPrefs();
    setState(() {
      firstName = prefs.getString("firstName") ?? '';
      lastName = prefs.getString("lastName") ?? '';

      // profileUrl = prefs.getString("profileUrl") ?? Constants.noImage;
      // email = prefs.getString("email") ?? '';
    });
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
          'Add Property',
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
                "$firstName $lastName",
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
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: [
              const SizedBox(
                height: 15,
              ),
              Card(
                color: AppTheme.greyShadeColor,
                child: DataTable(columns: [
                  DataColumn(
                    label: Text(
                      'Property Name',
                      style: TextStyle(color: AppTheme.whiteColor),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Location',
                      style: TextStyle(color: AppTheme.whiteColor),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Price(per month)',
                      style: TextStyle(color: AppTheme.whiteColor),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Shares Price',
                      style: TextStyle(color: AppTheme.whiteColor),
                    ),
                  ),
                ], rows: [
                  for (int i = 0; i < trendingProperty.length; i++)
                    DataRow(cells: [
                      DataCell(
                          onTap: () => goTo(trendingProperty[i], i),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image(
                                    image: NetworkImage(
                                        trendingProperty[i].cardImage),
                                    width: 71,
                                    height: 74,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  trendingProperty[i].propertyName,
                                  style: TextStyle(color: AppTheme.whiteColor),
                                ),
                              ],
                            ),
                          )),
                      DataCell(
                        Text(
                          trendingProperty[i].location,
                          style: TextStyle(color: AppTheme.whiteColor),
                        ),
                      ),
                      DataCell(Text(
                        trendingProperty[i].price,
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
                      DataCell(Text(
                        trendingProperty[i].price,
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
                    ]),

                  // ListView.builder(
                  //     padding: const EdgeInsets.only(
                  //       left: 0,
                  //     ),
                  //     shrinkWrap: true,
                  //     physics: const ClampingScrollPhysics(),
                  //     itemCount: trendingProperty.length,
                  //     scrollDirection: Axis.vertical,
                  //     itemBuilder: (context, index) {
                  //       return GestureDetector(
                  //         onTap: () => goTo(trendingProperty[index], index),
                  //         child: Padding(
                  //           padding: const EdgeInsets.only(right: 20.0),
                  //           child: TrendingContainer(
                  //             trendingList: trendingProperty[index],
                  //             // price: priceList[index]
                  //           ),
                  //         ),
                  //       );
                  //     })
                ]),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
