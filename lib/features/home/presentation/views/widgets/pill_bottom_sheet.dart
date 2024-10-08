import 'package:flutter/material.dart';
import 'package:new_app/core/utils/app_text_style.dart';
import 'package:new_app/core/utils/colors_asset_data.dart';
import 'package:new_app/features/home/presentation/views/widgets/pill_card_info.dart';

class PillBottomSheet extends StatelessWidget {
  const PillBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      height: MediaQuery.sizeOf(context).height * 0.70,
      decoration: const BoxDecoration(
        color: ColorsAssetData.scaffoldColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pill Info',
                  style: AppTextStyle.styleBold24(context),
                ),
                const SizedBox(height: 30),
                const PillCardInfo(),
                const Expanded(child: SizedBox()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                          ColorsAssetData.primaryColor,
                        ),
                      ),
                      child: Text(
                        'Take',
                        style: AppTextStyle.styleRegular20(context).copyWith(
                          color: ColorsAssetData.scaffoldColor,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                          ColorsAssetData.primaryColor,
                        ),
                      ),
                      child: Text(
                        'Edit',
                        style: AppTextStyle.styleRegular20(context).copyWith(
                          color: ColorsAssetData.scaffoldColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
