import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:paynetic/features/home/presentation/screens/home_screen.dart';
import 'package:paynetic/features/home/presentation/screens/referal_screen.dart';
import 'package:paynetic/features/home/presentation/screens/wallet_screen.dart';

class HomeWithBottomNav extends StatefulWidget {
  const HomeWithBottomNav({super.key});

  @override
  State<HomeWithBottomNav> createState() => _HomeWithBottomNavState();
}

class _HomeWithBottomNavState extends State<HomeWithBottomNav> {
  int _currentIndex = 1; // Middle: Home by default

  final List<Widget> _pages = [
    ReferralScreen(referralCode: 'friend', invitedFriends: [
     
      ],
    ),
    HomeScreen(), // TabBar + Task List
    BalanceScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        index: _currentIndex, // 👉 default holatda Home bo'lishi uchun
        backgroundColor: Colors.grey.shade100,
        color: Color(0xFF7C4DFF),
        animationDuration: const Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/icons/referal.png',
              color: Colors.white,
              height: 30,
              width: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/icons/home.png',
              color: Colors.white,
              height: 30,
              width: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/icons/wallet.png',
              color: Colors.white,
              height: 30,
              width: 30,
            ),
          ),
        ],
      ),
    );
  }
}
