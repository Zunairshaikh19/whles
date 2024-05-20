import 'package:app/constants/typography.dart';
import 'package:app/home_screens/host_place.dart';
import 'package:app/models/most_viewed_model.dart';
import 'package:app/widgets/home_heading_widget.dart';
import 'package:app/widgets/list_grids/most_viewed_list.dart';
import 'package:app/widgets/list_grids/recently_renewed_list.dart';
import 'package:app/widgets/list_grids/trading_list.dart';
import 'package:app/widgets/trading_big_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../models/trading_model.dart';

class All extends StatefulWidget {
  var searchQuery = "";
  All({super.key, required this.searchQuery});

  @override
  State<All> createState() => _AllState();
}

class _AllState extends State<All> {
  final List<String> _homeCategory = [
    'All',
    'Urban',
    'Suburban',
    'Safe neighborhood',
    'Rate a ride',
    'Reviews'
  ];
  List<TradingModel> tradingList = [];
  List<MostViewedModel> mostViewList = [];
  List<TradingModel> filteredTradingList = [];
  List<MostViewedModel> filteredMostViewList = [];

  @override
  void initState() {
    super.initState();
    fetchtradingProperties();
    fetchmostViewProperties();
  }

  void fetchtradingProperties() async {
    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('property_details')
        .where('listType', isEqualTo: 'Trending')
        .get();
    setState(() {
      tradingList =
          snapshot.docs.map((doc) => TradingModel.fromFirestore(doc)).toList();
      filterProperties(context);
    });
  }

  void fetchmostViewProperties() async {
    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('property_details')
        .where('listType', isEqualTo: 'Most Viewed')
        .get();
    setState(() {
      mostViewList = snapshot.docs
          .map((doc) => MostViewedModel.fromFirestore(doc))
          .toList();
      filterProperties(context);
    });
  }

  void filterProperties(BuildContext context) {
    final query = widget.searchQuery.toLowerCase();
    if (query.isNotEmpty) {
      filteredTradingList = tradingList
          .where((property) =>
              property.title.toLowerCase().contains(query) ||
              property.location.toLowerCase().contains(query))
          .toList();
      filteredMostViewList = mostViewList
          .where((property) =>
              property.title.toLowerCase().contains(query) ||
              property.location.toLowerCase().contains(query))
          .toList();

      // Check if both filtered lists are empty
      if (filteredTradingList.isEmpty && filteredMostViewList.isEmpty) {
        // Delay the execution of showSnackBar() until after the current frame has finished building
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          // Show snack bar indicating no properties found
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('No properties found.'),
            ),
          );
        });
      }
    }
  }

  @override
  void didUpdateWidget(covariant All oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.searchQuery != widget.searchQuery) {
      filterProperties(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: filteredTradingList.isEmpty || widget.searchQuery.isEmpty
            ? Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SizedBox(
                      height: 40,
                      child: Row(
                        children: [
                          ...List.generate(
                            _homeCategory.length,
                            (index) => Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 6),
                              margin: const EdgeInsets.only(right: 20),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey.withOpacity(0.3)),
                              ),
                              child: Text(
                                _homeCategory[index],
                                style: poppinsRegular.copyWith(
                                  fontSize: 14,
                                  color: Colors.black.withOpacity(0.6),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const HomeHeadingWidget(
                    title: "Trending",
                    type: "trend",
                    showView: true,
                  ),
                  SizedBox(
                    height: 209,
                    child: MostViewedList(mostViewList: mostViewList),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const HomeHeadingWidget(
                    title: "Recently Renewed",
                    type: "trend",
                    showView: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 216,
                    child: RecentlyRenewedList(tradingList: tradingList),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const HomeHeadingWidget(
                    title: "Most Viewed",
                    type: "trend",
                    showView: true,
                  ),
                  SizedBox(
                    height: 209,
                    child: MostViewedList(mostViewList: mostViewList),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const HomeHeadingWidget(
                    title: "Trading",
                    type: "trend",
                    showView: true,
                  ),
                  SizedBox(
                    height: 218,
                    child: TradingList(tradingList: tradingList),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const HomeHeadingWidget(
                    title: "Pre-Trading",
                    type: "trend",
                    showView: true,
                  ),
                  SizedBox(
                    height: 218,
                    child: TradingList(tradingList: tradingList),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: tradingList.isNotEmpty
                        ? TradingBigCard(tradingList: tradingList[0]!)
                        : SizedBox(), // Or provide a placeholder widget when the list is empty
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: HostPlace(),
                  ),
                ],
              )
            : Column(
                children: [
                  const HomeHeadingWidget(
                    title: "Trading",
                    type: "trend",
                    showView: true,
                  ),
                  SizedBox(
                    height: 218,
                    child: TradingList(tradingList: tradingList),
                  ),
                ],
              ),
      ),
    );
  }
}
