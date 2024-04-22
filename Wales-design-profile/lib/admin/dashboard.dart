import 'package:app/admin/charts/property_detail_chart.dart';
import 'package:app/admin/charts/revenue_chart.dart';
import 'package:app/constants.dart';
import 'package:app/home_screens/wallet.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../app_theme.dart';
import '../side_menu.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with TickerProviderStateMixin {
  String firstName = '';
  String lastName = '';

  double progressValue = 50;
  late AnimationController controller;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);

    super.initState();
    getPrefs();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
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

  final List<ChartData> chartData = <ChartData>[
    ChartData(2001, 3.53, 3.3),
    ChartData(2002, 4.5, 5.4),
    ChartData(2003, 5, 2.65),
    ChartData(2004, 6.4, 2.62),
    ChartData(2005, 7.8, 1.99),
    ChartData(2006, 8.9, 1.44),
    ChartData(2007, 9.5, 2),
    ChartData(2008, 3.6, 1.56),
    ChartData(2009, 3.43, 2.1),
  ];
  final List<ChartData> wallerChartData = <ChartData>[
    ChartData(2001, 3.53, 3.3),
    ChartData(2002, 4.5, 5.4),
    ChartData(2003, 5, 2.65),
    ChartData(2004, 3.4, 2.62),
    ChartData(2005, 4.8, 1.99),
    ChartData(2006, 9.9, 1.44),
    ChartData(2007, 5.5, 2),
    ChartData(2008, 3.6, 1.56),
    ChartData(2009, 3.43, 2.1),
  ];
  final List<ChartData> activeUserChartData = <ChartData>[
    ChartData(2001, 3.53, 3.3),
    ChartData(2002, 4.5, 5.4),
    ChartData(2003, 3, 2.65),
    ChartData(2004, 1.4, 2.62),
    ChartData(2005, 2.8, 1.99),
    ChartData(2006, 6.9, 1.44),
    ChartData(2007, 3.5, 2),
    ChartData(2008, 8.6, 1.56),
    ChartData(2009, 6.43, 2.1),
  ];
  final List<ChartData> newUserChartData = <ChartData>[
    ChartData(2001, 3.53, 3.3),
    ChartData(2002, 4.5, 5.4),
    ChartData(2003, 3, 2.65),
    ChartData(2004, 3.4, 2.62),
    ChartData(2005, 4.8, 1.99),
    ChartData(2006, 6.9, 1.44),
    ChartData(2007, 4.5, 2),
    ChartData(2008, 1.6, 1.56),
    ChartData(2009, 8.43, 2.1),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.raisinColor,
      key: scaffoldKey,
      drawer: const SideMenu(),
      appBar: AppBar(
        backgroundColor: AppTheme.greyShadeColor,
        leading: GestureDetector(
            onTap: () {
              _scaffoldKey.currentState!.openDrawer();
            },
            child: const Icon(Icons.menu)),
        centerTitle: false,
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
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              Stack(
                children: [
                  SfCartesianChart(
                    plotAreaBorderWidth: 0,
                    backgroundColor: AppTheme.greyShadeColor,
                    margin: const EdgeInsets.symmetric(horizontal: 0),
                    primaryXAxis: const NumericAxis(isVisible: false),
                    primaryYAxis: const NumericAxis(isVisible: false),
                    series: <CartesianSeries>[
                      SplineAreaSeries<ChartData, int>(
                        dataSource: chartData,
                        xValueMapper: (ChartData data, _) => data.x,
                        yValueMapper: (ChartData data, _) => data.y,
                        borderWidth: 0,
                        color: AppTheme.kCustomgraphColor,
                      ),
                    ],
                  ),
                  const Positioned(
                      top: 20,
                      left: 20,
                      child: CircleAvatar(
                        child: Image(
                          image: ExactAssetImage('assets/users.png'),
                          fit: BoxFit.cover,
                        ),
                      )),
                  Positioned(
                      top: 60,
                      left: 20,
                      child: Text(
                        '17 2222',
                        style:
                            TextStyle(color: AppTheme.whiteColor, fontSize: 24),
                      )),
                  Positioned(
                      top: 90,
                      left: 20,
                      child: Row(
                        children: [
                          Text(
                            'Sessions',
                            style: TextStyle(color: AppTheme.whiteColor),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Image(
                              image: ExactAssetImage('assets/increase1.png'))
                        ],
                      )),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Stack(
                children: [
                  SfCartesianChart(
                    plotAreaBorderWidth: 0,
                    backgroundColor: AppTheme.greyShadeColor,
                    margin: const EdgeInsets.symmetric(horizontal: 0),
                    primaryXAxis: const NumericAxis(isVisible: false),
                    primaryYAxis: const NumericAxis(isVisible: false),
                    series: <CartesianSeries>[
                      SplineAreaSeries<ChartData, int>(
                        dataSource: wallerChartData,
                        xValueMapper: (ChartData data, _) => data.x,
                        yValueMapper: (ChartData data, _) => data.y,
                        borderWidth: 0,
                        color: AppTheme.kCustomLineargraphColor,
                      ),
                    ],
                  ),
                  const Positioned(
                      top: 20,
                      left: 20,
                      child: CircleAvatar(
                        child: Image(
                          image: ExactAssetImage('assets/dollar-sign.png'),
                          fit: BoxFit.cover,
                        ),
                      )),
                  Positioned(
                      top: 60,
                      left: 20,
                      child: Text(
                        '3900',
                        style:
                            TextStyle(color: AppTheme.whiteColor, fontSize: 24),
                      )),
                  Positioned(
                      top: 90,
                      left: 20,
                      child: Row(
                        children: [
                          Text(
                            'App Wallet User',
                            style: TextStyle(color: AppTheme.whiteColor),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Image(
                              image: ExactAssetImage('assets/increase1.png'))
                        ],
                      )),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Stack(
                children: [
                  SfCartesianChart(
                    plotAreaBorderWidth: 0,
                    backgroundColor: AppTheme.greyShadeColor,
                    margin: const EdgeInsets.symmetric(horizontal: 0),
                    primaryXAxis: const NumericAxis(isVisible: false),
                    primaryYAxis: const NumericAxis(isVisible: false),
                    series: <CartesianSeries>[
                      SplineAreaSeries<ChartData, int>(
                        dataSource: activeUserChartData,
                        xValueMapper: (ChartData data, _) => data.x,
                        yValueMapper: (ChartData data, _) => data.y,
                        borderWidth: 2,
                        borderColor: AppTheme.kCustomRedgraphColor,
                        color: AppTheme.kCustomRedgraphColor,
                      ),
                    ],
                  ),
                  const Positioned(
                      top: 20,
                      left: 20,
                      child: CircleAvatar(
                        child: Image(
                          image: ExactAssetImage('assets/user1.png'),
                          fit: BoxFit.cover,
                        ),
                      )),
                  Positioned(
                      top: 60,
                      left: 20,
                      child: Text(
                        '6000',
                        style:
                            TextStyle(color: AppTheme.whiteColor, fontSize: 24),
                      )),
                  Positioned(
                      top: 90,
                      left: 20,
                      child: Row(
                        children: [
                          Text(
                            'Active User',
                            style: TextStyle(color: AppTheme.whiteColor),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      )),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Stack(
                children: [
                  SfCartesianChart(
                    plotAreaBorderWidth: 0,
                    backgroundColor: AppTheme.greyShadeColor,
                    margin: const EdgeInsets.symmetric(horizontal: 0),
                    primaryXAxis: const NumericAxis(isVisible: false),
                    primaryYAxis: const NumericAxis(isVisible: false),
                    series: <CartesianSeries>[
                      SplineAreaSeries<ChartData, int>(
                        dataSource: newUserChartData,
                        xValueMapper: (ChartData data, _) => data.x,
                        yValueMapper: (ChartData data, _) => data.y,
                        borderWidth: 2,
                        borderColor: AppTheme.kCustomyellowgraphColor,
                        color: AppTheme.kCustomyellowgraphColor,
                      ),
                    ],
                  ),
                  const Positioned(
                      top: 20,
                      left: 20,
                      child: CircleAvatar(
                        child: Image(
                          image: ExactAssetImage('assets/newUser.png'),
                          fit: BoxFit.cover,
                        ),
                      )),
                  Positioned(
                      top: 60,
                      left: 20,
                      child: Text(
                        '500',
                        style:
                            TextStyle(color: AppTheme.whiteColor, fontSize: 24),
                      )),
                  Positioned(
                      top: 90,
                      left: 20,
                      child: Row(
                        children: [
                          Text(
                            'New User',
                            style: TextStyle(color: AppTheme.whiteColor),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      )),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: AppTheme.greyShadeColor),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Goal Overview',
                            style: TextStyle(
                                color: AppTheme.kCustomprogressColor,
                                fontSize: 18),
                          ),
                          Image(image: ExactAssetImage('assets/info.png')),
                        ],
                      ),
                    ),
                    Stack(
                      children: [
                        SizedBox(
                          width: 186,
                          height: 176,
                          child: CircularProgressIndicator(
                            color: AppTheme.kCustomprogressColor,
                            value: controller.value,
                            semanticsLabel: 'Circular progress indicator',
                          ),
                        ),
                        Positioned(
                            top: 60,
                            left: 60,
                            child: Text(
                              "${controller.value.toStringAsFixed(1)}%",
                              style: TextStyle(
                                  color: AppTheme.whiteColor, fontSize: 40),
                            )),
                      ],
                    ),
                    const Divider(
                      color: AppTheme.kCustomprogressColor,
                    ),
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Completed',
                                  style: TextStyle(
                                    color: AppTheme.whiteColor,
                                  ),
                                ),
                                Text(
                                  '786,817',
                                  style: TextStyle(color: AppTheme.whiteColor),
                                ),
                              ],
                            ),
                          ),
                          const VerticalDivider(
                            color: AppTheme.kCustomprogressColor,
                            thickness: 2,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Column(
                              children: [
                                Text(
                                  'In Progress',
                                  style: TextStyle(
                                    color: AppTheme.whiteColor,
                                  ),
                                ),
                                Text(
                                  '13,561',
                                  style: TextStyle(color: AppTheme.whiteColor),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding: const EdgeInsets.all(14),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: AppTheme.greyShadeColor),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Browser Statistics',
                        style:
                            TextStyle(color: AppTheme.whiteColor, fontSize: 18),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Google Chrome",
                          style: TextStyle(
                              color: AppTheme.whiteColor, fontSize: 14),
                        ),
                        Row(
                          children: [
                            Text(
                              "800",
                              style: TextStyle(
                                  color: AppTheme.whiteColor, fontSize: 14),
                            ),
                            const Image(
                              image: ExactAssetImage('assets/arrow-up.png'),
                              fit: BoxFit.cover,
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "73%",
                          style: TextStyle(
                              color: AppTheme.whiteColor, fontSize: 14),
                        ),
                        Text(
                          "13:1",
                          style: TextStyle(
                              color: AppTheme.whiteColor, fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          gradient: LinearGradient(colors: [
                            AppTheme.whiteColor,
                            AppTheme.kCustomLinearprogressColor,
                            AppTheme.kCustomLinearprogressColor,
                          ], stops: [
                            progressValue / 2,
                            progressValue,
                            progressValue,
                          ])),
                      child: const SizedBox(height: 5),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "opera",
                          style: TextStyle(
                              color: AppTheme.whiteColor, fontSize: 14),
                        ),
                        Row(
                          children: [
                            Text(
                              "-200",
                              style: TextStyle(
                                  color: AppTheme.whiteColor, fontSize: 14),
                            ),
                            const Image(
                              image: ExactAssetImage('assets/arrow-down.png'),
                              fit: BoxFit.cover,
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "8%",
                          style: TextStyle(
                              color: AppTheme.whiteColor, fontSize: 14),
                        ),
                        Text(
                          "13:1",
                          style: TextStyle(
                              color: AppTheme.whiteColor, fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          gradient: LinearGradient(colors: [
                            AppTheme.whiteColor,
                            AppTheme.kCustomLinearprogressColor,
                            AppTheme.kCustomLinearprogressColor,
                          ], stops: [
                            progressValue / 2,
                            progressValue,
                            progressValue,
                          ])),
                      child: const SizedBox(height: 5),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Firefox",
                          style: TextStyle(
                              color: AppTheme.whiteColor, fontSize: 14),
                        ),
                        Row(
                          children: [
                            Text(
                              "19%",
                              style: TextStyle(
                                  color: AppTheme.whiteColor, fontSize: 14),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Image(
                              image: ExactAssetImage('assets/arrow-up.png'),
                              fit: BoxFit.cover,
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "8%",
                          style: TextStyle(
                              color: AppTheme.whiteColor, fontSize: 14),
                        ),
                        Text(
                          "13:1",
                          style: TextStyle(
                              color: AppTheme.whiteColor, fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          gradient: LinearGradient(colors: [
                            AppTheme.whiteColor,
                            AppTheme.kCustomLinearprogressColor,
                            AppTheme.kCustomLinearprogressColor,
                          ], stops: [
                            progressValue / 2,
                            progressValue,
                            progressValue,
                          ])),
                      child: const SizedBox(height: 5),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Internet Explorer",
                          style: TextStyle(
                              color: AppTheme.whiteColor, fontSize: 14),
                        ),
                        Row(
                          children: [
                            Text(
                              "27%",
                              style: TextStyle(
                                  color: AppTheme.whiteColor, fontSize: 14),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Image(
                              image: ExactAssetImage('assets/arrow-down.png'),
                              fit: BoxFit.cover,
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "8%",
                          style: TextStyle(
                              color: AppTheme.whiteColor, fontSize: 14),
                        ),
                        Text(
                          "13:1",
                          style: TextStyle(
                              color: AppTheme.whiteColor, fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          gradient: LinearGradient(colors: [
                            AppTheme.whiteColor,
                            AppTheme.kCustomLinearprogressColor,
                            AppTheme.kCustomLinearprogressColor,
                          ], stops: [
                            progressValue / 2,
                            progressValue,
                            progressValue,
                          ])),
                      child: const SizedBox(height: 5),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(color: AppTheme.greyShadeColor),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Property Detail',
                        style: TextStyle(color: AppTheme.whiteColor),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 7,
                            backgroundColor: AppTheme.kCustomgraphColor,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Property Detail',
                            style: TextStyle(color: AppTheme.whiteColor),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const CircleAvatar(
                            radius: 7,
                            backgroundColor: AppTheme.kCustomRedgraphColor,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Property Detail',
                            style: TextStyle(color: AppTheme.whiteColor),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const PropertyDetailChart(),
                    ],
                  )),
              const SizedBox(
                height: 15,
              ),
              Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(color: AppTheme.greyShadeColor),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Revenue',
                        style: TextStyle(color: AppTheme.whiteColor),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'This Month',
                                style: TextStyle(color: AppTheme.whiteColor),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                '\$86,589',
                                style: TextStyle(
                                    color: AppTheme.greenColor, fontSize: 24),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Last Month',
                                style: TextStyle(color: AppTheme.whiteColor),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                '\$86,589',
                                style: TextStyle(
                                    color: AppTheme.whiteColor, fontSize: 24),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const RevenueChart(),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.y1);
  final int x;
  final double y;
  final double y1;
}
