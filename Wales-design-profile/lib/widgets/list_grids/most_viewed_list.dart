import 'package:app/models/most_viewed_model.dart';
import 'package:app/models/trading_model.dart';
import 'package:app/widgets/most_viewed_container.dart';
import 'package:flutter/material.dart';

import '../../home_screens/property_details.dart';

class MostViewedList extends StatelessWidget {
  final List<MostViewedModel> mostViewList;

  const MostViewedList({Key? key, required this.mostViewList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280, // Set the height of the container
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 12, top: 18),
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: mostViewList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: InkWell(
                onTap: () {
                  // Navigate to the desired screen when tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            PropertyDetails(propertyData: mostViewList[index])),
                  );
                },
                child:
                    MostViewedContainer(mostViewedList: mostViewList[index])),
          );
        },
      ),
    );
  }
}
