import 'package:app/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../app_theme.dart';
import '../widgets/custom_button.dart';

class DocumentApproval extends StatefulWidget {
  const DocumentApproval({super.key});

  @override
  State<DocumentApproval> createState() => _DocumentApprovalState();
}

class _DocumentApprovalState extends State<DocumentApproval> {
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
          'Document Approval',
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
                        'DcId_no',
                        style: TextStyle(color: AppTheme.whiteColor),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Legal_name',
                        style: TextStyle(color: AppTheme.whiteColor),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Upload ID Images',
                        style: TextStyle(color: AppTheme.whiteColor),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Address',
                        style: TextStyle(color: AppTheme.whiteColor),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Approved',
                        style: TextStyle(color: AppTheme.whiteColor),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Rejected',
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
                      DataCell(Container(
                        width: 120,
                        height: 36,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppTheme.kCustomGreyContainerColor,
                        ),
                      )),
                      DataCell(Text(
                        'This is Address',
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
                      DataCell(
                        CustomButton(
                          isButtonEnable: false,
                          height: 36,
                          width: MediaQuery.of(context).size.width / 2.3,
                          onPress: () {},
                          text: "Approved",
                          fontSize: 16,
                          fontColor: AppTheme.blackColor,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                          containerColor: AppTheme.greenColor,
                        ),
                      ),
                      DataCell(
                        CustomButton(
                          isButtonEnable: false,
                          height: 36,
                          width: MediaQuery.of(context).size.width / 2.3,
                          onPress: () {},
                          text: "Rejected",
                          fontSize: 16,
                          fontColor: AppTheme.blackColor,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                          containerColor: AppTheme.redColor,
                        ),
                      ),
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
                      DataCell(Container(
                        width: 120,
                        height: 36,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppTheme.kCustomGreyContainerColor,
                        ),
                      )),
                      DataCell(Text(
                        'This is Address',
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
                      DataCell(
                        CustomButton(
                          isButtonEnable: false,
                          height: 36,
                          width: MediaQuery.of(context).size.width / 2.3,
                          onPress: () {},
                          text: "Approved",
                          fontSize: 16,
                          fontColor: AppTheme.blackColor,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                          containerColor: AppTheme.greenColor,
                        ),
                      ),
                      DataCell(
                        CustomButton(
                          isButtonEnable: false,
                          height: 36,
                          width: MediaQuery.of(context).size.width / 2.3,
                          onPress: () {},
                          text: "Rejected",
                          fontSize: 16,
                          fontColor: AppTheme.blackColor,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                          containerColor: AppTheme.redColor,
                        ),
                      ),
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
                      DataCell(Container(
                        width: 120,
                        height: 36,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppTheme.kCustomGreyContainerColor,
                        ),
                      )),
                      DataCell(Text(
                        'This is Address',
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
                      DataCell(
                        CustomButton(
                          isButtonEnable: false,
                          height: 36,
                          width: MediaQuery.of(context).size.width / 2.3,
                          onPress: () {},
                          text: "Approved",
                          fontSize: 16,
                          fontColor: AppTheme.blackColor,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                          containerColor: AppTheme.greenColor,
                        ),
                      ),
                      DataCell(
                        CustomButton(
                          isButtonEnable: false,
                          height: 36,
                          width: MediaQuery.of(context).size.width / 2.3,
                          onPress: () {},
                          text: "Rejected",
                          fontSize: 16,
                          fontColor: AppTheme.blackColor,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                          containerColor: AppTheme.redColor,
                        ),
                      ),
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
                      DataCell(Container(
                        width: 120,
                        height: 36,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppTheme.kCustomGreyContainerColor,
                        ),
                      )),
                      DataCell(Text(
                        'This is Address',
                        style: TextStyle(color: AppTheme.whiteColor),
                      )),
                      DataCell(
                        CustomButton(
                          isButtonEnable: false,
                          height: 36,
                          width: MediaQuery.of(context).size.width / 2.3,
                          onPress: () {},
                          text: "Approved",
                          fontSize: 16,
                          fontColor: AppTheme.blackColor,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                          containerColor: AppTheme.greenColor,
                        ),
                      ),
                      DataCell(
                        CustomButton(
                          isButtonEnable: false,
                          height: 36,
                          width: MediaQuery.of(context).size.width / 2.3,
                          onPress: () {},
                          text: "Rejected",
                          fontSize: 16,
                          fontColor: AppTheme.blackColor,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                          containerColor: AppTheme.redColor,
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
