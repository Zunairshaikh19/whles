import 'dart:io';

import 'package:app/constants.dart';
import 'package:app/widgets/camera_grid_screen.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../app_theme.dart';
import '../home_screens/picker/picker_widget.dart';
import '../models/attachment_model.dart';
import '../models/drop_down_menu_data.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/drop_down_menu.dart';
import 'profileInfo.dart';

class UploadProperty extends StatefulWidget {
  final String type;
  const UploadProperty(this.type, {super.key});

  @override
  State<UploadProperty> createState() => _UploadPropertyState();
}

class _UploadPropertyState extends State<UploadProperty> {
  TextEditingController propertyNameController = TextEditingController();
  TextEditingController enterRoomController = TextEditingController();
  TextEditingController houseSizeController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController rentController = TextEditingController();
  TextEditingController operatingExpenseController = TextEditingController();
  TextEditingController chargeInCashController = TextEditingController();
  TextEditingController shareAveragePriceController = TextEditingController();
  TextEditingController shareSoldController = TextEditingController();
  TextEditingController sharesLeftController = TextEditingController();
  TextEditingController averagePurchaseController = TextEditingController();
  TextEditingController capacityController = TextEditingController();

  TextEditingController areaController = TextEditingController();
  TextEditingController categoryController = TextEditingController();

  DropDownMenuData propertyType = Constants.propertyTypes[0];
  DropDownMenuData selectedType = DropDownMenuData("Type ...", "");
  DropDownMenuData categoryType = Constants.categoryTypes[0];
  DropDownMenuData selectedCategory = DropDownMenuData("Category ...", "");

  String profileURL = '';
  bool loading = false;
  File? pickedMedia;
  List<String> mediaFiles = [];
  List<XFile> photos = [];
  String firstName = '';
  String lastName = '';

  List<String> imagesList = [];
  final picker = ImagePicker();
  @override
  void initState() {
    super.initState();
    getPrefs();
  }

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
  //           .collection('property')
  //           .doc()
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
  //           .collection('property')
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

  void getPrefs() async {
    SharedPreferences prefs = await Constants.getPrefs();
    setState(() {
      firstName = prefs.getString("firstName") ?? '';
      lastName = prefs.getString("lastName") ?? '';

      // profileUrl = prefs.getString("profileUrl") ?? Constants.noImage;
      // email = prefs.getString("email") ?? '';
    });
  }

  void getValues(String type, String value) {
    if (type == "categoryType") {
      setState(
        () {
          categoryType.value = value;
        },
      );
    }
  }

  bool checkCredentials() {
    bool result = false;
    if (propertyNameController.text.isEmpty) {
      Constants.showMessage(context, "Please add property name");
    } else if (enterRoomController.text.isEmpty) {
      Constants.showMessage(context, "Please enter room");
    } else if (houseSizeController.text.isEmpty) {
      Constants.showMessage(context, "Please enter house size");
    } else if (locationController.text.isEmpty) {
      Constants.showMessage(context, "Please enter location");
    } else if (areaController.text.isEmpty) {
      Constants.showMessage(context, "Please enter area");
    } else if (capacityController.text.isEmpty) {
      Constants.showMessage(context, "Please enter capacity");
    } else if (categoryType.value.isEmpty) {
      Constants.showMessage(context, "Please enter category");
    } else if (mediaFiles.isEmpty) {
      Constants.showMessage(context, "Please enter images");
    } else if (operatingExpenseController.text.isEmpty) {
      Constants.showMessage(context, "Please enter operation expenses");
    } else {
      result = true;
    }
    return result;
  }

