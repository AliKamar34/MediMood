import 'package:flutter/material.dart';
import 'package:new_app/core/utils/colors_asset_data.dart';
import 'package:new_app/features/home/data/models/pill_model.dart';
import 'package:new_app/features/home/presentation/views/widgets/custom_deleting_alert.dart';
import 'package:new_app/features/home/presentation/views/widgets/pill_bottom_sheet.dart';
import 'package:new_app/features/home/presentation/views/widgets/pill_card_info.dart';

class PillCard extends StatelessWidget {
  const PillCard({
    super.key,
    required this.pillModel,
  });
  final PillModel pillModel;
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
        onLongPress: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return DeletinPillgAlert(
                pillModel: pillModel,
              );
            },
          );
        },
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return PillBottomSheet(
                pillModel: pillModel,
              );
            },
          );
        },
        borderRadius: BorderRadius.circular(14),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: PillCardInfo(
            pillModel: pillModel,
          ),
        ),
      ),
    );
  }
}
