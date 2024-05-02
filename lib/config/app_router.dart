import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_go_router/cubit/login_cubit.dart';
import 'package:flutter_go_router/cubit/login_state.dart';
import 'package:flutter_go_router/screen/error_screen.dart';
import 'package:flutter_go_router/screen/first_screen.dart';
import 'package:flutter_go_router/screen/second_screen.dart';
import 'package:flutter_go_router/screen/login_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final LoginCubit loginCubit;
  AppRouter(this.loginCubit);

  late GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    routes: [
      // Top Level Routes
      GoRoute(
        path: "/login",
        name: "login_screen",
        builder: (context, state) {
          return LoginScreen();
        },
      ),

      GoRoute(
        path: "/",
        name: "first_screen",
        builder: (context, state) {
          return FirstScreen();
        },
        // sub routes(this pages will have the back button present)
        routes: [
          GoRoute(
            path: "second_screen",
            name: "second_screen",
            builder: (context, state) {
              final data = state.extra! as Map<String, dynamic>;
              return SecondScreen(
                firstArg: data["firstArg"] as String,
                secondArg: data["secondArg"] as String,
              );
            },
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) {
      return ErrorScreen();
    },
    redirect: (context, state) {
      // redirect a user based on a condition, here condition is found in bloc

      // check if user is loggedIn
      final bool isLoggedIn =
          this.loginCubit.state.status == AuthStatus.authenticated;

      // check if user is trying to login
      final bool logginIn = state.path == "/login";

      if (!isLoggedIn && !logginIn) {
        // check if user is not loggedIn
        // when not logged in check if user in loggin in page or not
        // if not in loggin page nav to that else do nothing
        return '/login';
      }

      if (logginIn) {
        // in loggin scren and authenticated
        // take me to app home
        return "/";
      }

      return null;
    },
    // refreshListenable: GoRouterRefreshStream(this.loginCubit.stream),
  );
}
// Root Router

// for scenarios where the page doesn't change when user is autheticated
class GoRouterRefreshStream extends ChangeNotifier {
  late final StreamSubscription<dynamic> _subscription;
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen((event) {
      return notifyListeners();
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
