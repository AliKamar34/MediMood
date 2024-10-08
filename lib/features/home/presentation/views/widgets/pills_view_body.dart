import 'package:flutter/material.dart';
import 'package:new_app/core/utils/app_text_style.dart';
import 'package:new_app/core/utils/colors_asset_data.dart';
import 'package:new_app/features/home/presentation/views/widgets/pill_card_list_view.dart';

class PillsViewBody extends StatelessWidget {
  const PillsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Pills',
                      style: AppTextStyle.styleRegular20(context),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                          ColorsAssetData.primaryColor,
                        ),
                      ),
                      child: Text(
                        'Add Pill',
                        style: AppTextStyle.styleMedium18(context).copyWith(
                          color: ColorsAssetData.scaffoldColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(child: PillCardListView())
            ],
          ),
        ),
      ),
    );
  }
}
