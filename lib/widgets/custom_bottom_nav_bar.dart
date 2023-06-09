import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project_x/const/constant.dart';
import 'package:project_x/flutter_flow/flutter_flow_theme.dart';
import 'package:project_x/screens/community/add_post_screen.dart';
import 'package:project_x/screens/community/community_screen.dart';
import 'package:project_x/screens/plantingGuide/planting_guide_screen.dart';
import 'package:project_x/screens/profile/profile_screen.dart';
import 'package:project_x/screens/test_profile_screen.dart';

import '../screens/pollutionReport/pollution_report_screen.dart';
class CustomNavBar extends StatefulWidget {
  final int selectedIndex;

  const CustomNavBar({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int _currentIndex = 0;
  late final List<Widget> screens;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.selectedIndex;
    final user = FirebaseAuth.instance.currentUser!;
    screens = [
      CommunityScreen(),
      plantingGuideScreen(),
      addPostScreen(user: user),
      pollutionReport(),
      profileScreen(),
    ];
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedLabelStyle: FlutterFlowTheme.of(context).bodyMedium,
        backgroundColor: const Color(0xffE7F6F2),
        selectedItemColor: kPrimaryColor,
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 35,
              color: Color.fromRGBO(48, 64, 34, 100),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.local_florist_outlined,
              size: 35,
              color: Color.fromRGBO(48, 64, 34, 100),
            ),
            label: 'Planting',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle_rounded,
              size: 35,
              color: Color.fromRGBO(48, 64, 34, 100),
            ),
            label: 'Post',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.report,
              size: 35,
              color: Color.fromRGBO(48, 64, 34, 100),
            ),
            label: 'Report',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.profile_circled,
              color: Color.fromRGBO(48, 64, 34, 100),
              size: 35,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}