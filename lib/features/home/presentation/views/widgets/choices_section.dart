import 'package:flutter/material.dart';
import 'package:new_app/features/home/presentation/views/widgets/custom_drop_down.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
            label: AppLocalizations.of(context)!.noOfPills,
            items: [
              '1 ${AppLocalizations.of(context)!.pills}',
              '2 ${AppLocalizations.of(context)!.pills}',
              '3 ${AppLocalizations.of(context)!.pills}',
            ],
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 2,
          child: CustomDropDown(
            onSaved: savedBeforeAndAfter,
            initialValue: initialBeforeAndAfter,
            label: AppLocalizations.of(context)!.beforeAndAfter,
            items: [
              AppLocalizations.of(context)!.beforeFood,
              AppLocalizations.of(context)!.afterFood,
            ],
          ),
        ),
      ],
    );
  }
}
