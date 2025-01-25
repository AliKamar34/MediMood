import 'package:flutter/material.dart';
import 'package:new_app/core/utils/app_text_style.dart';
import 'package:new_app/core/utils/colors_asset_data.dart';

class CustomTimePicker extends StatefulWidget {
  const CustomTimePicker({super.key, required this.onTimeSelected});
  final Function(String) onTimeSelected;

  @override
  State<CustomTimePicker> createState() => _CustomTimePickerState();
}

class _CustomTimePickerState extends State<CustomTimePicker> {
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
      widget.onTimeSelected(selectedTime.format(context));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          selectedTime.format(context),
          style: AppTextStyle.styleMedium18(context),
        ),
        const Expanded(child: SizedBox(width: 10)),
        ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(
                ColorsAssetData.primaryColor,
              ),
            ),
            onPressed: () => selectTime(context),
            child: Text(
              'Select Time',
              style: AppTextStyle.styleMedium14(context).copyWith(
                color: ColorsAssetData.scaffoldColor,
              ),
            )),
      ],
    );
  }
}
