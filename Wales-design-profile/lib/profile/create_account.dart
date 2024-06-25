import 'package:app/models/public_profile_model.dart';
import 'package:app/welcome_screen/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../app_theme.dart';
import '../constants.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class CreateAccount extends StatefulWidget {
  final String userType;
  const CreateAccount(this.userType, {super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNoController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController nationalityController = TextEditingController();

  bool isObscurePass = true;
  bool isObscureConfirmPass = true;
  bool isButtonEnabled = false;
  bool loading = false;
  final List role = ['Student', 'Employer', 'UnEmployed', 'Other'];
  final List genderData = ['Male', 'Female', 'Other'];
  String selectedRole = 'Student';
  String selected = '';

  @override
  void initState() {
    super.initState();
    emailController.addListener(_validateForm);
    passController.addListener(_validateForm);
    confirmPassController.addListener(_validateForm);
    firstNameController.addListener(_validateForm);
    lastNameController.addListener(_validateForm);
    phoneNoController.addListener(_validateForm);
  }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    confirmPassController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    phoneNoController.dispose();
    super.dispose();
  }

  void _validateForm() {
    setState(() {
      isButtonEnabled = emailController.text.isNotEmpty &&
          passController.text.isNotEmpty &&
          confirmPassController.text.isNotEmpty &&
          firstNameController.text.isNotEmpty &&
          lastNameController.text.isNotEmpty &&
          phoneNoController.text.isNotEmpty;
    });
  }

  // Future<void> register() async {
  //   if (!checkCredentials()) {
  //     return;
  //   }
  //   setState(() {
  //     loading = true;
  //   });

  //   try {
  //     // Check if the email already exists in Firestore
  //     final QuerySnapshot result = await FirebaseFirestore.instance
  //         .collection('users')
  //         .where('email', isEqualTo: emailController.text.trim())
  //         .limit(1)
  //         .get();

  //     final List<DocumentSnapshot> documents = result.docs;
  //     if (documents.isNotEmpty) {
  //       // Email already exists
  //       Constants.showMessage(context, "Email already in use.");
  //       setState(() {
  //         loading = false;
  //       });
  //       return;
  //     }

  //     // Create user with Firebase Authentication
  //     UserCredential userCredential =
  //         await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //       email: emailController.text.trim(),
  //       password: passController.text,
  //     );

  //     // Store user details in Firestore
  //     await FirebaseFirestore.instance
  //         .collection('users')
  //         .doc(userCredential.user!.uid)
  //         .set({
  //       'firstName': firstNameController.text.trim(),
  //       'lastName': lastNameController.text.trim(),
  //       'phoneNumber': phoneNoController.text.trim(),
  //       'email': emailController.text.trim(),
  //       'displayName': firstNameController.text.trim() +
  //           " " +
  //           lastNameController.text.trim(),
  //       'profilePicture': "",
  //       'userType': widget.userType,
  //       'password': passController.text.trim()
  //     });
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     prefs.setString('email', emailController.text.trim());

  //     goTo();
  //   } on FirebaseAuthException catch (e) {
  //     Constants.showMessage(context, e.message!);
  //   } catch (e) {
  //     Constants.showMessage(context, e.toString());
  //   } finally {
  //     setState(() {
  //       loading = false;
  //     });
  //   }
  // }
  void register() async {
    if (!checkCredentials()) {
      return;
    }
    setState(() {
      loading = true;
    });

    try {
      // Create user with Firebase Authentication
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passController.text,
      );

      if (userCredential.user != null) {
        // Fetch user ID
        String userId = userCredential.user!.uid;
        PublicProfileModel profileModel = PublicProfileModel(
          id: userId,
          firstName: firstNameController.text.trim(),
          lastName: lastNameController.text.trim(),
          phoneNo: "+92${phoneNoController.text.trim()}",
          age: ageController.text.trim(),
          gender: "",
          address: addressController.text.trim(),
          nationality: nationalityController.text.trim(),
          role: selectedRole,
          email: emailController.text.trim(),
          profileUrl: 'https://www.w3schools.com/howto/img_avatar.png',
        );

        await PublicProfileModel.addPublicProfile(profileModel);

        // Save user ID using SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('userId', userId);
        prefs.setString('email', emailController.text.trim());
        prefs.setString('role', selectedRole);

        goTo();
      }
    } on FirebaseAuthException catch (e) {
      Constants.showMessage(context, e.message!);
    } catch (e) {
      Constants.showMessage(context, e.toString());
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  void goTo() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const WelcomeScreen()),
      (route) => false,
    );
  }

  bool checkCredentials() {
    if (firstNameController.text.isEmpty ||
        !RegExp(r'^[a-zA-Z]+$').hasMatch(firstNameController.text)) {
      Constants.showMessage(context, "Please enter a valid first name");
      return false;
    }
    if (lastNameController.text.isEmpty ||
        !RegExp(r'^[a-zA-Z]+$').hasMatch(lastNameController.text)) {
      Constants.showMessage(context, "Please enter a valid last name");
      return false;
    }
    if (selectedRole.isEmpty) {
      Constants.showMessage(context, "Please select a role");
      return false;
    }
    if (ageController.text.isEmpty ||
        !RegExp(r'^\+?\d+$').hasMatch(ageController.text)) {
      Constants.showMessage(context, "Please enter a valid age");
      return false;
    }
    if (addressController.text.isEmpty) {
      Constants.showMessage(context, "Please enter a valid address");
      return false;
    }
    if (nationalityController.text.isEmpty) {
      Constants.showMessage(context, "Please enter nationality");
      return false;
    }
    if (phoneNoController.text.isEmpty ||
        !RegExp(r'^\+?\d+$').hasMatch(phoneNoController.text)) {
      Constants.showMessage(context, "Please enter a valid phone number");
      return false;
    }

    if (emailController.text.isEmpty ||
        !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(emailController.text)) {
      Constants.showMessage(context, "Please enter a valid email address");
      return false;
    }
    if (passController.text.isEmpty || passController.text.length < 8) {
      Constants.showMessage(
          context, "Password must be at least 8 characters long");
      return false;
    }
    if (confirmPassController.text != passController.text) {
      Constants.showMessage(context, "Passwords do not match");
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff4A635F),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: AppTheme.whiteColor,
            size: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Create Account',
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
              const SizedBox(height: 15),
              CustomTextField(
                controller: firstNameController,
                prefixIcon: '',
                hintText: 'First Name',
                hintTextColor: Colors.white,
              ),
              const SizedBox(height: 15),
              CustomTextField(
                controller: lastNameController,
                prefixIcon: '',
                hintText: 'Last Name',
                hintTextColor: Colors.white,
              ),
              const SizedBox(height: 15),
              CustomTextField(
                controller: phoneNoController,
                prefixIcon: '',
                prefixText: '+92',
                hintText: 'Phone Number',
                hintTextColor: Colors.white,
              ),
              const SizedBox(height: 15),
              CustomTextField(
                controller: addressController,
                prefixIcon: '',
                hintText: 'Address',
                hintTextColor: Colors.white,
                maxlines: 3,
              ),
              const SizedBox(height: 15),
              CustomTextField(
                controller: ageController,
                prefixIcon: '',
                hintText: 'Age',
                hintTextColor: Colors.white,
              ),
              const SizedBox(height: 15),
              CustomTextField(
                controller: nationalityController,
                prefixIcon: '',
                hintText: 'Nationality',
                hintTextColor: Colors.white,
              ),
              // DropdownButton(
              //   items:  [
              //     for(var item in genderData)
              //     DropdownMenuItem(
              //      child:  Text(item.toString()),
              //     )
              //   ],
              //   onChanged: (value) {},
              //   ),
              CustomTextField(
                controller: emailController,
                prefixIcon: '',
                hintText: 'Email Address',
                hintTextColor: Colors.white,
              ),
              const SizedBox(height: 15),

              CustomTextField(
                controller: passController,
                hintText: 'Password',
                hintTextColor: Colors.white,
                prefixIcon: '',
                isPass: true,
                textInputType: TextInputType.visiblePassword,
                isObscure: isObscurePass,
                widget: IconButton(
                  onPressed: () {
                    setState(() {
                      isObscurePass = !isObscurePass;
                    });
                  },
                  icon: isObscurePass
                      ? const Icon(Icons.visibility_off_outlined)
                      : const Icon(Icons.visibility_outlined),
                ),
              ),
              const SizedBox(height: 15),
              CustomTextField(
                controller: confirmPassController,
                hintText: 'Confirm Password',
                hintTextColor: Colors.white,
                prefixIcon: '',
                isPass: true,
                textInputType: TextInputType.visiblePassword,
                isObscure: isObscureConfirmPass,
                widget: IconButton(
                  onPressed: () {
                    setState(() {
                      isObscureConfirmPass = !isObscureConfirmPass;
                    });
                  },
                  icon: isObscureConfirmPass
                      ? const Icon(Icons.visibility_off_outlined)
                      : const Icon(Icons.visibility_outlined),
                ),
              ),
              const SizedBox(height: 35),
              CustomButton(
                isButtonEnable: isButtonEnabled,
                height: 56,
                onPress: register,
                text: loading ? 'Signing Up...' : 'Sign Up',
                fontColorAlt: AppTheme.blackColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
