import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hive/hive.dart';
import 'package:new_app/core/utils/colors_asset_data.dart';
import 'package:new_app/core/utils/constant.dart';
import 'package:new_app/features/home/presentation/views/home_view.dart';
import 'package:new_app/features/home/presentation/views/pills_view.dart';
import 'package:new_app/features/note/data/models/note_model.dart';
import 'package:new_app/features/note/presentation/views/notes_view.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({
    super.key,
  });

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int selectedIndex = 0;
  static const List<Widget> pages = [
    HomeView(),
    PillsView(),
    NotesView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          bottom: 10,
          right: 5,
          left: 5,
        ),
        child: GNav(
          haptic: true,
          tabBorderRadius: 15,
          curve: Curves.easeOutExpo,
          duration: const Duration(milliseconds: 500),
          gap: 8,
          color: ColorsAssetData.secandryColor,
          activeColor: ColorsAssetData.primaryColor,
          iconSize: 24,
          tabBackgroundColor: ColorsAssetData.primaryColor.withOpacity(0.1),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          tabs: [
            GButton(
              leading: SvgPicture.asset(
                'asstes/images/Home.svg',
                height: 28,
                width: 28,
              ),
              icon: Icons.circle,
              iconSize: 0,
              text: 'Home',
              onPressed: () {
                Hive.openBox(Constant.kPillsBox);
              },
            ),
            GButton(
              leading: SvgPicture.asset(
                'asstes/images/pill.svg',
                height: 28,
                width: 28,
              ),
              icon: FontAwesomeIcons.pills,
              iconSize: 32,
              text: 'pills',
              onPressed: () {
                Hive.openBox(Constant.kPillsBox);
              },
            ),
            GButton(
              leading: SvgPicture.asset(
                'asstes/images/Document.svg',
                height: 28,
                width: 28,
              ),
              icon: Icons.circle,
              iconSize: 0,
              text: 'notes',
            ),
          ],
          selectedIndex: selectedIndex,
          onTabChange: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}
