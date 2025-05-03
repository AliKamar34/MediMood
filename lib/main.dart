import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:new_app/core/services/notifications_service.dart';
import 'package:new_app/core/utils/app_routes.dart';
import 'package:new_app/core/utils/colors_asset_data.dart';
import 'package:new_app/core/utils/constant.dart';
import 'package:new_app/features/home/data/models/pill_model.dart';
import 'package:new_app/features/home/data/repos/home_repo_impl.dart';
import 'package:new_app/features/home/presentation/manager/get_pills_cubit/get_pills_cubit.dart';
import 'package:new_app/features/note/data/models/note_model.dart';
import 'package:new_app/features/note/data/repos/note_repo_impl.dart';
import 'package:new_app/features/note/presentation/manager/get_notes_cubit/get_notes_cubit.dart';
import 'package:new_app/simple_bloc_observer.dart';

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
      ],
      child: MaterialApp.router(
        locale: const Locale('en'),
        debugShowCheckedModeBanner: false,
        routerConfig: AppRoutes.router,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: ColorsAssetData.scaffoldColor,
        ),
      ),
    );
  }
}
