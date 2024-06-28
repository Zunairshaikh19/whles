import 'package:cloud_firestore/cloud_firestore.dart';

class TradingModel {
  String id;
  String title;
  String status;
  double pricePerMonth;
  String propertyType;
  String rooms;
  String area;
  String pricePerShare;
  String location;
  double monthlyDividend;
  String rent;
  String operatingExpenses;
  double chargeInCash;
  double remainingOperatingExpenses;
  String sharesSoldCount;
  String sharesLeft;
  String averagePurchase;
  String homeCategory;
  String listType;
  List<String> carouselImages;

  TradingModel({
    required this.id,
    required this.title,
    required this.status,
    required this.pricePerMonth,
    required this.propertyType,
    required this.rooms,
    required this.area,
    required this.location,
    required this.monthlyDividend,
    required this.rent,
    required this.operatingExpenses,
    required this.chargeInCash,
    required this.remainingOperatingExpenses,
    required this.sharesSoldCount,
    required this.sharesLeft,
    required this.averagePurchase,
    required this.homeCategory,
    required this.listType,
    required this.pricePerShare,
    required this.carouselImages,
  });

  // Define a static method to create a TradingModel object from a Firestore document
  static TradingModel fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    List<String> carouselImages = data['carouselImages'] != null
        ? List<String>.from(data['carouselImages'])
        : [];

    double? parseDouble(dynamic value) {
      if (value is int) {
        return value.toDouble();
      } else if (value is double) {
        return value;
      } else if (value is String) {
        return double.tryParse(value);
      } else {
        return null;
      }
    }

    int? parseInt(dynamic value) {
      if (value is int) {
        return value;
      } else if (value is String) {
        return int.tryParse(value);
      } else {
        return null;
      }
    }

    return TradingModel(
      id: doc.id,
      title: data['title'] ?? "",
      status: data['status'] ?? "",
      pricePerMonth: parseDouble(data['pricePerMonth']) ?? 0.0,
      propertyType: data['propertyType'] ?? "",
      rooms: data['rooms'] ?? "",
      area: data['area'] ?? "",
      pricePerShare: data['pricePerShare'] ?? "",
      location: data['location'] ?? "",
      monthlyDividend: parseDouble(data['monthlyDividend']) ?? 0.0,
      rent: data['rent'] ?? "",
      operatingExpenses: data['operatingExpenses'] ?? "",
      chargeInCash: parseDouble(data['chargeInCash']) ?? 0.0,
      remainingOperatingExpenses:
          parseDouble(data['remainingOperatingExpenses']) ?? 0.0,
      sharesSoldCount: data['sharesSoldCount'] ?? "",
      sharesLeft: data['sharesLeft'] ?? "",
      averagePurchase: data['averagePurchase'] ?? "",
      homeCategory: data['homeCategory'] ?? "",
      listType: data['listType'] ?? "",
      carouselImages: carouselImages,
    );
  }

  static Stream<List<TradingModel>> fromMap(QuerySnapshot<Map<String, dynamic>> snapshot) {
    return Stream.value(
      snapshot.docs.map((doc) => TradingModel.fromFirestore(doc)).toList(),
    );
  }
  
  static Future<void> addTradingProperty(TradingModel tradingModel) async {
    await FirebaseFirestore.instance.collection('property_details').doc(tradingModel.id).set({
      'title': tradingModel.title,
      'status': tradingModel.status,
      'pricePerMonth': tradingModel.pricePerMonth,
      'propertyType': tradingModel.propertyType,
      'rooms': tradingModel.rooms,
      'area': tradingModel.area,
      'pricePerShare': tradingModel.pricePerShare,
      'location': tradingModel.location,
      'monthlyDividend': tradingModel.monthlyDividend,
      'rent': tradingModel.rent,
      'operatingExpenses': tradingModel.operatingExpenses,
      'chargeInCash': tradingModel.chargeInCash,
      'remainingOperatingExpenses': tradingModel.remainingOperatingExpenses,
      'sharesSoldCount': tradingModel.sharesSoldCount,
      'sharesLeft': tradingModel.sharesLeft,
      'averagePurchase': tradingModel.averagePurchase,
      'homeCategory': tradingModel.homeCategory,
      'listType': tradingModel.listType,
      'carouselImages': tradingModel.carouselImages,
    });
  }
  
  static Future<void> addingAlll () async {
    final tradingList = tradingPropertyList;
    for (var trading in tradingList) {
      await addTradingProperty(trading);
    }
  }

  static List<TradingModel> get tradingPropertyList {
    return [
      TradingModel(
        id: '1',
        title: 'Property 1',
        status: 'For Sale',
        pricePerMonth: 1000.0,
        propertyType: 'Apartment',
        rooms: '3',
        area: '1000',
        location: 'London',
        monthlyDividend: 100.0,
        rent: '1000',
        operatingExpenses: '100',
        chargeInCash: 1000.0,
        remainingOperatingExpenses: 100.0,
        sharesSoldCount: '100',
        sharesLeft: '100',
        averagePurchase: '100',
        homeCategory: 'Trending',
        listType: 'For Sale',
        pricePerShare: '100',
        carouselImages: [
          'assets/trading.png',
          'assets/trading.png',
          'assets/trading.png',
        ],
      ),
      TradingModel(
        id: '2',
        title: 'Property 2',
        status: 'For Sale',
        pricePerMonth: 2000.0,
        propertyType: 'House',
        rooms: '4',
        area: '2000',
        location: 'Manchester',
        monthlyDividend: 200.0,
        rent: '2000',
        operatingExpenses: '200',
        chargeInCash: 2000.0,
        remainingOperatingExpenses: 200.0,
        sharesSoldCount: '200',
        sharesLeft: '200',
        averagePurchase: '200',
        homeCategory: 'House',
        listType: 'Most Viewed',
        pricePerShare: '200',
        carouselImages: [
          'assets/trading.png',
          'assets/trading.png',
          'assets/trading.png',
        ],
      ),
      TradingModel(
        id: '3',
        title: 'Property 3',
        status: 'For Sale',
        pricePerMonth: 3000.0,
        propertyType: 'Villa',
        rooms: '5',
        area: '3000',
        location: 'Birmingham',
        monthlyDividend: 300.0,
        rent: '3000',
        operatingExpenses: '300',
        chargeInCash: 3000.0,
        remainingOperatingExpenses: 300.0,
        sharesSoldCount: '300',
        sharesLeft: '300',
        averagePurchase: '300',
        homeCategory: 'Villa',
        listType: 'Trending',
        pricePerShare: '300',
        carouselImages: [
          'assets/trading.png',
          'assets/trading.png',
          'assets/trading.png',
        ],
      ),
    ];
  }
}
