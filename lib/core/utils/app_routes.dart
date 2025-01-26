import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:new_app/features/home/data/models/pill_model.dart';
import 'package:new_app/features/home/data/repos/home_repo_impl.dart';
import 'package:new_app/features/home/presentation/manager/add_pill_cubit/add_pill_cubit.dart';
import 'package:new_app/features/home/presentation/views/edit_pill_view.dart';
import 'package:new_app/features/home/presentation/views/home_view.dart';
import 'package:new_app/features/home/presentation/views/nav_bar_view.dart';
import 'package:new_app/features/home/presentation/views/pills_view.dart';
import 'package:new_app/features/note/data/models/note_model.dart';
import 'package:new_app/features/note/data/repos/note_repo_impl.dart';
import 'package:new_app/features/note/presentation/manager/add_note_cubit/add_notes_cubit.dart';
import 'package:new_app/features/note/presentation/manager/edit_note_cubit/edit_note_cubit.dart';
import 'package:new_app/features/note/presentation/views/add_notes_view.dart';
import 'package:new_app/features/note/presentation/views/edit_note_view.dart';
import 'package:new_app/features/note/presentation/views/notes_view.dart';

abstract class AppRoutes {
  static const String kHomeView = '/homeView';
  static const String kPillsView = '/pillsView';
  static const String kEditPillView = '/editPillView';
  static const String kNotesView = '/notesView';
  static const String kAddNotesView = '/addnotesView';
  static const String kEditNotesView = '/editnotesView';

  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const CustomNavBar();
        },
      ),
      GoRoute(
        path: kHomeView,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeView();
        },
      ),
      GoRoute(
        path: kPillsView,
        builder: (BuildContext context, GoRouterState state) {
          return const PillsView();
        },
      ),
      GoRoute(
        path: kEditPillView,
        builder: (BuildContext context, GoRouterState state) {
          final pillModel = state.extra as PillModel?;
          return BlocProvider(
            create: (context) => AddPillCubit(HomeRepoImpl()),
            child: EditPillView(
              pillModel: pillModel,
            ),
          );
        },
      ),
      GoRoute(
        path: kNotesView,
        builder: (BuildContext context, GoRouterState state) {
          return const NotesView();
        },
      ),
      GoRoute(
        path: kAddNotesView,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) => AddNotesCubit(NoteRepoImpl()),
            child: const AddNotesView(),
          );
        },
      ),
      GoRoute(
        path: kEditNotesView,
        builder: (BuildContext context, GoRouterState state) {
          final noteModel = state.extra as NoteModel;
          return BlocProvider(
            create: (context) => EditNoteCubit(NoteRepoImpl()),
            child: EditNoteView(
              noteModel: noteModel,
            ),
          );
        },
      ),
    ],
  );
}
