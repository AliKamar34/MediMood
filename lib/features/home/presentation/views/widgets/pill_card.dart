import 'package:flutter/material.dart';
import 'package:new_app/core/utils/colors_asset_data.dart';
import 'package:new_app/features/home/presentation/views/widgets/pill_card_info.dart';

class PillCard extends StatelessWidget {
  const PillCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7,
      color: ColorsAssetData.scaffoldColor,
      shadowColor: ColorsAssetData.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(14),
        child: const Padding(
          padding: EdgeInsets.all(12),
          child: PillCardInfo(),
        ),
      ),
    );
  }
}
