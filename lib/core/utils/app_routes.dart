import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:new_app/features/home/presentation/views/home_view.dart';
import 'package:new_app/features/home/presentation/views/nav_bar_view.dart';
import 'package:new_app/features/home/presentation/views/pills_view.dart';

abstract class AppRoutes {
  static const String kHomeView = '/homeView';
  static const String kPillsView = '/pillsView';

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
    ],
  );
}
