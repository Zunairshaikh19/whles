import 'package:app/constants/typography.dart';
import 'package:app/widgets/custom_buttons.dart';
import 'package:flutter/material.dart';

class FilterSheet extends StatefulWidget {
  const FilterSheet({super.key});

  @override
  State<FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends State<FilterSheet> {
  final List<String> _offerings = ['Available shares', 'Trading'];
  final List<String> _properties = ['Single Family', 'Duplex', 'Multi Family', 'Commercial'];
  final List<String> _occupancy = ['Leased', 'Under Renovation', 'Vacant'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.close),
              ),
              Text(
                'Filter',
                style: poppinsMedium.copyWith(fontSize: 20),
              ),
              const Icon(Icons.close, color: Colors.white),
            ],
          ),
          const SizedBox(height: 13),
          Text(
            'Offering',
            style: poppinsMedium.copyWith(fontSize: 20),
          ),
          const SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              height: 40,
              child: Row(
                children: [
                  ...List.generate(
                    _offerings.length,
                    (index) => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(60),
                      ),
                      child: Text(
                        _offerings[index],
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
          const SizedBox(height: 20),
          Text(
            'Property type',
            style: poppinsMedium.copyWith(fontSize: 20),
          ),
          const SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              height: 40,
              child: Row(
                children: [
                  ...List.generate(
                    _properties.length,
                    (index) => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(60),
                      ),
                      child: Text(
                        _properties[index],
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
          const SizedBox(height: 20),
          Text(
            'Occupancy',
            style: poppinsMedium.copyWith(fontSize: 20),
          ),
          const SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              height: 40,
              child: Row(
                children: [
                  ...List.generate(
                    _occupancy.length,
                    (index) => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(60),
                      ),
                      child: Text(
                        _occupancy[index],
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
          const Spacer(),
          PrimaryButton(
            title: 'Shown Results',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
