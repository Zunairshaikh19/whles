import 'package:app/home_screens/property_details.dart';
import 'package:app/models/trending_model.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import '../trending_container.dart';

class TrendingContainerList extends StatefulWidget {
  const TrendingContainerList({super.key});

  @override
  State<TrendingContainerList> createState() => _TrendingContainerListState();
}

class _TrendingContainerListState extends State<TrendingContainerList> {
  bool loading = false;
  List<TrendingModel> trendingProperty = [];
  List<String> properties = [];
  @override
  initState() {
    super.initState();

    getTrends();
  }

  List<String> trendingImage = [];
  List<String> titleContainer = [
    "Entire Bromo\nmountain view\nCabin in Surabaya",
    "Entire Bromo\nmountain view\nCabin in Surabaya",
    "Entire Bromo\nmountain view\nCabin in Surabaya",
    "Entire Bromo\nmountain view\nCabin in Surabaya",
    "Entire Bromo\nmountain view\nCabin in Surabaya",
    "Entire Bromo\nmountain view\nCabin in Surabaya",
  ];
  // List<TrendingModel> trendingList = [
  //   TrendingModel(
  //       'id',
  //       "assets/frame7.png",
  //       "Entire Bromo\nmountain view\nCabin in Surabaya",
  //       "Malang, Probolinggo",
  //       "GA . Leased",
  //       "assets/Group2.png",
  //       "2 rooms",
  //       "assets/home-hashtag.png",
  //       "673m2",
  //       "\$526"),
  //   TrendingModel(
  //       'id',
  //       "assets/frame7.png",
  //       "Entire Bromo\nmountain view\nCabin in Surabaya",
  //       "Malang, Probolinggo",
  //       "GA . Leased",
  //       "assets/Group2.png",
  //       "2 rooms",
  //       "assets/home-hashtag.png",
  //       "673m2",
  //       "\$526"),
  //   TrendingModel(
  //       'id',
  //       "assets/frame7.png",
  //       "Entire Bromo\nmountain view\nCabin in Surabaya",
  //       "Malang, Probolinggo",
  //       "GA . Leased",
  //       "assets/Group2.png",
  //       "2 rooms",
  //       "assets/home-hashtag.png",
  //       "673m2",
  //       "\$526"),
  //   TrendingModel(
  //       'id',
  //       "assets/frame7.png",
  //       "Entire Bromo\nmountain view\nCabin in Surabaya",
  //       "Malang, Probolinggo",
  //       "GA . Leased",
  //       "assets/Group2.png",
  //       "2 rooms",
  //       "assets/home-hashtag.png",
  //       "673m2",
  //       "\$526"),
  // ];

  void getTrends() async {
    // if (loading) {
    //   return;
    // }
    // User? user = FirebaseAuth.instance.currentUser;
    // if (user == null) {
    //   return;
    // }
    // setState(() {
    //   loading = true;
    // });
    // try {
    //   await FirebaseFirestore.instance
    //       .collection('property')
    //       .where('propertyType', isEqualTo: "Buy")
    //       .get()
    //       .then((value) {
    //     for (var doc in value.docs) {
    //       List<dynamic> images = doc.data()['mediaImages'];
    //       for (dynamic image in images) {
    //         trendingImage.add(
    //           image,
    //         );
    //       }
    //       trendingProperty.add(TrendingModel(
    //         doc.id,
    //         doc.data()['cardImage'],
    //         trendingImage,
    //         doc.data()['propertyName'],
    //         doc.data()['houseSize'],
    //         doc.data()['location'],
    //         doc.data()['propertyType'],
    //         "assets/Group2.png",
    //         doc.data()['room'],
    //         "assets/home-hashtag.png",
    //         doc.data()['location'],
    //         doc.data()['chargeInCash'],
    //         doc.data()['operatingExpense'],
    //         doc.data()['chargeInCash'],
    //         doc.data()['capacity'],
    //         doc.data()['area'],
    //         doc.data()['averagePurchase'],
    //         doc.data()['sharesSold'],
    //         doc.data()['sharesLeft'],
    //       ));
    //     }
    //   }).catchError((onError) {
    //     Constants.showMessage(context, onError);
    //   });
    // } catch (e) {}
    // setState(() {
    //   loading = false;
    // });
  }

  goTo(data) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return PropertyDetails(
        propertyData: data,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.only(left: 12, top: 18),
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: trendingProperty.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: goTo(trendingProperty[index]),
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: TrendingContainer(
                trendingList: trendingProperty[index],
                // price: priceList[index]
              ),
            ),
          );
        });
  }
}
