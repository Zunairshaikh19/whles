import 'package:app/app_theme.dart';
import 'package:app/constants.dart';
import 'package:app/home_screens/picker/picker_widget.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import '../models/attachment_model.dart';

class UploadFiles extends StatefulWidget {
  const UploadFiles({super.key});

  @override
  State<UploadFiles> createState() => _UploadFilesState();
}

class _UploadFilesState extends State<UploadFiles> {
  bool loading = false;
  List<AttachmentModel> attachments = [];
  void onFilesPicked(List<AttachmentModel> files) {
    setState(() {
      attachments = files;
    });
  }

  // void done() async {
  //   if (loading) {
  //     return;
  //   }
  //   User? user = FirebaseAuth.instance.currentUser;
  //   if (user == null) {
  //     return;
  //   }
  //   if (attachments.isEmpty) {
  //     showMessage("Please select files to upload");
  //     return;
  //   }
  //   setState(() {
  //     loading = true;
  //   });
  //   try {
  //     bool error = false;
  //     for (AttachmentModel attachment in attachments) {
  //       attachment.id = FirebaseFirestore.instance
  //           .collection('profile')
  //           .doc(user.uid)
  //           .collection('files')
  //           .doc()
  //           .id;
  //       String url = "UserFiles/${attachment.id}/files";
  //       String downloadURL = await Constants.uploadMedia(
  //         attachment,
  //         attachment.id,
  //         url,
  //       );
  //       if (downloadURL.isEmpty) {
  //         setState(() {
  //           loading = false;
  //         });
  //         showMessage("Failed to upload group picture");
  //         error = true;
  //         break;
  //       }
  //       await FirebaseFirestore.instance
  //           .collection('profile')
  //           .doc(user.uid)
  //           .collection('files')
  //           .doc(attachment.id)
  //           .set({
  //         'fileName': attachment.name,
  //         'fileURL': downloadURL,
  //         'timestamp': FieldValue.serverTimestamp(),
  //       });
  //     }
  //     if (error) {
  //       return;
  //     }
  //     goBack();
  //   } catch (_) {
  //     showMessage("Error, please try again later");
  //   } finally {
  //     setState(() {
  //       loading = false;
  //     });
  //   }
  // }

  void goBack() {
    Navigator.of(context).pop();
  }

  void showMessage(String message) {
    Constants.showMessage(context, message);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.raisinColor,
      appBar: AppBar(
        backgroundColor: AppTheme.greyShadeColor,
        title: const Text("Upload files"),
      ),
      body: loading
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Card(
                    color: AppTheme.greyShadeColor,
                    child: ListTile(
                      title: Text(
                        "Uploading files to",
                        style: TextStyle(color: AppTheme.whiteColor),
                      ),
                      subtitle: const Text(''),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: attachments.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            onTap: () {
                              OpenFile.open(attachments[index].url);
                            },
                            title: Text(attachments[index].name),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
      bottomNavigationBar: BottomAppBar(
        color: AppTheme.greyShadeColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PickerWidget(
              cameraAllowed: false,
              galleryAllowed: true,
              videoAllowed: false,
              filesAllowed: true,
              multipleAllowed: true,
              memoAllowed: false,
              attachments: attachments,
              onFilesPicked: onFilesPicked,
              captionAllowed: false,
              child: Text(
                "Select files to upload",
                style: TextStyle(
                  color: AppTheme.whiteColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "Done",
                style: TextStyle(color: AppTheme.blackColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
