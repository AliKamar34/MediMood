import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:new_app/core/utils/colors_asset_data.dart';
import 'package:new_app/features/home/presentation/views/home_view.dart';
import 'package:new_app/features/home/presentation/views/pills_view.dart';
import 'package:new_app/features/home/presentation/views/widgets/custom_drawer.dart';
import 'package:new_app/features/note/presentation/views/notes_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Stack(children: [
          pages[selectedIndex],
          IconButton(
            icon:
                const Icon(Icons.settings, color: ColorsAssetData.primaryColor),
            onPressed: () => scaffoldKey.currentState!.openDrawer(),
          ),
        ]),
      ),
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
          tabBackgroundColor: ColorsAssetData.primaryColor.withAlpha(25),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          tabs: [
            GButton(
              leading: SvgPicture.asset(
                'assets/images/Home.svg',
                height: 28,
                width: 28,
              ),
              icon: Icons.circle,
              iconSize: 0,
              text: AppLocalizations.of(context)!.home,
            ),
            GButton(
              leading: SvgPicture.asset(
                'assets/images/pill.svg',
                height: 28,
                width: 28,
              ),
              icon: FontAwesomeIcons.pills,
              iconSize: 32,
              text: AppLocalizations.of(context)!.pills,
            ),
            GButton(
              leading: SvgPicture.asset(
                'assets/images/Document.svg',
                height: 28,
                width: 28,
              ),
              icon: Icons.circle,
              iconSize: 0,
              text: AppLocalizations.of(context)!.notes,
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
