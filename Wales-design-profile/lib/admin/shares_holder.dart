import 'package:app/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../app_theme.dart';
import '../widgets/custom_button.dart';

class SharesHolder extends StatefulWidget {
  const SharesHolder({super.key});

  @override
  State<SharesHolder> createState() => _SharesHolderState();
}

class _SharesHolderState extends State<SharesHolder> {
  List<dynamic> users = [];
  bool loading = false;
  @override
  void initState() {
    super.initState();
    getPrefs();
  }

  String firstName = '';
  String lastName = '';
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
          'Shareholder',
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
          const Image(
            image: ExactAssetImage('assets/account1.png'),
          ),
          const SizedBox(
            width: 10,
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
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 180,
                        ),
                        Text(
                          'Total Share',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: AppTheme.whiteColor),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'All Share',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: AppTheme.whiteColor),
                        ),
                        Text(
                          '\$599605',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppTheme.whiteColor),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'No of Shares',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: AppTheme.whiteColor),
                        ),
                        Text(
                          '304',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppTheme.whiteColor),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Shares Investment ',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: AppTheme.whiteColor),
                        ),
                        Text(
                          '1012.8 USDT',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppTheme.whiteColor),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: AppTheme.greyShadeColor,
                  child: DataTable(columns: [
                    DataColumn(
                      label: Text(
                        'Id_no',
                        style: TextStyle(color: AppTheme.whiteColor),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Username',
                        style: TextStyle(color: AppTheme.whiteColor),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Cash',
                        style: TextStyle(color: AppTheme.whiteColor),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Doccu sign',
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
                    DataRow(cells: [
                      DataCell(Text(
                        '2343',
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
                      DataCell(Text(
                        'Username_1',
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
                      DataCell(Text(
                        '\$20',
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
                      DataCell(
                        CustomButton(
                            isButtonEnable: false,
                            height: 36,
                            width: MediaQuery.of(context).size.width / 2.3,
                            onPress: () {},
                            text: "Download",
                            fontSize: 16,
                            fontColor: AppTheme.blackColor,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                            containerColor: AppTheme.blackColor),
                      ),
                      DataCell(Text(
                        '\$5',
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
                    ]),
                    DataRow(cells: [
                      DataCell(Text(
                        '2343',
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
                      DataCell(Text(
                        'Username_1',
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
                      DataCell(Text(
                        '\$20',
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
                      DataCell(
                        CustomButton(
                            isButtonEnable: false,
                            height: 36,
                            width: MediaQuery.of(context).size.width / 2.3,
                            onPress: () {},
                            text: "Download",
                            fontSize: 16,
                            fontColor: AppTheme.blackColor,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                            containerColor: AppTheme.blackColor),
                      ),
                      DataCell(Text(
                        '\$5',
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
                    ]),
                    DataRow(cells: [
                      DataCell(Text(
                        '2343',
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
                      DataCell(Text(
                        'Username_1',
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
                      DataCell(Text(
                        '\$20',
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
                      DataCell(
                        CustomButton(
                            isButtonEnable: false,
                            height: 36,
                            width: MediaQuery.of(context).size.width / 2.3,
                            onPress: () {},
                            text: "Download",
                            fontSize: 16,
                            fontColor: AppTheme.blackColor,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                            containerColor: AppTheme.blackColor),
                      ),
                      DataCell(Text(
                        '\$5',
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
                    ]),
                    DataRow(cells: [
                      DataCell(Text(
                        '2343',
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
                      DataCell(Text(
                        'Username_1',
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
                      DataCell(Text(
                        '\$20',
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
                      DataCell(
                        CustomButton(
                            isButtonEnable: false,
                            height: 36,
                            width: MediaQuery.of(context).size.width / 2.3,
                            onPress: () {},
                            text: "Download",
                            fontSize: 16,
                            fontColor: AppTheme.blackColor,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                            containerColor: AppTheme.blackColor),
                      ),
                      DataCell(Text(
                        '\$5',
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
                    ]),
                    DataRow(cells: [
                      DataCell(Text(
                        '2343',
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
                      DataCell(Text(
                        'Username_1',
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
                      DataCell(Text(
                        '\$20',
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
                      DataCell(
                        CustomButton(
                            isButtonEnable: false,
                            height: 36,
                            width: MediaQuery.of(context).size.width / 2.3,
                            onPress: () {},
                            text: "Download",
                            fontSize: 16,
                            fontColor: AppTheme.blackColor,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                            containerColor: AppTheme.blackColor),
                      ),
                      DataCell(Text(
                        '\$5',
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
                    ]),
                    DataRow(cells: [
                      DataCell(Text(
                        '2343',
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
                      DataCell(Text(
                        'Username_1',
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
                      DataCell(Text(
                        '\$20',
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
                      DataCell(
                        CustomButton(
                            isButtonEnable: false,
                            height: 36,
                            width: MediaQuery.of(context).size.width / 2.3,
                            onPress: () {},
                            text: "Download",
                            fontSize: 16,
                            fontColor: AppTheme.blackColor,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                            containerColor: AppTheme.blackColor),
                      ),
                      DataCell(Text(
                        '\$5',
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
                    ]),
                    DataRow(cells: [
                      DataCell(Text(
                        '2343',
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
                      DataCell(Text(
                        'Username_1',
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
                      DataCell(Text(
                        '\$20',
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
                      DataCell(
                        CustomButton(
                            isButtonEnable: false,
                            height: 36,
                            width: MediaQuery.of(context).size.width / 2.3,
                            onPress: () {},
                            text: "Download",
                            fontSize: 16,
                            fontColor: AppTheme.blackColor,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                            containerColor: AppTheme.blackColor),
                      ),
                      DataCell(Text(
                        '\$5',
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
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
