import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_app/core/utils/app_text_style.dart';

import 'package:new_app/core/utils/assets_data.dart';
import 'package:new_app/core/utils/colors_asset_data.dart';
import 'package:new_app/features/home/presentation/views/widgets/pill_card_info.dart';

class PillCard extends StatelessWidget {
  const PillCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Card(
      color: ColorsAssetData.scaffoldColor,
      elevation: 7,
      shadowColor: ColorsAssetData.primaryColor,
      child: Padding(
        padding: EdgeInsets.all(12),
        child: PillCardInfo(),
      ),
    );
  }
}
