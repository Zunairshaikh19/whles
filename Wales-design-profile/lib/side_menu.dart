import 'package:app/admin/admin_wallet.dart';
import 'package:app/admin/bottom_navigation.dart';
import 'package:app/admin/crypto.dart';
import 'package:app/admin/dashboard.dart';
import 'package:app/admin/profileInfo.dart';
import 'package:app/admin/property_list_page.dart';
import 'package:app/admin/shares_holder.dart';
import 'package:app/admin/supports.dart';
import 'package:app/home_screens/upload_files.dart';
import 'package:app/welcome_screen/welcome_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'admin/enter_property_type.dart';
import 'app_theme.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  // void logout() async {
  //   FirebaseAuth.instance.signOut().then((value) async {
  //     // ignore: await_only_futures
  //     signOut();
  //   }).catchError((onError) {});
  // }

  void signOut() async {
    // Constants.cID = "";
    Navigator.of(context).popUntil((route) => route.isFirst);
    await Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) {
          return const WelcomeScreen();
        },
      ),
    );
  }

  // void navCommunityDashboard() {
  //   Navigator.of(context).push(MaterialPageRoute(builder: (_) {
  //     return const CommunityAdminMainScreen();
  //   }));
  // }

  // void navCommunityRequest() {
  //   Navigator.of(context).push(MaterialPageRoute(builder: (_) {
  //     return const CommunityRequest();
  //   }));
  // }

  // void navCommunityFacility() {
  //   Navigator.of(context).push(MaterialPageRoute(builder: (_) {
  //     return const CommunityFacilitiesMainpage();
  //   }));
  // }

  // void navAllCommunities() {
  //   setState(() {});
  // }

  // void navCommunityMembers() {
  //   Navigator.of(context).push(MaterialPageRoute(builder: (_) {
  //     return const CommunityMembers();
  //   }));
  // }

  void navPropertyList() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return const PropertyListPage();
    }));
  }

  void navCrypto() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return const Crypto();
    }));
  }

  void navSharesHolder() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return const SharesHolder();
    }));
  }

  void navProfile() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return const ProfileInfo();
    }));
  }

  void goToAddProperty() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return const EnterPropertyType();
    }));
  }

  void goToDocumentApproved() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return const UploadFiles(); // DocumentApproval();
    }));
  }

  void goToSupports() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return const Supports();
    }));
  }

  void goToWallet() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return const AdminWallet();
    }));
  }

  void goToUsers() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return const UsersBottomNavigation();
    }));
  }

  void goToDashboard() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return const Dashboard();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: // Responsive.isMobile(context)
          // ?
          MediaQuery.of(context).size.width / 2,
      // : 4,
      color: AppTheme.greyShadeColor,
      child: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          ListTile(
            onTap: goToDashboard,
            leading: const Image(
              image: ExactAssetImage(
                'assets/home1.png',
              ),
            ),
            title: Text(
              "Dashboard",
              style: TextStyle(
                  color: AppTheme.whiteColor, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            // onTap: navCommunityMembers,
            leading: const Image(
              image: ExactAssetImage(
                'assets/Oval.png',
              ),
            ),
            title: Text(
              "App Analytics",
              style: TextStyle(
                  color: AppTheme.whiteColor, fontWeight: FontWeight.w600),
            ),
          ),
          ListTile(
            onTap: goToWallet,
            leading: const Image(
              image: ExactAssetImage(
                'assets/sideMenuwallet.png',
              ),
            ),
            title: Text(
              "Wallet",
              style: TextStyle(
                  color: AppTheme.whiteColor, fontWeight: FontWeight.w600),
            ),
          ),
          ListTile(
            onTap: goToUsers,
            leading: const Image(
              image: ExactAssetImage(
                'assets/sideMenuwallet.png',
              ),
            ),
            title: Text(
              "Users",
              style: TextStyle(
                  color: AppTheme.whiteColor, fontWeight: FontWeight.w600),
            ),
          ),
          ListTile(
            onTap: navPropertyList,
            leading: const Image(
              image: ExactAssetImage(
                'assets/propertyList.png',
              ),
            ),
            title: Text(
              "Property List",
              style: TextStyle(
                  color: AppTheme.whiteColor, fontWeight: FontWeight.w600),
            ),
          ),
          ListTile(
            onTap: goToAddProperty,
            leading: const Image(
              image: ExactAssetImage(
                'assets/addProperty.png',
              ),
            ),
            title: Text(
              "Add Property",
              style: TextStyle(
                  color: AppTheme.whiteColor, fontWeight: FontWeight.w600),
            ),
          ),
          ListTile(
            onTap: navCrypto,
            leading: const Image(
              image: ExactAssetImage(
                'assets/cryptocoins.png',
              ),
            ),
            title: Text(
              "Crypo",
              style: TextStyle(
                  color: AppTheme.whiteColor, fontWeight: FontWeight.w600),
            ),
          ),
          ListTile(
            onTap: navSharesHolder,
            leading: const Image(
              image: ExactAssetImage(
                'assets/shareholder.png',
              ),
            ),
            title: Text(
              "Sharesholder",
              style: TextStyle(
                  color: AppTheme.whiteColor, fontWeight: FontWeight.w600),
            ),
          ),
          ListTile(
            onTap: goToDocumentApproved,
            leading: const Image(
              image: ExactAssetImage(
                'assets/document_approval.png',
              ),
            ),
            title: Text(
              "Document Approval",
              style: TextStyle(
                  color: AppTheme.whiteColor, fontWeight: FontWeight.w600),
            ),
          ),
          ListTile(
            onTap: navProfile,
            leading: const Image(
              image: ExactAssetImage(
                'assets/menuProfile.png',
              ),
            ),
            title: Text(
              "Profile",
              style: TextStyle(
                  color: AppTheme.whiteColor, fontWeight: FontWeight.w600),
            ),
          ),
          ListTile(
            onTap: goToSupports,
            leading: const Image(
              image: ExactAssetImage(
                'assets/support.png',
              ),
            ),
            title: Text(
              "Supports",
              style: TextStyle(
                  color: AppTheme.whiteColor, fontWeight: FontWeight.w600),
            ),
          ),
          ListTile(
            // onTap: logout,
            leading: const Image(
              image: ExactAssetImage(
                'assets/support.png',
              ),
            ),
            title: Text(
              "Sign out",
              style: TextStyle(
                  color: AppTheme.whiteColor, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
