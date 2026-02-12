import 'package:fitness_app/app/features/home/presentation/home_page.dart';
import 'package:fitness_app/shared/widgets/nav/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum AppRoute { home, session, profile }

GoRouter buildRouter() {
  return GoRouter(
    initialLocation: '/home',
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, shell) => BottomNavScaffold(shell: shell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                name: AppRoute.home.name,
                pageBuilder: (c, s) => const NoTransitionPage(
                  child: HomePage(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/sessions',
                name: AppRoute.session.name,
                pageBuilder: (c, s) => const NoTransitionPage(
                  child: Scaffold(body: Center(child: Text('Session'))),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                name: AppRoute.profile.name,
                pageBuilder: (c, s) => const NoTransitionPage(
                  child: Scaffold(body: Center(child: Text('Profile'))),
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
