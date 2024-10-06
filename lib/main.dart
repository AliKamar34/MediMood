import 'package:flutter/material.dart';
import 'package:new_app/core/utils/app_routes.dart';
import 'package:new_app/core/utils/colors_asset_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRoutes.router,
      theme: ThemeData(
        scaffoldBackgroundColor: ColorsAssetData.scaffoldColor,
      ),
    );
  }
}
