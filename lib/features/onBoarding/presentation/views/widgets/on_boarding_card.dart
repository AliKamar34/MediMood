import 'package:flutter/material.dart';
import 'package:new_app/core/utils/app_text_style.dart';
import 'package:new_app/core/utils/colors_asset_data.dart';

class OnBoardingCard extends StatelessWidget {
  const OnBoardingCard(
      {super.key,
      required this.title,
      required this.description,
      required this.textButton,
      required this.onPressed,
      required this.image});
  final String title;
  final String description;
  final String image;
  final String textButton;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      width: MediaQuery.of(context).size.width,
      child: Column(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: 280,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              children: [
                Text(
                  title,
                  style: AppTextStyle.styleMedium18(context),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Text(
                    description,
                    style: AppTextStyle.styleRegular14(context),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          // const Expanded(
          //   child: SizedBox(),
          // ),
          MaterialButton(
            minWidth: MediaQuery.of(context).size.width * 0.5,
            onPressed: onPressed,
            color: ColorsAssetData.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            child: Text(
              textButton,
              style: AppTextStyle.styleMedium14(context)
                  .copyWith(color: ColorsAssetData.scaffoldColor),
            ),
          )
        ],
      ),
    );
  }
}
