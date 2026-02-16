import 'package:bloc_code/End_drawer.dart';
import 'package:bloc_code/Feature/CartScreen/presentation/pages/cart_screen.dart';
import 'package:bloc_code/Feature/MainScreen/presentation/pages/home_screen.dart';
import 'package:bloc_code/Feature/RegScreen/presentation/pages/reg_screen.dart';
import 'package:bloc_code/Feature/ShopScreen/presentation/pages/shop_screen.dart';
import 'package:bloc_code/core/constant/app_colors.dart';
import 'package:flutter/material.dart';

import 'Feature/ScavengerScreen/presentation/pages/scanvenger_screen.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _currentIndex = 0;
  final List<Widget> _screen=[
    HomeScreen(),RegScreen(),ScavengerScreen(),ShopScreen() ,CartScreen()
  ];
  final List<String> appBarTitles = [
    'Home',
    'Registration',
    'Scavenger',
    'Shop',
    'Cart',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text( appBarTitles[_currentIndex],
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold,color: Color(0XFF2c1507)),
        ),
        backgroundColor: const Color(0xFFf2f2f2),
        foregroundColor: Colors.black,
        actions: [
          // Reward Point Badge
          if(_currentIndex==2||_currentIndex==3)
           // if(sh_qr==1)
              IconButton(onPressed: (){}, icon: Icon(Icons.qr_code_scanner_sharp)),
          // sh_qr==0?IconButton(onPressed: (){}, icon: Icon(Icons.qr_code_scanner_sharp)):Container(),
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (_) => const UserLogScreen()));
                },
                icon: const Icon(Icons.mail_outline, color: Colors.black),
              ),
            ],
          ),
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu,color: Color(0XFF2c1507),),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ),
        ],
      ),
      endDrawer:  CustomEndDrawer(username: 'username', usermail: 'usermail',profile:'profile',access:1),
      body: _screen[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        selectedFontSize: 14,
        backgroundColor: AppColors.brown,
        currentIndex: _currentIndex,
        onTap: (index)=>setState(() =>_currentIndex=index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0XFFd69b35),
        unselectedItemColor: Colors.grey[500],
        items:  [
          BottomNavigationBarItem(
            backgroundColor: Colors.orange ,
            icon: Image.asset('assets/Registration_Icon.png',  width: 26,
              height: 26,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon:Image.asset('assets/Registration_Icon.png',  width: 26,
              height: 26,
            ),
            label: "Reg",
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/abt_empyra.png',  width: 26,
              height: 26,
            ),
            label: "SH",
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/Shop.png',  width: 26,
              height: 26,
            ),
            label: "Shop",
          ),
          BottomNavigationBarItem(
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                Image.asset(
                  'assets/Cart.png',
                  width: 26,
                  height: 26,
                ),
                // if (cartItems.isNotEmpty)
                //   Positioned(
                //     right: -14,
                //     top: -12,
                //     child: Container(
                //       padding: EdgeInsets.all(2),
                //       decoration: BoxDecoration(
                //         color: Colors.red,
                //         borderRadius: BorderRadius.circular(10),
                //       ),
                //       constraints: BoxConstraints(
                //         minWidth: 20,
                //         minHeight: 18,
                //       ),
                //       child: Text(
                //         '${cartItems.length}',
                //         style: TextStyle(
                //             color: Colors.white,
                //             fontSize: 11,fontWeight: FontWeight.bold
                //         ),
                //         textAlign: TextAlign.center,
                //       ),
                //     ),
                //   ),
              ],
            ),
            label: "Cart",
          ),
        ],
      ),
    );
  }
}