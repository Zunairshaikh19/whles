import 'package:app/constants.dart';
import 'package:app/models/public_profile_model.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:cloud_functions/cloud_functions.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../app_theme.dart';

class Users extends StatefulWidget {
  const Users({super.key});

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  String firstName = '';
  String lastName = '';
  String fname = '';
  String lName = '';
  String email = '';
  bool loading = false;
  List<String> users = [];
  List<PublicProfileModel> userProfile = [];
  @override
  void initState() {
    super.initState();
    getPrefs();
    // usersList();
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

  // Future<String> usersList() async {
  //   User? user = FirebaseAuth.instance.currentUser;
  //   String responseID = '';
  //   if (user != null) {
  //     HttpsCallable callable =
  //         FirebaseFunctions.instance.httpsCallable('getAllUsers');
  //     final results = await callable({
  //       //'users': users,
  //       // 'groupName': groupName,
  //       // 'groupURL': groupURL,
  //     });
  //     dynamic result = results.data;
  //     for (dynamic r in result) {
  //       users.add(r['uid']);
  //     }
  //     getUsers();
  //     // responseID = result['users'];
  //   }
  //   return responseID;
  // }

  // void getUsers() async {
  //   if (loading) {
  //     return;
  //   }
  //   User? user = FirebaseAuth.instance.currentUser;
  //   if (user == null) {
  //     return;
  //   }
  //   await FirebaseFirestore.instance
  //       .collection('profile')
  //       .where('role', isEqualTo: 'user')
  //       .get()
  //       .then((doc) {
  //     for (var doc in doc.docs) {
  //       for (String id in users) {
  //         if (doc.id == id) {
  //           userProfile.add(PublicProfileModel(
  //             doc.id,
  //             doc.data()['firstName'],
  //             doc.data()['lastName'],
  //             doc.data()['phoneNo'],
  //             doc.data()['role'],
  //             doc.data()['email'],
  //             doc.data()['profileUrl'],
  //           ));
  //         }
  //       }
  //     }
  //     setState(() {
  //       loading = false;
  //     });
  //   }).catchError((onError) {
  //     Constants.showMessage(context, onError);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                color: AppTheme.greyShadeColor,
                child: DataTable(columns: [
                  DataColumn(
                    label: Text(
                      'First Name',
                      style: TextStyle(color: AppTheme.whiteColor),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Last Name',
                      style: TextStyle(color: AppTheme.whiteColor),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Email',
                      style: TextStyle(color: AppTheme.whiteColor),
                    ),
                  ),
                ], rows: [
                  for (int i = 0; i < userProfile.length; i++)
                    DataRow(cells: [
                      DataCell(Text(
                        userProfile[i].firstName,
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
                      DataCell(Text(
                        userProfile[i].lastName,
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
                      DataCell(Text(
                        userProfile[i].email,
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
                    ]),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
