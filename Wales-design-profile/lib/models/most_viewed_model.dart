import 'package:cloud_firestore/cloud_firestore.dart';

class MostViewedModel {
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

  MostViewedModel({
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

  // Define a static method to create a MostViewedModel object from a Firestore document
  static MostViewedModel fromFirestore(DocumentSnapshot doc) {
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

    return MostViewedModel(
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
}
