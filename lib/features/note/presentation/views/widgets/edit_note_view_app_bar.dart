import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EditNoteViewAppBar extends StatelessWidget {
  const EditNoteViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              GoRouter.of(context).pop();
            },
            child: const Icon(
              Icons.arrow_back,
              size: 26,
            ),
          ),
          InkWell(
            onTap: () {},
            child: const Icon(
              Icons.check,
              size: 26,
            ),
          )
        ],
      ),
    );
  }
}
