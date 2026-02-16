import 'dart:io';
import 'package:flutter/material.dart';
import 'core/constant/string.dart';

class CustomEndDrawer extends StatelessWidget {
  final String username,profile;
  final String usermail;
  final int access;
  const CustomEndDrawer({
    super.key,
    required this.username,
    required this.usermail, required this. profile, required this. access,
  });


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Drawer(
        backgroundColor: const Color(0xFFfaf4ef),
        child: Column(
          children: [
            Platform.isAndroid?
            Container(
              color: Color(0XFF2c1507),
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 8, top: 8),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context); // Close the drawer
                },
              ),
            ):Container(),

            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  UserAccountsDrawerHeader(
                    decoration:  BoxDecoration(
                      color: Color(0XFF2c1507),
                      image: DecorationImage(
                        image: AssetImage('assets/app_logo.png',),//app_logo.png
                        fit: BoxFit.contain,
                      ),
                    ),
                    accountName: Text(
                      username,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    accountEmail: Text(
                      usermail,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    currentAccountPicture: CircleAvatar(
                      backgroundColor: const Color(0xFFfaf4ef),
                      child: ClipOval(
                        child: Image.network(
                          profile,
                          fit: BoxFit.cover, // Makes image fill the circle
                          width: 100,         // Optional: match desired size
                          height: 100,        // Optional: match desired size
                          errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.person), // Fallback if image fails
                        ),
                      ),
                    ),

                  ),

                  /// Drawer Items
                  DrawerItem(
                      image: Image.network('http://13.234.251.159:8082/App/Img_4.jpeg'),
                      text: "Profile",
                      onTap: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (_) => const ProfileScreen(check:"0")));
                      }),
                  DrawerItem(
                      image: Image.network('http://13.234.251.159:8082/App/Img_7.jpeg'),
                      text: "My Chronicles",
                      onTap: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (_) =>  MyChroniclesScreen()));
                      }),
                  DrawerItem(
                      image: Image.asset('assets/Daily_qns.png'),
                      text: "My Quiz",
                      onTap: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (_) =>  QuizHistoryScreen(quiz_type: '0', event_id: '0',)));
                      }),
                  DrawerItem(
                      image: Image.network('http://13.234.251.159:8082/App/Img_8.jpeg'),
                      text: "About Stanley",
                      onTap: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (_) => const Aboutscreen()));
                      }),
                  ListTile(
                    leading: Image.asset(
                      'assets/abt_empyra.png',
                      width: 26,
                      height: 26,
                    ),
                    title: const Text(
                      'About Empyra',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,

                      ),
                    ),
                    onTap: () async {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (_) => const AwakeningScreen()));
                    },
                  ),

                  DrawerItem(
                      image: Image.network('http://13.234.251.159:8082/App/Img_1.jpeg'),
                      text: "FAQ",
                      onTap: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (_) => const FAQScreen()));
                      }),
                  DrawerItem(
                      image: Image.network('http://13.234.251.159:8082/App/Img_5.jpeg'),
                      text: "Referral Code",
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) =>  ReferralScreen()),
                        // );
                      }),
                  ListTile(
                    leading: Image.asset(
                      'assets/con.png',
                      width: 26,
                      height: 26,
                    ),
                    title: const Text(
                      'Contact Us',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                    onTap: () {
                    //  Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (context) => const ContactUsScreen(),
                      //   ),
                      // );
                    },
                  ),

                  DrawerItem(
                      image: Image.asset('assets/Developer.png'),
                      text: "About Developer",
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) =>  AboutDeveloper()),
                        // );
                      }),
                  DrawerItem(
                      image: Image.asset('assets/Sponsors_icon.png'),
                      text: "About Sponsors",
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) =>  SponsorListScreen()),
                        // );
                      }),
                  if(access==1)...[ListTile(
                    leading: Image.asset(
                      'assets/Attendance.png',
                      width: 26,
                      height: 26,
                    ),
                    title: const Text(
                      ' Attendance Sheet',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,

                      ),
                    ),
                    onTap: () async {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (_) =>  ParticipantsScreen(admission: '0', workshopTitle: '0', workshopId: '0',)));
                      },
                  ),]  ,
                  ListTile(
                    leading: Image.asset(
                      'assets/Privacy.png',
                      width: 26,
                      height: 26,
                    ),
                    title: const Text(
                      ' Privacy policy / T&C',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,

                      ),
                    ),
                    onTap: () async {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (_) => PolicyScreen(type: 'privacy&tc')));
                          },
                  ),
                  ListTile(
                    leading: Image.asset(
                      'assets/Delete_acc.png',
                      width: 26,
                      height: 26,
                    ),
                    title: const Text(
                      ' Delete Account',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,

                      ),
                    ),
                    onTap: () async {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (_) =>  DeleteAccountScreen()));
                    },
                  ),
                  ListTile(
                    leading: Image.network(
                      'http://13.234.251.159:8082/App/Img_3.jpeg',
                      width: 26,
                      height: 26,
                    ),
                    title: const Text(
                      ' Logout',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,

                      ),
                    ),
                    onTap: () async {
                      _showLogoutConfirmationDialog(context);              },
                  ),
                  /// Version Info
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    title: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(''),
                        Text('${int_appVersion}', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text('Confirm Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: const Text('Yes'),
              onPressed: () async {
                // final prefs = await SharedPreferences.getInstance();
                // await prefs.clear();
                // Navigator.of(dialogContext).pop(); // Close the dialog
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(
                //     builder: (_) => LoginScreen(), // Replace with your actual login screen widget
                //   ),
                // );
              },
            ),
          ],
        );
      },
    );
  }

}
class DrawerItem extends StatelessWidget {
  final Image image;
  final String text;
  final VoidCallback onTap;

  const DrawerItem({
    super.key,
    required this.image,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListTile(
        leading: SizedBox(
          width: 24,
          height: 24,
          child: image,
        ),
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(text, style: const TextStyle(fontSize: 16)),
        ),
        onTap: () {
          //  Navigator.pop(context); // Close drawer
          onTap();
        },
      ),
    );
  }
}
