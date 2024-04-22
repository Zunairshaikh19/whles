import 'package:app/home_screens/property_details.dart';
import 'package:app/models/recently_renewed_model.dart';
import 'package:app/widgets/recently_renewed_container.dart';
import 'package:flutter/material.dart';

class RecentlyRenewedList extends StatelessWidget {
  const RecentlyRenewedList({super.key});

  @override
  Widget build(BuildContext context) {
    List<RecentlyRenewedModel> recentlyRenewedList = [
      RecentlyRenewedModel(
          'id', "assets/frame7.png", '23Bali Leassd', "\$34.4", "GA . Leased"),
      RecentlyRenewedModel(
          'id', "assets/frame7.png", '23Bali Leassd', "\$34.4", "GA . Leased"),
      RecentlyRenewedModel(
          'id', "assets/frame7.png", '23Bali Leassd', "\$34.4", "GA . Leased"),
      RecentlyRenewedModel(
          'id', "assets/frame7.png", '23Bali Leassd', "\$34.4", "GA . Leased"),
    ];
    return ListView.builder(
      padding: const EdgeInsets.only(left: 12, top: 18),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: recentlyRenewedList.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: InkWell(
            onTap: () {
              // Navigate to the desired screen when tapped
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PropertyDetails()),
              );
            },
            child: RecentlyRenewedContainer(
              recentlyRenewedList: recentlyRenewedList[index],
              // price: priceList[index]
            ),
          ),
        );
      },
    );
  }
}
