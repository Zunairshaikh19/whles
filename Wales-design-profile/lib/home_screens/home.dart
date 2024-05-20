import 'package:app/home_screens/saved.dart';
import 'package:app/home_screens/tabs/all.dart';
import 'package:app/home_screens/widgets/filter_sheet.dart';
import 'package:app/widgets/customfieldsearch.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widgets/custom_text_field.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController searchController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String searchQuery = "";

  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      setState(() {
        searchQuery = searchController.text;
      });
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void showFilterSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.8,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
          ),
          child: const FilterSheet(),
        );
      },
    );
  }

  void goTo() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return const Saved();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              toolbarHeight: 40,
              backgroundColor: Colors.white,
              elevation: 0,
              expandedHeight: 130,
              floating: false,
              pinned: true,
              leadingWidth: 90,
              leading: Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 12),
                child: GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'Explore',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),
              actions: [
                GestureDetector(
                  onTap: goTo,
                  child: const Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Image(
                      image: ExactAssetImage('assets/heart.png'),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: SizedBox(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: CustomFieldSearch(
                            controller: searchController,
                            hintText: "Search address, city, location",
                            isPass: false,
                            showIcon: true,
                            prefixIcon: 'assets/search-normal.png',
                            height: 48,
                            textInputType: TextInputType.text,
                            suffixIcon: InkWell(
                              onTap: showFilterSheet,
                              child: Image.asset('assets/setting-5.png'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ];
        },
        body: All(searchQuery: searchQuery),
      ),
    );
  }
}
