import 'package:app/app_theme.dart';
import 'package:app/models/attachment_model.dart';
import 'package:flutter/material.dart';

import 'file_icon.dart';

class AttachmentsListWidget extends StatelessWidget {
  final List<AttachmentModel> attatchments;
  const AttachmentsListWidget(this.attatchments, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for (int fileIndex = 0; fileIndex < attatchments.length; fileIndex++)
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  width: 126,
                  color: AppTheme.greyColor,
                  child: Column(
                    children: [
                      SizedBox(
                        width: 98,
                        height: 98,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: FileIcon(
                            attatchments[fileIndex],
                            //size: const Size(30, 30),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          attatchments[fileIndex].caption.isEmpty
                              ? 'No caption'
                              : attatchments[fileIndex].caption,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
