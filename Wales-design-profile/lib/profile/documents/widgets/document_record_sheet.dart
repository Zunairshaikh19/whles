import 'package:app/constants/typography.dart';
import 'package:flutter/material.dart';

class DocumentRecordSheet extends StatelessWidget {
  const DocumentRecordSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Document Heading',
                style: poppinsBold.copyWith(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.close),
              ),
            ],
          ),
          const SizedBox(height: 25),
          Text(
            '1. Types data we collect',
            style: poppinsBold.copyWith(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 11),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident.',
            style: poppinsRegular.copyWith(fontSize: 11),
          ),
          const SizedBox(height: 20),
          Text(
            'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident.',
            style: poppinsRegular.copyWith(fontSize: 11),
          ),
          const SizedBox(height: 17),
          Text(
            '2. Use of your personal data',
            style: poppinsBold.copyWith(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Text(
            'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit.',
            style: poppinsRegular.copyWith(fontSize: 11),
          ),
          const SizedBox(height: 20),
          Text(
            'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident.',
            style: poppinsRegular.copyWith(fontSize: 11),
          ),
          const SizedBox(height: 17),
          Text(
            '3. Disclosure of your personal data',
            style: poppinsBold.copyWith(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Text(
            'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus.',
            style: poppinsRegular.copyWith(fontSize: 11),
          ),
          const SizedBox(height: 20),
          Text(
            'Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. ',
            style: poppinsRegular.copyWith(fontSize: 11),
          ),
        ],
      ),
    );
  }
}
