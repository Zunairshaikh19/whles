import 'package:app/home_screens/saved.dart';
import 'package:app/home_screens/tabs/all.dart';
import 'package:app/home_screens/widgets/filter_sheet.dart';

import 'package:flutter/material.dart';
import '../widgets/custom_text_field.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController searchController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;
  String greetings = "";

  // int currentIndex = 0;
  // String userUid = '';
  @override
  void initState() {
    super.initState();
    getUser();
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  void getUser() {
    // User? user = FirebaseAuth.instance.currentUser;
    // if (user != null) {
    //   setState(() {
    //     userUid = user.uid;
    //   });
    // }
  }

  final List<String> tabLabels = [
    'All',
    'Urban',
    'Suburban',
    "Safe neightborhood",
    "Rate a ride",
    "Reviews",
  ];

  void goTo() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return const Saved();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      // drawer: const SideMenu(),
      body: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              toolbarHeight: 40,
              //backgroundColor: AppTheme.greyColor,
              backgroundColor: Colors.white,
              // foregroundColor: AppTheme.backgroundColor,
              elevation: 0,
              expandedHeight: 130,
              floating: false,
              pinned: true,
              leadingWidth: 90,
              leading: Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 12),
                child: GestureDetector(
                  onTap: () {
                    // if (userUid == Constants.adminId) {
                    //   _scaffoldKey.currentState!.openDrawer();
                    // }
                  },
                  child: const Text(
                    'Explore',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, fontFamily: 'Poppins'),
                  ),
                ),
              ),
              actions: [
                GestureDetector(
                  onTap: goTo,
                  child: const Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Image(
                      image: ExactAssetImage(
                        'assets/heart.png',
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: SizedBox(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left:10,right:10),
                          child: CustomTextField(
                            controller: searchController,
                            hintText: "Search address, city, location",
                            isPass: true,
                            showIcon: true,
                            prefixIcon: 'assets/search-normal.png',
                            height: 48,
                            textInputType: TextInputType.text,
                            widget: InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return const FilterSheet();
                                  },
                                );
                              },
                              // onTap: () {
                              //   // Navigate to the desired screen when tapped
                              //   Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => ModalTrigger()),
                              //   );
                              // },
                              child: Image(image: ExactAssetImage('assets/setting-5.png')),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // bottom: PreferredSize(
              //     preferredSize: const Size(0, 30),
              //     child: TabBarWidget(
              //         tabWidget: List.generate(
              //           tabLabels.length,
              //           (index) {
              //             return Container(
              //               padding: const EdgeInsets.symmetric(horizontal: 20),
              //               decoration: BoxDecoration(
              //                   border: Border.all(
              //                       color: index == index
              //                           ? AppTheme.blackColor
              //                           : AppTheme
              //                               .kCustomTextFiledHintTextColor)),
              //               child: Tab(
              //                 child: Padding(
              //                   padding: const EdgeInsets.all(2.0),
              //                   child: Text(
              //                     tabLabels[index],
              //                     style: TextStyle(
              //                         color: AppTheme.blackColor,
              //                         fontSize: 10,
              //                         fontFamily: 'Poppins'),
              //                   ),
              //                 ),
              //               ),
              //             );
              //           },
              //         ),
              //         labelColor: AppTheme.whiteColor,
              //         iColor: AppTheme.greyColor)),
            ),
          ];
        },
        body: const All(),
      ),
    );
  }
}
