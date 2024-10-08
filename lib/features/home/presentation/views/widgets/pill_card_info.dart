import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_app/core/utils/app_text_style.dart';
import 'package:new_app/core/utils/assets_data.dart';
import 'package:new_app/core/utils/colors_asset_data.dart';

class PillCardInfo extends StatelessWidget {
  const PillCardInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
                width: 18,
              ),
              Text(
                'Before Food',
                style: AppTextStyle.styleMedium18(context),
              ),
            ],
          ),
        )
      ],
    );
  }
}
