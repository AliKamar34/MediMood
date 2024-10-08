import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_app/core/utils/app_text_style.dart';
import 'package:new_app/core/utils/assets_data.dart';
import 'package:new_app/core/utils/colors_asset_data.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Good Morning',
              style: AppTextStyle.styleRegular20(context),
            ),
            const SizedBox(
              height: 50,
            ),
            Card(
              color: ColorsAssetData.scaffoldColor,
              elevation: 7,
              shadowColor: ColorsAssetData.primaryColor,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '8:00 AM',
                      style: AppTextStyle.styleBold24(context).copyWith(
                        color: ColorsAssetData.primaryColor,
                      ),
                    ),
                    ListTile(
                      leading: SvgPicture.asset(AssetsData.pillIcon),
                      title: Text(
                        'Acetaminophen',
                        style: AppTextStyle.styleBold24(context),
                      ),
                      subtitle: Row(
                        children: [
                          Text(
                            '1 pill',
                            style: AppTextStyle.styleMedium18(context),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Before Food',
                            style: AppTextStyle.styleMedium18(context),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