  void addMedia() async {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Align(
          alignment: Alignment.center,
          child: Text("UPLOAD FROM ",
              style: TextStyle(
                  color: AppTheme.blackColor, fontWeight: FontWeight.bold)),
        ),
        children: [
          GestureDetector(
            onTap: () => pickMedia("Camera"),
            child: ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.camera, color: AppTheme.blackColor),
                  const SizedBox(width: 10),
                  Text("CAMERA",
                      style: TextStyle(
                          color: AppTheme.blackColor,
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
            child: const ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.picture_in_picture_alt_outlined,
                      color: AppTheme.kCustomCryptoTextColor),
                  SizedBox(width: 10),
                  Text("GALLERY",
                      style: TextStyle(
                          color: AppTheme.kCustomCryptoTextColor,
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
        maxWidth: Constants.imageSize.width,
        maxHeight: Constants.imageSize.height);
    if (photo != null) {
      pickedMedia = File(photo.path);

      // uploadMedia(pickedMedia!);
      photos.add(photo);

      imagesList.add(pickedMedia!.path);
    }
  }

  // void uploadMedia(File file) async {
  //   User? user = FirebaseAuth.instance.currentUser;
  //   if (user != null) {
  //     setState(() {
  //       loading = true;
  //     });
  //     int now = Timestamp.now().microsecondsSinceEpoch;
  //     String id = "${user.uid}$now";
  //     final ref = FirebaseStorage.instance.ref().child('mediaFiles').child(id);
  //     UploadTask uploadTask = ref.putFile(file);
  //     String url = await (await uploadTask).ref.getDownloadURL();
  //     if (profileURL.isEmpty) {
  //       // await setFoodProfileImage(url);

  //       imagesList.add(url);
  //       mediaFiles.add(url);
  //     }
  //     // saveImageLink(url);
  //   }
  // }

  // void saveImageLink(String url) async {
  //   User? user = FirebaseAuth.instance.currentUser;
  //   if (user != null) {
  //     await FirebaseFirestore.instance
  //         .collection("UserFoodMediaFiles")
  //         .add({'userID': user.uid, 'url': url}).then((value) {
  //       setState(() {
  //         mediaFiles.add(url);
  //         loading = false;
  //       });
  //       //getUserMediaFiles();
  //     }).catchError(
  //       (onError) {
  //         print(onError.toString());
  //       },
  //     );
  //   }
  // }

  // Future<void> saveProperty() async {
  //   User? user = FirebaseAuth.instance.currentUser;
  //   SharedPreferences prefs = await Constants.getPrefs();
  //   if (user == null) {
  //     return;
  //   }

  //   await FirebaseFirestore.instance.collection("property").doc().set(
  //     {
  //       'cardImage': mediaFiles.first,
  //       'mediaImages': mediaFiles,
  //       'propertyName': propertyNameController.text.trim(),
  //       'room': enterRoomController.text.trim(),
  //       'houseSize': houseSizeController.text.trim(),
  //       'location': locationController.text.trim(),
  //       'propertyType': widget.type,
  //       'operatingExpense': operatingExpenseController.text.trim(),
  //       //'chargeInCash': chargeInCashController.text.trim(),
  //       //  'shareAveragePrice': shareAveragePriceController.text.trim(),
  //       'category': categoryType.value,
  //       'capacity': capacityController.text.trim(),
  //       'area': areaController.text.trim(),

  //       // 'sharesSold': shareSoldController.text.trim(),
  //       // 'sharesLeft': sharesLeftController.text.trim(),
  //       // 'averagePurchase': averagePurchaseController.text.trim(),
  //     },
  //     SetOptions(merge: true),
  //   ).then((value) {
  //     done();
  //     Navigator.of(context).pop();
  //     setState(() {
  //       //  mediaFiles.add(url);
  //     });
  //   }).catchError(
  //     (onError) {
  //       print(onError.toString());
  //     },
  //   );
  // }

  void goTo() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return const ProfileInfo();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.raisinColor,
      appBar: AppBar(
        backgroundColor: AppTheme.greyShadeColor,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios,
            size: 18,
            color: AppTheme.whiteColor,
          ),
        ),
        centerTitle: false,
        title: Text(
          'Add Property',
          style: TextStyle(color: AppTheme.whiteColor),
        ),
        actions: [
          Text(
            'English',
            style: TextStyle(fontSize: 14, color: AppTheme.whiteColor),
          ),
          const SizedBox(
            width: 10,
          ),
          const Image(
            image: ExactAssetImage('assets/bell.png'),
          ),
          const SizedBox(
            width: 10,
          ),
          const Image(
            image: ExactAssetImage('assets/search.png'),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$firstName $lastName",
                style: TextStyle(fontSize: 10, color: AppTheme.whiteColor),
              ),
              Text(
                'Available',
                style: TextStyle(fontSize: 10, color: AppTheme.whiteColor),
              ),
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: goTo,
            child: const Image(
              image: ExactAssetImage('assets/account1.png'),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              CustomTextField(
                controller: propertyNameController,
                prefixIcon: '',
                hintText: 'Property Name',
                hintTextColor: AppTheme.whiteColor,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                controller: enterRoomController,
                prefixIcon: '',
                maxlines: 1,
                hintText: 'Enter Room',
                hintTextColor: AppTheme.whiteColor,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                controller: houseSizeController,
                prefixIcon: '',
                hintText: 'house Size',
                hintTextColor: AppTheme.whiteColor,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                controller: locationController,
                prefixIcon: '',
                hintText: 'Location',
                hintTextColor: AppTheme.whiteColor,
              ),
              const SizedBox(
                height: 15,
              ),

              // CustomTextField(
              //   controller: operatingExpenseController,
              //   prefixIcon: '',
              //   hintText: 'Charge In Cash',
              //   hintTextColor: AppTheme.whiteColor,
              // ),
              // const SizedBox(
              //   height: 15,
              // ),
              // const SizedBox(
              //   height: 15,
              // ),
              CustomTextField(
                controller: areaController,
                prefixIcon: '',
                hintText: 'Area',
                hintTextColor: AppTheme.whiteColor,
              ),
              const SizedBox(
                height: 15,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                controller: capacityController,
                prefixIcon: '',
                hintText: 'Capacity',
                hintTextColor: AppTheme.whiteColor,
              ),
              const SizedBox(
                height: 15,
              ),
              // CustomTextField(
              //   controller: categoryController,
              //   prefixIcon: '',
              //   hintText: 'Category',
              //   hintTextColor: AppTheme.whiteColor,
              // ),
              Container(
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                    border: Border.all(color: AppTheme.whiteColor)),
                child: DropDownMenu(
                    getValues,
                    "Category Type",
                    Icon(
                      Icons.cast_for_education_sharp,
                      color: AppTheme.whiteColor,
                    ),
                    Constants.categoryTypes,
                    categoryType,
                    "categoryType"),
              ),
              const SizedBox(
                height: 15,
              ),
              // const SizedBox(
              //   height: 15,
              // ),

              Stack(
                children: [
                  GestureDetector(
                    onTap: addMedia,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 220,
                      decoration: mediaFiles.isNotEmpty
                          ? BoxDecoration(
                              color: AppTheme.blackColor,
                              image: DecorationImage(
                                image: NetworkImage(mediaFiles.first),
                                fit: BoxFit.cover,
                              ))
                          : BoxDecoration(
                              color: AppTheme.blackColor,
                            ),
                    ),
                  ),
                  Positioned(
                    top: 90,
                    left: MediaQuery.of(context).size.width / 3.2,
                    child: GestureDetector(
                      onTap: addMedia,
                      child: const Column(
                        children: [
                          Image(
                            image: ExactAssetImage(
                              'assets/camera2.png',
                            ),
                            fit: BoxFit.cover,
                          ),
                          Text(
                            'Upload front page',
                            style: TextStyle(
                                color: AppTheme.kCustompropertyTextColor),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              CameraGridScreen(addMedia, mediaFiles),
              const SizedBox(
                height: 15,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: attachments.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: AppTheme.greyShadeColor,
                    child: ListTile(
                      onTap: () {
                        OpenFile.open(attachments[index].url);
                      },
                      title: Text(
                        attachments[index].name,
                        style: TextStyle(color: AppTheme.whiteColor),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 15,
              ),
              CustomButton(
                isButtonEnable: false,
                height: 56,
                onPress: () {},
                text: "Upload",
                fontSize: 16,
                fontColor: AppTheme.blackColor,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
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
            // ElevatedButton(
            //   onPressed: done,
            //   child: Text(
            //     "Done",
            //     style: TextStyle(color: AppTheme.blackColor),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
