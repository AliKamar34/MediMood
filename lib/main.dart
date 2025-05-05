import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:new_app/core/services/notifications_service.dart';
import 'package:new_app/core/setting/themes.dart';
import 'package:new_app/core/utils/app_routes.dart';
import 'package:new_app/core/utils/constant.dart';
import 'package:new_app/features/home/data/models/pill_model.dart';
import 'package:new_app/features/home/data/repos/home_repo_impl.dart';
import 'package:new_app/features/home/presentation/manager/get_pills_cubit/get_pills_cubit.dart';
import 'package:new_app/features/note/data/models/note_model.dart';
import 'package:new_app/features/note/data/repos/note_repo_impl.dart';
import 'package:new_app/features/note/presentation/manager/get_notes_cubit/get_notes_cubit.dart';
import 'package:new_app/core/setting/cubit/setting_cubit.dart';
import 'package:new_app/core/setting/cubit/setting_state.dart';
import 'package:new_app/simple_bloc_observer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(PillModelAdapter());
  await Hive.openBox<PillModel>(Constant.kPillsBox);
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(Constant.kNotesBox);

  // await NotificationService().requestNotificationPermission();
  await NotificationService().initNotifications();

  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetNotesCubit(NoteRepoImpl())..getNotes(),
        ),
        BlocProvider(
          create: (context) => GetPillsCubit(HomeRepoImpl())..getPills(),
        ),
        BlocProvider(create: (context) => SettingsCubit()..loadSettings()),
      ],
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return MaterialApp.router(
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en'),
              Locale('ar'),
            ],
            locale: state.locale,
            debugShowCheckedModeBanner: false,
            routerConfig: AppRoutes.router,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: state.themeMode,
          );
        },
      ),
    );
  }
}
