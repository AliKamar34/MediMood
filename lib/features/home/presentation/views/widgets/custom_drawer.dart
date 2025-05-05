import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:new_app/core/utils/assets_data.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:new_app/core/setting/cubit/setting_cubit.dart';
import 'package:new_app/core/setting/cubit/setting_state.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Drawer(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(child: Image.asset(AssetsData.logo)),
            ListTile(
              title: Text(AppLocalizations.of(context)!.language),
              trailing: InkWell(
                onTap: () {
                  BlocProvider.of<SettingsCubit>(context).changeLocale(
                      AppLocalizations.of(context)!.localeName == 'en'
                          ? const Locale('ar')
                          : const Locale('en'));
                },
                child: Text(
                  AppLocalizations.of(context)!.localeName == 'en' ? 'ع' : 'EN',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text(AppLocalizations.of(context)!.darkMode),
              trailing: BlocBuilder<SettingsCubit, SettingsState>(
                builder: (context, state) {
                  final isDark = state.themeMode == ThemeMode.dark;
                  return Switch(
                      value: isDark,
                      onChanged: (_) {
                        BlocProvider.of<SettingsCubit>(context).changeThemeMode(
                          isDark ? ThemeMode.light : ThemeMode.dark,
                        );
                      });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
