import 'package:app/constants/app_colors.dart';
import 'package:app/constants/typography.dart';
import 'package:app/widgets/custom_buttons.dart';
import 'package:flutter/material.dart';

class DocumentDeleteDialog extends StatelessWidget {
  const DocumentDeleteDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      content: SizedBox(
        height: 160,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Are you sure you want to delete “ Document Name “ ?',
              style: poppinsBold.copyWith(fontSize: 15, color: AppColors.blackLight),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 11),
            Text(
              'Note: Once you delete a document you can not retrieve it back.',
              style: poppinsRegular.copyWith(fontSize: 11),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: PrimaryButton(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    height: 40,
                    title: 'Cancel',
                    textStyle:
                        poppinsMedium.copyWith(fontSize: 15, color: AppColors.blackLight, fontWeight: FontWeight.w600),
                    bgColor: AppColors.primaryColor.withOpacity(0.45),
                    borderColor: Colors.black,
                    borderRadius: 6,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: PrimaryButton(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    height: 40,
                    title: 'Delete',
                    textStyle: poppinsMedium.copyWith(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w600),
                    bgColor: AppColors.redColor,
                    borderColor: Colors.black,
                    borderRadius: 6,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
