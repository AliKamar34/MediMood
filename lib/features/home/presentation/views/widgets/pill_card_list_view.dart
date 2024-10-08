import 'package:flutter/material.dart';
import 'package:new_app/features/home/presentation/views/widgets/pill_card.dart';

class PillCardListView extends StatelessWidget {
  const PillCardListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return const PillCard();
      },
    );
  }
}
