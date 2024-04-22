import 'package:app/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app_theme.dart';

class Crypto extends StatefulWidget {
  const Crypto({super.key});

  @override
  State<Crypto> createState() => _CryptoState();
}

class _CryptoState extends State<Crypto> {
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
          'Crypto',
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
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
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
                      DataCell(Text(
                        '\$5',
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
                    ]),
                  ]),
                ),
                const SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Recent Transaction',
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.whiteColor),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Card(
                  color: AppTheme.greyShadeColor,
                  child: DataTable(columns: [
                    DataColumn(
                      label: Text(
                        'Date',
                        style: TextStyle(color: AppTheme.whiteColor),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'From',
                        style: TextStyle(color: AppTheme.whiteColor),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'To',
                        style: TextStyle(color: AppTheme.whiteColor),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Side',
                        style: TextStyle(color: AppTheme.whiteColor),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Token',
                        style: TextStyle(color: AppTheme.whiteColor),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Amount',
                        style: TextStyle(color: AppTheme.whiteColor),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Total',
                        style: TextStyle(color: AppTheme.whiteColor),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Status',
                        style: TextStyle(color: AppTheme.whiteColor),
                      ),
                    ),
                  ], rows: [
                    DataRow(cells: [
                      DataCell(Text(
                        '2022-05-09 16:54',
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
                      DataCell(Text(
                        '0x6d3...a2d',
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
                      DataCell(Text(
                        '@0xbn9...c4k',
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
                      DataCell(Text(
                        'Out',
                        style: TextStyle(color: AppTheme.redColor),
                      )),
                      DataCell(Text(
                        'LUNA',
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
                      DataCell(Text(
                        '11',
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
                      DataCell(Text(
                        '701.8 USDT',
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
                      DataCell(Text(
                        'Filled',
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
                    ]),
                    DataRow(cells: [
                      DataCell(Text(
                        '2022-05-09 16:54',
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
                      DataCell(Text(
                        '0x6d3...a2d',
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
                      DataCell(Text(
                        '@0xbn9...c4k',
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
                      DataCell(Text(
                        'Out',
                        style: TextStyle(color: AppTheme.redColor),
                      )),
                      DataCell(Text(
                        'LUNA',
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
                      DataCell(Text(
                        '11',
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
                      DataCell(Text(
                        '701.8 USDT',
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
                      DataCell(Text(
                        'Filled',
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
                    ]),
                    DataRow(cells: [
                      DataCell(Text(
                        '2022-05-09 16:54',
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
                      DataCell(Text(
                        '0x6d3...a2d',
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
                      DataCell(Text(
                        '@0xbn9...c4k',
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
                      DataCell(Text(
                        'Out',
                        style: TextStyle(color: AppTheme.redColor),
                      )),
                      DataCell(Text(
                        'LUNA',
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
                      DataCell(Text(
                        '11',
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
                      DataCell(Text(
                        '701.8 USDT',
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
                      DataCell(Text(
                        'Filled',
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
                    ]),
                    DataRow(cells: [
                      DataCell(Text(
                        '2022-05-09 16:54',
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
                      DataCell(Text(
                        '0x6d3...a2d',
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
                      DataCell(Text(
                        '@0xbn9...c4k',
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
                      DataCell(Text(
                        'Out',
                        style: TextStyle(color: AppTheme.redColor),
                      )),
                      DataCell(Text(
                        'LUNA',
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
                      DataCell(Text(
                        '11',
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
                      DataCell(Text(
                        '701.8 USDT',
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
                      DataCell(Text(
                        'Filled',
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
                    ]),
                    DataRow(cells: [
                      DataCell(Text(
                        '2022-05-09 16:54',
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
                      DataCell(Text(
                        '0x6d3...a2d',
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
                      DataCell(Text(
                        '@0xbn9...c4k',
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
                      DataCell(Text(
                        'Out',
                        style: TextStyle(color: AppTheme.redColor),
                      )),
                      DataCell(Text(
                        'LUNA',
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
                      DataCell(Text(
                        '11',
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
                      DataCell(Text(
                        '701.8 USDT',
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
                      DataCell(Text(
                        'Filled',
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
