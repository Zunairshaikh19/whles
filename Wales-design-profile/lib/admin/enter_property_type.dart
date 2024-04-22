// ignore_for_file: avoid_print
import 'package:app/admin/profileInfo.dart';
import 'package:app/admin/upload_buying_property.dart';
import 'package:app/admin/upload_property.dart';
import 'package:app/home_screens/profile.dart';
import 'package:app/profile/create_agent_account.dart';
import 'package:app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../app_theme.dart';
import '../constants.dart';
import '../models/drop_down_menu_data.dart';
import '../widgets/drop_down_menu.dart';

class EnterPropertyType extends StatefulWidget {
  const EnterPropertyType({Key? key}) : super(key: key);

  @override
  State<EnterPropertyType> createState() => _EnterPropertyTypeState();
}

class _EnterPropertyTypeState extends State<EnterPropertyType> {
  var currentIndex = 0;
  bool cont = false;

  bool isButtonEnabled = false;
  DropDownMenuData propertyType = Constants.propertyTypes[0];

  List userTypeList = [
    'Real Estate Agent',
    'User',
  ];
  String firstName = '';
  String lastName = '';

  @override
  void initState() {
    super.initState();
    getPrefs();
  }

  void abc() {}
  void getValues(String type, String value) {
    if (type == "propertyType") {
      setState(
        () {
          propertyType.value = value;
        },
      );
    }
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

  // void next(String type) {
  //   User? user = FirebaseAuth.instance.currentUser;
  //   if (user != null && userType.isNotEmpty) {
  //     FirebaseFirestore.instance
  //         .collection("profile")
  //         .doc(user.uid)
  //         .set({'userType': userType}, SetOptions(merge: true)).then(
  //             (value) async {
  //       SharedPreferences prefs = await Constants.getPrefs();
  //       prefs.setString("userType", userType);
  //       Navigator.of(context).push(MaterialPageRoute(builder: (_) {
  //     if (type == "BUYER") {
  //       return const Profile();
  //     } else {
  //       return const AgencyProfile();
  //     }
  //   }));
  //     }).catchError((onError) {
  //       print(onError.toString());
  //     });
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //       content: Text("Please Select The User Type"),
  //     ));
  //     }
  // }
  void goTo() {
    if (propertyType.value == "Buy") {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) {
            return UploadBuyingProperty(propertyType.title);
          },
        ),
      );
    } else if (propertyType.value == "Rent") {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) {
            return UploadProperty(propertyType.title);
          },
        ),
      );
    }
  }

  void goToProfile() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return const ProfileInfo();
        },
      ),
    );
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
          'Type',
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
            onTap: goTo,
            child: const Image(
              image: ExactAssetImage('assets/account1.png'),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Select Type',
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.whiteColor),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                    border: Border.all(color: AppTheme.whiteColor)),
                child: DropDownMenu(
                    getValues,
                    "property Type",
                    Icon(
                      Icons.cast_for_education_sharp,
                      color: AppTheme.whiteColor,
                    ),
                    Constants.propertyTypes,
                    propertyType,
                    "propertyType"),
              ),
              const SizedBox(
                height: 35,
              ),
              CustomButton(
                isButtonEnable: isButtonEnabled,
                height: 56,
                onPress: goTo,
                text: "Continue",
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
