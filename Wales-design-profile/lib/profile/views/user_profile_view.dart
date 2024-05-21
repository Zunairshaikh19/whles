import 'dart:io';

import 'package:app/constants.dart';
import 'package:app/constants/app_colors.dart';
import 'package:app/constants/strings.dart';
import 'package:app/constants/typography.dart';
import 'package:app/widgets/custom_buttons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Global/variable.dart';

class UserProfileView extends StatefulWidget {
  const UserProfileView({Key? key}) : super(key: key);

  @override
  _UserProfileViewState createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  late Future<Map<String, dynamic>?> userDataFuture;
  late GoogleSignIn _googleSignIn;
  File? _image;
  PickedFile? _pickedFile; // Initialize _pickedFile as PickedFile or null
  bool isEditingName = false;
  bool isEditingEmail = false;
  bool isEditingPassword = false;
  String _pass = "";
  String _email = "";
  String _name = "";
  String? profilePicture = "";

  @override
  void initState() {
    super.initState();
    _googleSignIn = GoogleSignIn(scopes: ['email']);
    userDataFuture = getUserData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<Map<String, dynamic>?> getUserDataFromFirestore(String userId) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      DocumentReference userDocRef = firestore.collection('users').doc(userId);
      DocumentSnapshot userDoc = await userDocRef.get();
      Map<String, dynamic>? userData = userDoc.data() as Map<String, dynamic>?;
      SharedPreferences prefs = await Constants.getPrefs();
      if (userDoc.exists) {
        print(userDoc.data());
        profilePicture = userData!['profilePicture'];
        prefs.setString("displayName", userData['displayName']);
        return userDoc.data()
            as Map<String, dynamic>?; // Cast to the correct type
      } else {
        print('User document does not exist');
        return null;
      }
    } catch (e) {
      print('Error fetching user data: $e');
      return null;
    }
  }

  Future<Map<String, dynamic>?> getUserData() async {
    String userId = SaveduserId; // Replace with your logic to get the user ID
    return getUserDataFromFirestore(userId);
  }

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (_pickedFile != null) {
      // Check if _pickedFile is not null
      await _googleSignIn.signIn();
      GoogleSignInAccount? user = _googleSignIn.currentUser;

      if (user != null) {
        String displayName = user.displayName ?? "";
        String email = user.email;
        String userId = user.id;

        FirebaseFirestore firestore = FirebaseFirestore.instance;
        DocumentReference userDocRef =
            firestore.collection('users').doc(userId);

        String imagePath = 'users/$userId/profilePicture.jpg';
        Reference storageReference =
            FirebaseStorage.instance.ref().child(imagePath);

        UploadTask uploadTask =
            storageReference.putFile(File(pickedFile!.path));
        TaskSnapshot snapshot = await uploadTask;
        String downloadUrl = await snapshot.ref.getDownloadURL();
        SharedPreferences prefs = await Constants.getPrefs();
        var dName = prefs.getString("displayName");
        _pass == ""
            ? await userDocRef.set({
                'displayName': _name == '' ? dName : _name,
                'email': _email = email,
                'userId': userId,
                'profilePicture': downloadUrl,
              })
            : await userDocRef.set({
                'displayName': _name == '' ? dName : _name,
                'email': _email = email,
                'userId': userId,
                'password': _pass,
                'profilePicture': downloadUrl,
              });
        Navigator.pop(context);
      }
    } else {
      await _googleSignIn.signIn();
      GoogleSignInAccount? user = _googleSignIn.currentUser;

      if (user != null) {
        String displayName = user.displayName ?? "";
        String email = user.email ?? "";
        String userId = user.id;

        FirebaseFirestore firestore = FirebaseFirestore.instance;
        DocumentReference userDocRef =
            firestore.collection('users').doc(userId);

        String imagePath = 'users/$userId/profilePicture.jpg';
        Reference storageReference =
            FirebaseStorage.instance.ref().child(imagePath);

        UploadTask uploadTask =
            storageReference.putFile(File(pickedFile!.path));
        TaskSnapshot snapshot = await uploadTask;
        String downloadUrl = await snapshot.ref.getDownloadURL();
        SharedPreferences prefs = await Constants.getPrefs();
        var dName = prefs.getString("displayName");
        _pass == false
            ? await userDocRef.set({
                'displayName': _name == '' ? dName : _name,
                'email': _email = email,
                'userId': userId,
                'profilePicture': downloadUrl,
              })
            : await userDocRef.set({
                'displayName': _name == '' ? dName : _name,
                'email': _email = email,
                'userId': userId,
                'password': _pass,
                'profilePicture': downloadUrl,
              });
        Navigator.pop(context);
      }
    }
  }

  Future<void> _saveImg(File imageFile, PickedFile? pickedFile) async {
    try {
      if (_pickedFile != null) {
        // Check if _pickedFile is not null
        await _googleSignIn.signIn();
        GoogleSignInAccount? user = _googleSignIn.currentUser;

        if (user != null) {
          String displayName = user.displayName ?? "";
          String email = user.email ?? "";
          String userId = user.id;

          FirebaseFirestore firestore = FirebaseFirestore.instance;
          DocumentReference userDocRef =
              firestore.collection('users').doc(userId);

          String imagePath = 'users/$userId/profilePicture.jpg';
          Reference storageReference =
              FirebaseStorage.instance.ref().child(imagePath);

          UploadTask uploadTask =
              storageReference.putFile(File(pickedFile!.path));
          TaskSnapshot snapshot = await uploadTask;
          String downloadUrl = await snapshot.ref.getDownloadURL();
          _pass == null
              ? await userDocRef.set({
                  'displayName': _name ?? displayName,
                  'email': _email = email,
                  'userId': userId,
                  'profilePicture': downloadUrl,
                })
              : await userDocRef.set({
                  'displayName': _name ?? displayName,
                  'email': _email = email,
                  'userId': userId,
                  'password': _pass ?? "",
                  'profilePicture': downloadUrl,
                });
          Navigator.pop(context);
        }
      } else {
        await _googleSignIn.signIn();
        GoogleSignInAccount? user = _googleSignIn.currentUser;

        if (user != null) {
          String displayName = user.displayName ?? "";
          String email = user.email ?? "";
          String userId = user.id;

          FirebaseFirestore firestore = FirebaseFirestore.instance;
          DocumentReference userDocRef =
              firestore.collection('users').doc(userId);

          String imagePath = 'users/$userId/profilePicture.jpg';
          Reference storageReference =
              FirebaseStorage.instance.ref().child(imagePath);

          UploadTask uploadTask =
              storageReference.putFile(File(pickedFile!.path));
          TaskSnapshot snapshot = await uploadTask;
          String downloadUrl = await snapshot.ref.getDownloadURL();
          _pass == null
              ? await userDocRef.set({
                  'displayName': _name ?? displayName,
                  'email': _email = email,
                  'userId': userId,
                  'profilePicture': downloadUrl,
                })
              : await userDocRef.set({
                  'displayName': _name ?? displayName,
                  'email': _email = email,
                  'userId': userId,
                  'password': _pass ?? "",
                  'profilePicture': downloadUrl,
                });
          Navigator.pop(context);
        }
      }
    } catch (e) {
      print('Error saving image: $e');
    }
  }

  Future<void> _saveData() async {
    try {
      if (_pickedFile != null) {
        // Check if _pickedFile is not null
        await _googleSignIn.signIn();
        GoogleSignInAccount? user = _googleSignIn.currentUser;

        if (user != null) {
          String displayName = user.displayName ?? "";
          String email = user.email ?? "";
          String userId = user.id;

          FirebaseFirestore firestore = FirebaseFirestore.instance;
          DocumentReference userDocRef =
              firestore.collection('users').doc(userId);

          String imagePath = 'users/$userId/profilePicture.jpg';
          Reference storageReference =
              FirebaseStorage.instance.ref().child(imagePath);

          _pass == null
              ? await userDocRef.set({
                  'displayName': _name ?? displayName,
                  'email': _email = email,
                  'userId': userId,
                  'profilePicture': profilePicture,
                })
              : await userDocRef.set({
                  'displayName': _name ?? displayName,
                  'email': _email = email,
                  'userId': userId,
                  'password': _pass ?? "",
                  'profilePicture': profilePicture,
                });
          Navigator.pop(context);
        }
      } else {
        await _googleSignIn.signIn();
        GoogleSignInAccount? user = _googleSignIn.currentUser;

        if (user != null) {
          String displayName = user.displayName ?? "";
          String email = user.email ?? "";
          String userId = user.id;

          FirebaseFirestore firestore = FirebaseFirestore.instance;
          DocumentReference userDocRef =
              firestore.collection('users').doc(userId);

          String imagePath = 'users/$userId/profilePicture.jpg';
          Reference storageReference =
              FirebaseStorage.instance.ref().child(imagePath);

          _pass == null
              ? await userDocRef.set({
                  'displayName': _name ?? displayName,
                  'email': _email = email,
                  'userId': userId,
                  'profilePicture': profilePicture,
                })
              : await userDocRef.set({
                  'displayName': _name ?? displayName,
                  'email': _email = email,
                  'userId': userId,
                  'password': _pass ?? "",
                  'profilePicture': profilePicture ?? "",
                });
          Navigator.pop(context);
        }
      }
    } catch (e) {
      print('Error saving image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back_ios_new),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Your Profile',
                      style: poppinsMedium.copyWith(fontSize: 18),
                    ),
                  ],
                ),
                const SizedBox(height: 35),
                InkWell(
                  onTap: _getImage,
                  child: FutureBuilder<Map<String, dynamic>?>(
                    future: userDataFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator(); // Show a loading indicator while waiting for user data
                      } else {
                        if (snapshot.hasError) {
                          return Text(
                            'Error fetching data',
                            style: poppinsMedium.copyWith(fontSize: 24),
                          );
                        } else {
                          // Extracting profile picture URL from user data
                          Map<String, dynamic>? userData = snapshot.data;
                          if (userData != null &&
                              userData.containsKey('profilePicture')) {
                            String profilePictureUrl =
                                userData['profilePicture'];
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: profilePictureUrl.isNotEmpty ||
                                      profilePictureUrl != null
                                  ? Image.network(
                                      profilePictureUrl,
                                      fit: BoxFit.fill,
                                      width: 100,
                                      height: 100,
                                    )
                                  : Text("No Image"),
                            );
                          } else {
                            // Show default image if profile picture URL is not available
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Strings.userImage.isNotEmpty ||
                                      Strings.userImage != null
                                  ? Image.asset(
                                      Strings.userImage,
                                      fit: BoxFit.fill,
                                      width: 100,
                                      height: 100,
                                    )
                                  : Text("No Image"),
                            );
                          }
                        }
                      }
                    },
                  ),
                ),
                const SizedBox(height: 11),
                FutureBuilder<Map<String, dynamic>?>(
                  future: userDataFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text(
                        'Loading...',
                        style: poppinsMedium.copyWith(fontSize: 24),
                      );
                    } else {
                      if (snapshot.hasError) {
                        return Text(
                          'Error fetching data',
                          style: poppinsMedium.copyWith(fontSize: 24),
                        );
                      } else {
                        // Extracting displayName from user data
                        Map<String, dynamic>? userData = snapshot.data;
                        if (userData != null &&
                            userData.containsKey('displayName')) {
                          String displayName = userData['displayName'];
                          return Text(
                            displayName,
                            style: poppinsMedium.copyWith(fontSize: 24),
                          );
                        } else {
                          return Text(
                            'No display name found',
                            style: poppinsMedium.copyWith(fontSize: 24),
                          );
                        }
                      }
                    }
                  },
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.edit,
                      size: 15,
                      color: AppColors.black2.withOpacity(0.6),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'Edit Profile Picture',
                      style: poppinsRegular.copyWith(
                        fontSize: 12,
                        color: AppColors.black2.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 38),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    children: [
                      Text('Name:', style: poppinsBold.copyWith(fontSize: 18)),
                      const SizedBox(width: 60),
                      Expanded(
                        child: FutureBuilder<Map<String, dynamic>?>(
                          future: userDataFuture,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Text(
                                'Loading...',
                                style: poppinsMedium.copyWith(fontSize: 14),
                              );
                            } else {
                              if (snapshot.hasError) {
                                return Text(
                                  'Error fetching data',
                                  style: poppinsMedium.copyWith(fontSize: 14),
                                );
                              } else {
                                // Extracting displayName from user data
                                Map<String, dynamic>? userData = snapshot.data;
                                if (userData != null &&
                                    userData.containsKey('displayName')) {
                                  String displayName = userData['displayName'];
                                  return GestureDetector(
                                    onTap: () {
                                      // Handle edit icon click
                                      setState(() {
                                        // Enable text editing
                                        isEditingName = true;
                                      });
                                    },
                                    child: isEditingName
                                        ? TextField(
                                            controller: TextEditingController(
                                                text: displayName),
                                            enabled: true,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                            ),
                                            style: poppinsMedium.copyWith(
                                                fontSize: 14),
                                            onChanged: (value) {
                                              _name = value;
                                              // Handle text changes
                                              // You can perform any actions here
                                            },
                                          )
                                        : Text(
                                            displayName,
                                            style: poppinsMedium.copyWith(
                                                fontSize: 14),
                                          ),
                                  );
                                } else {
                                  return Text(
                                    'No display name found',
                                    style: poppinsMedium.copyWith(fontSize: 14),
                                  );
                                }
                              }
                            }
                          },
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Handle edit icon click
                          setState(() {
                            // Enable text editing
                            isEditingName = true;
                          });
                        },
                        child: Icon(Icons.edit,
                            size: 15, color: AppColors.black2.withOpacity(0.6)),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    children: [
                      Text('Email:', style: poppinsBold.copyWith(fontSize: 18)),
                      const SizedBox(width: 60),
                      Expanded(
                        child: FutureBuilder<Map<String, dynamic>?>(
                          future: userDataFuture,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Text(
                                'Loading...',
                                style: poppinsMedium.copyWith(fontSize: 14),
                              );
                            } else {
                              if (snapshot.hasError) {
                                return Text(
                                  'Error fetching data',
                                  style: poppinsMedium.copyWith(fontSize: 14),
                                );
                              } else {
                                // Extracting email from user data
                                Map<String, dynamic>? userData = snapshot.data;
                                if (userData != null &&
                                    userData.containsKey('email')) {
                                  String email = userData['email'];
                                  return GestureDetector(
                                    onTap: () {
                                      // Handle edit icon click
                                      setState(() {
                                        // Enable text editing
                                        isEditingEmail = true;
                                      });
                                    },
                                    child: isEditingEmail
                                        ? TextField(
                                            controller: TextEditingController(
                                                text: email),
                                            enabled: true,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                            ),
                                            style: poppinsMedium.copyWith(
                                                fontSize: 14),
                                            onChanged: (value) {
                                              _email = value;
                                              // Handle text changes
                                              // You can perform any actions here
                                            },
                                          )
                                        : Text(
                                            email,
                                            style: poppinsMedium.copyWith(
                                                fontSize: 14),
                                          ),
                                  );
                                } else {
                                  return Text(
                                    'No email found',
                                    style: poppinsMedium.copyWith(fontSize: 14),
                                  );
                                }
                              }
                            }
                          },
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Handle edit icon click
                          setState(() {
                            // Enable text editing
                            isEditingEmail = true;
                          });
                        },
                        child: Icon(Icons.edit,
                            size: 15, color: AppColors.black2.withOpacity(0.6)),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    children: [
                      Text(
                        'Password:',
                        style: poppinsBold.copyWith(fontSize: 18),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: FutureBuilder<Map<String, dynamic>?>(
                          future: userDataFuture,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Text(
                                'Loading...',
                                style: poppinsRegular.copyWith(fontSize: 14),
                              );
                            } else {
                              if (snapshot.hasError) {
                                return Text(
                                  'Error fetching data',
                                  style: poppinsRegular.copyWith(fontSize: 14),
                                );
                              } else {
                                // You may want to handle the password data securely
                                // Extracting password from user data (this is just an example)
                                Map<String, dynamic>? userData = snapshot.data;
                                String password =
                                    '******'; // Default password display
                                return GestureDetector(
                                  onTap: () {
                                    // Handle edit icon click
                                    setState(() {
                                      // Enable text editing or show password
                                      isEditingPassword = true;
                                    });
                                  },
                                  child: isEditingPassword
                                      ? TextField(
                                          controller: TextEditingController(
                                              text: password),
                                          obscureText:
                                              true, // Hide entered characters
                                          enabled: true,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                          ),
                                          style: poppinsRegular.copyWith(
                                              fontSize: 14),
                                          onChanged: (value) {
                                            _pass = value;
                                            // Handle text changes
                                            // You can perform any actions here
                                          },
                                        )
                                      : Text(
                                          password,
                                          style: poppinsRegular.copyWith(
                                              fontSize: 14),
                                        ),
                                );
                              }
                            }
                          },
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Handle edit icon click
                          setState(() {
                            // Enable text editing or show password
                            isEditingPassword = true;
                          });
                        },
                        child: Icon(
                          Icons.edit,
                          size: 15,
                          color: AppColors.black2.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                const SizedBox(height: 20),
                PrimaryButton(
                  onTap: () => _image != null && _pickedFile != null
                      ? {_saveImg(_image!, _pickedFile), Navigator.pop(context)}
                      : {_saveData(), Navigator.pop(context)},
                  width: 200,
                  title: 'SAVE CHANGES',
                  borderRadius: 60,
                  textStyle:
                      poppinsBold.copyWith(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
