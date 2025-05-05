import 'package:flutter/material.dart';
import 'package:new_app/core/utils/colors_asset_data.dart';

final ThemeData lightTheme = ThemeData.light().copyWith(
  scaffoldBackgroundColor: ColorsAssetData.lightScaffoldColor,
  // primaryColor: ColorsAssetData.primaryColor,
  // colorScheme: const ColorScheme.light(
  //   primary: ColorsAssetData.primaryColor,
  //   secondary: ColorsAssetData.secandryColor,
  // ),
);

final ThemeData darkTheme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: ColorsAssetData.scaffoldColor,
  // primaryColor: ColorsAssetData.primaryColor,
  // colorScheme: const ColorScheme.dark(
  //   primary: ColorsAssetData.primaryColor,
  //   secondary: ColorsAssetData.secandryColor,
  // ),
);
