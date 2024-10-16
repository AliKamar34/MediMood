import 'package:flutter/material.dart';
import 'package:new_app/features/home/presentation/views/widgets/custom_drop_down.dart';

class ChoicesSection extends StatelessWidget {
  const ChoicesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: CustomDropDown(
            label: 'No Of Pills',
            items: [
              '1 pill',
              '2 pills',
              '3 pills',
            ],
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          flex: 2,
          child: CustomDropDown(
            label: 'Before & After',
            items: [
              'Before Food',
              'After Food',
            ],
          ),
        ),
      ],
    );
  }
}
