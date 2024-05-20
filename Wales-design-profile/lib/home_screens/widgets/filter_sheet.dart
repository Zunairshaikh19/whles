import 'package:flutter/material.dart';

class FilterSheet extends StatelessWidget {
  const FilterSheet({Key? key}) : super(key: key);

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
          // Add filter options here
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
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
