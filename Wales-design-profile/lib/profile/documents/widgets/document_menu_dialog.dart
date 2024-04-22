import 'package:app/constants/typography.dart';
import 'package:app/profile/documents/widgets/document_delete_dialog.dart';
import 'package:app/profile/documents/widgets/document_record_sheet.dart';
import 'package:flutter/material.dart';

class DocumentMenu extends StatelessWidget {
  const DocumentMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) {
                    return const Wrap(
                      children: [
                        DocumentRecordSheet(),
                      ],
                    );
                  },
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'View Records',
                    style: poppinsMedium.copyWith(fontSize: 18),
                  ),
                  const Icon(Icons.folder_copy_outlined),
                ],
              ),
            ),
            const SizedBox(height: 15),
            const Divider(),
            const SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                showDialog(
                  context: context,
                  builder: (context) {
                    return const DocumentDeleteDialog();
                  },
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Delete Records',
                    style: poppinsMedium.copyWith(fontSize: 18),
                  ),
                  const Icon(Icons.delete_outline),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
