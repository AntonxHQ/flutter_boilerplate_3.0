import 'package:antonx_flutter_boilerplate_3/app/app.logger.dart';
import 'package:antonx_flutter_boilerplate_3/routes/routes.dart';
import 'package:antonx_flutter_boilerplate_3/ui/views/chat/chat_view.dart';
import 'package:antonx_flutter_boilerplate_3/ui/views/conversation/conversation_view.dart';
import 'package:antonx_flutter_boilerplate_3/ui/views/detail/detail_view.dart';
import 'package:antonx_flutter_boilerplate_3/ui/views/error/error_view.dart';
import 'package:antonx_flutter_boilerplate_3/ui/views/home/home_view.dart';
import 'package:antonx_flutter_boilerplate_3/ui/views/map/map_view.dart';
import 'package:antonx_flutter_boilerplate_3/ui/views/profile/profile_view.dart';
import 'package:antonx_flutter_boilerplate_3/ui/views/root/root_view.dart';
import 'package:antonx_flutter_boilerplate_3/ui/views/profile_setting/profile_setting_view.dart';
import 'package:antonx_flutter_boilerplate_3/ui/views/sign_in/sign_in_view.dart';
import 'package:antonx_flutter_boilerplate_3/ui/views/startup/startup_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();

class AppRouter {
  /// GoRouter configuration
  final GoRouter _router = GoRouter(
    navigatorKey: _rootNavigatorKey,

    ///
    errorBuilder: (context, state) =>
        ErrorView(errorDetails: state.error.toString()),

    ///
    initialLocation: AppRoutes.startup,

    ///
    routes: <RouteBase>[
      ///start up view
      GoRoute(
        path: AppRoutes.startup,
        builder: (context, state) => const StartupView(),
      ),

      ///sign in view
      GoRoute(
        path: AppRoutes.signIn,
        builder: (context, state) => const SignInView(),
      ),

      ///SHELL ROUTE
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (BuildContext context, GoRouterState state, Widget child) {
          getLogger("RouterClass").wtf(state.fullPath);
          return RootView(state: state, widget: child);
        },
        routes: [
          ///home
          GoRoute(
            path: AppRoutes.home,
            parentNavigatorKey: _shellNavigatorKey,
            builder: (BuildContext context, GoRouterState state) {
              return HomeView();
            },
            routes: [
              GoRoute(
                path: 'detail',
                parentNavigatorKey: _shellNavigatorKey,
                builder: (BuildContext context, GoRouterState state) {
                  return const DetailView();
                },
              ),
            ],
          ),

          ///conversation
          GoRoute(
            path: AppRoutes.conversation,
            parentNavigatorKey: _shellNavigatorKey,
            builder: (BuildContext context, GoRouterState state) {
              return const ConversationView();
            },
            routes: <RouteBase>[
              GoRoute(
                path: 'chat',
                parentNavigatorKey: _shellNavigatorKey,
                builder: (BuildContext context, GoRouterState state) {
                  return const ChatView();
                },
              ),
            ],
          ),

          ///map
          GoRoute(
            path: AppRoutes.map,
            parentNavigatorKey: _shellNavigatorKey,
            builder: (BuildContext context, GoRouterState state) {
              return const MapView();
            },
          ),

          ///profile
          GoRoute(
            path: AppRoutes.profile,
            parentNavigatorKey: _shellNavigatorKey,
            builder: (BuildContext context, GoRouterState state) {
              return const ProfileView();
            },
            routes: <RouteBase>[
              GoRoute(
                path: 'profile_setting',
                parentNavigatorKey: _shellNavigatorKey,
                builder: (BuildContext context, GoRouterState state) {
                  return const ProfileSettingView();
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );

  GoRouter get router => _router;
}
