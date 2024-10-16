import 'package:flutter/material.dart';
import 'package:new_app/features/home/presentation/views/widgets/pill_card_list_view.dart';
import 'package:new_app/features/home/presentation/views/widgets/pill_view_app_bar.dart';

class PillsViewBody extends StatelessWidget {
  const PillsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PillsViewAppBar(),
          Expanded(
            child: PillCardListView(),
          ),
        ],
      ),
    );
  }
}
