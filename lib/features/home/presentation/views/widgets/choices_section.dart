import 'package:flutter/material.dart';
import 'package:new_app/features/home/presentation/views/widgets/custom_drop_down.dart';

class ChoicesSection extends StatelessWidget {
  const ChoicesSection({
    super.key,
    this.savedNoOfPills,
    this.savedBeforeAndAfter,
    this.initialNoOfPills,
    this.initialBeforeAndAfter,
  });
  final void Function(String?)? savedNoOfPills;
  final void Function(String?)? savedBeforeAndAfter;
  final String? initialNoOfPills;
  final String? initialBeforeAndAfter;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomDropDown(
            onSaved: savedNoOfPills,
            initialValue: initialNoOfPills,
            label: 'No Of Pills',
            items: const [
              '1 pill',
              '2 pills',
              '3 pills',
            ],
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 2,
          child: CustomDropDown(
            onSaved: savedBeforeAndAfter,
            initialValue: initialBeforeAndAfter,
            label: 'Before & After',
            items: const [
              'Before Food',
              'After Food',
            ],
          ),
        ),
      ],
    );
  }
}
