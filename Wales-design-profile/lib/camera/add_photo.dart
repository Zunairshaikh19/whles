// ignore_for_file: avoid_print, avoid_function_literals_in_foreach_calls

import 'dart:io';
import 'package:app/app_theme.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddPhoto extends StatefulWidget {
  final Function addPicture;
  final String? profileUrl;
  const AddPhoto(
    this.addPicture, {
    Key? key,
    this.profileUrl,
  }) : super(key: key);

  @override
  AddPhotoState createState() => AddPhotoState();
}

class AddPhotoState extends State<AddPhoto> {
  bool loading = false;
  File? pickedMedia;
  List<String> mediaFiles = [];
  final picker = ImagePicker();
  final myDuration = 1;
  String name = "";
  String profileURL = '';
  @override
  initState() {
    super.initState();
    setState(() {
      if (widget.profileUrl != null) {
        setState(() {
          profileURL = widget.profileUrl!;
        });
      }
    });
  }

  next() {}

  void addMedia() async {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Align(
          alignment: Alignment.center,
          child: Text("UPLOAD FROM ",
              style: TextStyle(
                  color: AppTheme.primaryColor, fontWeight: FontWeight.bold)),
        ),
        children: [
          GestureDetector(
            onTap: () => pickMedia("Camera"),
            child: ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.camera, color: AppTheme.primaryColor),
                  const SizedBox(width: 10),
                  Text("CAMERA",
                      style: TextStyle(
                          color: AppTheme.primaryColor,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          const Divider(
            endIndent: 12,
            indent: 12,
          ),
          GestureDetector(
            onTap: () => pickMedia("Gallery"),
            child: ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.picture_in_picture_alt_outlined,
                      color: AppTheme.primaryColor),
                  const SizedBox(width: 10),
                  Text("GALLERY",
                      style: TextStyle(
                          color: AppTheme.primaryColor,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void pickMedia(String from) async {
    Navigator.of(context).pop();
    final XFile? photo = await picker.pickImage(
        source: from == "Camera" ? ImageSource.camera : ImageSource.gallery,
        maxWidth: 200,
        maxHeight: 200,
        imageQuality: 100);
    if (photo != null) {
      pickedMedia = File(photo.path);
      setState(() {
        loading = true;
      });
      // uploadMedia(pickedMedia!);
    }
  }

  // void uploadMedia(File file) async {
  //   User? user = FirebaseAuth.instance.currentUser;
  //   if (user != null) {
  //     int now = Timestamp.now().microsecondsSinceEpoch;
  //     String id = "${user.uid}$now";
  //     final ref = FirebaseStorage.instance.ref().child('mediaFiles').child(id);
  //     UploadTask uploadTask = ref.putFile(file);
  //     String url = await (await uploadTask).ref.getDownloadURL();
  //     setState(() {
  //       profileURL = url;
  //       loading = false;
  //     });
  //     //setProfileImage(url);
  //     parsePicture(url);
  //   }
  // }

  void parsePicture(String u) {
    widget.addPicture(u);
  }

  abc() {}
  @override
  Widget build(BuildContext context) {
    return loading
        ? const Center(
            child: Text(
              "Loading....",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          )
        : profileURL.isEmpty
            ? GestureDetector(
                onTap: addMedia,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(
                      backgroundColor: AppTheme.whiteColor,
                      radius: 54,
                      child: Icon(
                        Icons.person_sharp,
                        size: 48,
                        color: AppTheme.primaryColor,
                      ),
                    ),
                    Positioned(
                      top: 2,
                      right: -2,
                      child: CircleAvatar(
                        radius: 22,
                        backgroundColor: AppTheme.primaryColor,
                        child: Icon(
                          Icons.add_a_photo,
                          color: AppTheme.whiteColor,
                          size: 22,
                        ),
                      ),
                    )
                  ],
                ),
              )
            : GestureDetector(
                onTap: addMedia,
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 64,
                      backgroundImage: NetworkImage(profileURL),
                    ),
                    Positioned(
                        top: 2,
                        right: -2,
                        child: CircleAvatar(
                            radius: 22,
                            backgroundColor: AppTheme.primaryColor,
                            child: Icon(
                              Icons.add_a_photo,
                              color: AppTheme.whiteColor,
                            )))
                  ],
                ),
              );
  }
}
