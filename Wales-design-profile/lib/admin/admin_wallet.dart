import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../app_theme.dart';
import '../constants.dart';

class AdminWallet extends StatefulWidget {
  const AdminWallet({super.key});

  @override
  State<AdminWallet> createState() => _AdminWalletState();
}

class _AdminWalletState extends State<AdminWallet> {
  double progressValue = 50;
  bool loading = false;
  String firstName = '';
  String lastName = '';
  @override
  void initState() {
    super.initState();
    loading = false;
    progressValue = 0.0;
    getPrefs();
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
          'Wallet',
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
                          'Wallet',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: AppTheme.whiteColor),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Your Address',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: AppTheme.whiteColor),
                        ),
                        Text(
                          '0xe9be55ac31.....7f122f799',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppTheme.whiteColor),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Balance',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: AppTheme.whiteColor),
                        ),
                        Text(
                          '1.05 USDT',
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
                        'User List',
                        style: TextStyle(color: AppTheme.whiteColor),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Status',
                        style: TextStyle(color: AppTheme.whiteColor),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Profit',
                        style: TextStyle(color: AppTheme.whiteColor),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Property Share',
                        style: TextStyle(color: AppTheme.whiteColor),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Share Profit',
                        style: TextStyle(color: AppTheme.whiteColor),
                      ),
                    ),
                  ], rows: [
                    for (int i = 0; i < 5; i++)
                      DataRow(cells: [
                        DataCell(
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              children: [
                                const CircleAvatar(
                                  backgroundImage:
                                      ExactAssetImage('assets/blueNose.png'),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Bluenose',
                                  style: TextStyle(
                                    color: AppTheme.whiteColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        DataCell(Text(
                          'Verified',
                          style: TextStyle(
                            color: AppTheme.greenColor,
                          ),
                        )),
                        DataCell(
                          Row(
                            children: [
                              Container(
                                width: 150,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    gradient: LinearGradient(colors: [
                                      AppTheme.whiteColor,
                                      AppTheme.whiteColor,
                                      AppTheme.whiteColor,
                                    ], stops: [
                                      progressValue / 2,
                                      progressValue,
                                      progressValue,
                                    ])),
                                child: const SizedBox(height: 10),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                '${(progressValue * 100).round()}%',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppTheme.whiteColor),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                padding: const EdgeInsets.only(right: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: AppTheme.kCustomWalletContainerColor,
                                ),
                                child: const Row(
                                  children: [
                                    Image(
                                      image: ExactAssetImage(
                                          'assets/arrow-up.png'),
                                    ),
                                    Text(
                                      '4%',
                                      style: TextStyle(
                                        color: AppTheme.kCustomWalletTextColor,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        DataCell(Text(
                          '500',
                          style: TextStyle(color: AppTheme.whiteColor),
                        )),
                        DataCell(Text(
                          '\$100000',
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
