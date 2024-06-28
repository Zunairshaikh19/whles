import 'package:app/constants/app_colors.dart';
import 'package:app/constants/typography.dart';
import 'package:app/models/public_profile_model.dart';
import 'package:app/widgets/custom_buttons.dart';
import 'package:app/widgets/custom_text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersonalProfileView extends StatefulWidget {
  const PersonalProfileView({Key? key}) : super(key: key);

  @override
  _PersonalProfileViewState createState() => _PersonalProfileViewState();
}

class _PersonalProfileViewState extends State<PersonalProfileView> {
  late Future<Map<String, dynamic>?>
      userDataFuture; // Initialize _pickedFile as PickedFile or null
  bool isEditProfile = false;
  bool isLoading = false;
  PublicProfileModel profileModel = PublicProfileModel.empty();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();

  @override
  void initState() {
    getPersonalProfileData();
    super.initState();
    // userDataFuture = getUserData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void getPersonalProfileData() async {
   
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final userId = prefs.getString('userId');
      if (userId == null) return;
      final userData = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();
      if (userData.exists) {
        setState(() {
          profileModel = PublicProfileModel.fromFirestore(userData);
          firstNameController.text = profileModel.firstName;
          lastNameController.text = profileModel.lastName;
          emailController.text = profileModel.email;
          phoneNoController.text = profileModel.phoneNo;
          addressController.text = profileModel.address;
          ageController.text = profileModel.age;
        });
      }
     
    } catch (e) {
     
      Get.snackbar('Error', e.toString());
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: profileModel.profileUrl.isNotEmpty
                      ? Image.network(
                          profileModel.profileUrl,
                          fit: BoxFit.fill,
                          width: 100,
                          height: 100,
                        )
                      : const Text("No Image"),
                ),
                const SizedBox(height: 11),
                Text(
                  "${profileModel.firstName} ${profileModel.lastName}",
                  style: poppinsMedium.copyWith(fontSize: 24),
                ),
                const SizedBox(height: 18),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isEditProfile = !isEditProfile;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.edit,
                        size: 17,
                        color: isEditProfile
                            ? AppColors.black2.withOpacity(0.6)
                            : AppColors.redColor2,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        isEditProfile ? 'cancel' : 'View Profile',
                        style: poppinsRegular.copyWith(
                          fontSize: 15,
                          color: AppColors.black2.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 28),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('First Name',
                          style: poppinsRegular.copyWith(fontSize: 18)),
                      CustomTextField(
                        controller: firstNameController,
                        prefixIcon: '',
                        readOnly: !isEditProfile,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Last Name',
                          style: poppinsRegular.copyWith(fontSize: 18)),
                      CustomTextField(
                        controller: lastNameController,
                        prefixIcon: '',
                        readOnly: !isEditProfile,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Email',
                          style: poppinsRegular.copyWith(fontSize: 18)),
                      CustomTextField(
                        controller: emailController,
                        prefixIcon: '',
                        readOnly: !isEditProfile,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Phone Number',
                          style: poppinsRegular.copyWith(fontSize: 18)),
                      CustomTextField(
                        controller: phoneNoController,
                        prefixIcon: '',
                        readOnly: !isEditProfile,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Address',
                          style: poppinsRegular.copyWith(fontSize: 18)),
                      CustomTextField(
                        controller: addressController,
                        prefixIcon: '',
                        readOnly: !isEditProfile,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Age', style: poppinsRegular.copyWith(fontSize: 18)),
                      CustomTextField(
                        controller: ageController,
                        prefixIcon: '',
                        readOnly: !isEditProfile,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : PrimaryButton(
                        onTap: () async {
                          if (isEditProfile) {
                            setState(() {
                              isLoading = true;
                            });
                            try {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              final userId = prefs.getString('userId');
                              if (userId == null) return;
                              await FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(userId)
                                  .update({
                                'firstName': firstNameController.text,
                                'lastName': lastNameController.text,
                                'email': emailController.text,
                                'phoneNo': phoneNoController.text,
                                'address': addressController.text,
                                'age': ageController.text,
                              });
                              setState(() {
                                isLoading = false;
                                isEditProfile = false;
                              });
                              Get.snackbar(
                                  'Success', 'Profile Updated Successfully');
                            } catch (e) {
                              setState(() {
                                isLoading = false;
                              });
                              Get.snackbar('Error', e.toString());
                            }
                          }
                        },
                        width: 200,
                        title: 'SAVE CHANGES',
                        borderRadius: 60,
                        textStyle: poppinsBold.copyWith(
                            fontSize: 16, color: Colors.white),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
