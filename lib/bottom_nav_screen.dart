import 'package:bloc_code/End_drawer.dart';
import 'package:bloc_code/Feature/CartScreen/presentation/pages/cart_screen.dart';
import 'package:bloc_code/Feature/MainScreen/presentation/pages/home_screen.dart';
import 'package:bloc_code/Feature/NotificationScreen/presentation/pages/notifi_screen.dart';
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

  static const List<Widget> _screens = [
    HomeScreen(),
    RegScreen(),
    ScavengerScreen(),
    ShopScreen(),
    CartScreen(),
  ];

  static const List<String> _appBarTitles = [
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
        title: Text(
          _appBarTitles[_currentIndex],
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Color(0XFF2c1507),
          ),
        ),
        backgroundColor: const Color(0xFFf2f2f2),
        foregroundColor: Colors.black,
        actions: [
          if (_currentIndex == 2 || _currentIndex == 3)
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.qr_code_scanner_sharp),
            ),
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>NotifiScreen()));
            },
            icon: const Icon(Icons.mail_outline, color: Colors.black),
          ),
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(
                Icons.menu,
                color: Color(0XFF2c1507),
              ),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ),
        ],
      ),
      endDrawer: const CustomEndDrawer(
        username: 'username',
        usermail: 'usermail',
        profile: 'profile',
        access: 1,
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        selectedFontSize: 14,
        backgroundColor: AppColors.brown,
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0XFFd69b35),
        unselectedItemColor: Colors.grey[500],
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.orange,
            icon: Image.asset(
              'assets/Registration_Icon.png',
              width: 26,
              height: 26,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/Registration_Icon.png',
              width: 26,
              height: 26,
            ),
            label: 'Reg',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/abt_empyra.png',
              width: 26,
              height: 26,
            ),
            label: 'SH',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/Shop.png',
              width: 26,
              height: 26,
            ),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/Cart.png',
              width: 26,
              height: 26,
            ),
            label: 'Cart',
          ),
        ],
      ),
    );
  }
}
