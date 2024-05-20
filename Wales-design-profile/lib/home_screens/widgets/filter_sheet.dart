import 'package:app/home_screens/tabs/all.dart';
import 'package:flutter/material.dart';

class FilterSheet extends StatefulWidget {
  FilterSheet({Key? key}) : super(key: key);

  @override
  State<FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends State<FilterSheet> {
  bool allSelected = false;

  bool singleFamilySelected = false;

  bool duplexSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            'Filter Options',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(height: 16),
          CheckboxListTile(
            title: Text('All'),
            value: allSelected,
            onChanged: (value) {
              setState(() {
                allSelected = value!;
              });
            },
          ),
          CheckboxListTile(
            title: Text('Single-Family'),
            value: singleFamilySelected,
            onChanged: (value) {
              setState(() {
                singleFamilySelected = value!;
              });
            },
          ),
          CheckboxListTile(
            title: Text('Duplex'),
            value: duplexSelected,
            onChanged: (value) {
              setState(() {
                duplexSelected = value!;
              });
            },
          ),
          SizedBox(height: 16),
          // Add filter options here
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              if (duplexSelected) {
                All(searchQuery: "Duplex");
              } else if (singleFamilySelected) {
                All(searchQuery: "Single-family");
              } else {
                All(searchQuery: "");
              }

              // Apply filter logic here
            },
            child: Text(
              'Apply Filters',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
