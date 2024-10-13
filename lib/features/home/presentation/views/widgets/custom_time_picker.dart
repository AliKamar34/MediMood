import 'package:flutter/material.dart';
import 'package:new_app/core/utils/app_text_style.dart';
import 'package:new_app/core/utils/colors_asset_data.dart';

class CustomTimePicker extends StatelessWidget {
  const CustomTimePicker({super.key});

  @override
  Widget build(BuildContext context) {
    TimeOfDay selectedTime = TimeOfDay.now();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${selectedTime.hour}:${selectedTime.minute}',
          style: AppTextStyle.styleBold24(context),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(
              ColorsAssetData.primaryColor,
            ),
          ),
          onPressed: () async {
            final TimeOfDay? timeOfDay = await showTimePicker(
              context: context,
              initialTime: selectedTime,
              initialEntryMode: TimePickerEntryMode.dial,
            );
            if (timeOfDay != null) {
              selectedTime = timeOfDay;
            }
          },
          child: Text(
            'time',
            style: AppTextStyle.styleMedium18(context).copyWith(
              color: ColorsAssetData.scaffoldColor,
            ),
          ),
        ),
      ],
    );
  }
}
