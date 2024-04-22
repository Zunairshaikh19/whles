import 'package:app/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app_theme.dart';
import '../widgets/custom_button.dart';

class Supports extends StatefulWidget {
  const Supports({super.key});

  @override
  State<Supports> createState() => _SupportsState();
}

class _SupportsState extends State<Supports> {
  String firstName = '';
  String lastName = '';
  @override
  void initState() {
    super.initState();
    getPrefs();
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
          'Support',
          style: TextStyle(color: AppTheme.whiteColor),
        ),
        actions: [
          Text(
            'English',
            style: TextStyle(fontSize: 14, color: AppTheme.whiteColor),
          ),
          const SizedBox(
            width: 5,
          ),
          const Image(
            image: ExactAssetImage('assets/bell.png'),
          ),
          const SizedBox(
            width: 5,
          ),
          const Image(
            image: ExactAssetImage('assets/search.png'),
          ),
          const SizedBox(
            width: 5,
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
            width: 5,
          ),
          const Image(
            image: ExactAssetImage('assets/account1.png'),
          ),
          const SizedBox(
            width: 5,
          ),
        ],
      ),
      body: SingleChildScrollView(
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
                        'Inq_no',
                        style: TextStyle(color: AppTheme.whiteColor),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Email',
                        style: TextStyle(color: AppTheme.whiteColor),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Description',
                        style: TextStyle(color: AppTheme.whiteColor),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Contact',
                        style: TextStyle(color: AppTheme.whiteColor),
                      ),
                    ),
                  ], rows: [
                    for (int i = 0; i < 5; i++)
                      DataRow(cells: [
                        DataCell(Text(
                          '2343',
                          style: TextStyle(color: AppTheme.whiteColor),
                        )),
                        DataCell(Text(
                          'Example@gmail.com',
                          style: TextStyle(color: AppTheme.whiteColor),
                        )),
                        DataCell(Text(
                          'Lorem Ipsum is...... simply dummy ',
                          style: TextStyle(color: AppTheme.whiteColor),
                        )),
                        DataCell(
                          CustomButton(
                            isButtonEnable: true,
                            height: 36,
                            width: MediaQuery.of(context).size.width / 2.8,
                            onPress: () {},
                            text: "Email",
                            fontSize: 16,
                            fontColor: AppTheme.blackColor,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                            containerColor: AppTheme.whiteColor,
                          ),
                        ),
                      ]),
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
