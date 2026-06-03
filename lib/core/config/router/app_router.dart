import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mediezy_task/core/config/di/injection.dart';
import 'package:mediezy_task/core/services/storage_services.dart';
import 'package:mediezy_task/features/auth/view/login_screen.dart';
import 'package:mediezy_task/features/auth/view/sign_up_screen.dart';
import 'package:mediezy_task/features/auth/view_model/auth_bloc.dart';
import 'package:mediezy_task/features/home/view/user_dashboard_screen.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: "/",

    redirect: (context, state) {
      final storage = sl<StorageService>();

      final loggedIn = storage.isLoggedInSync;

      final isLogin = state.matchedLocation == "/login";
      final isSignUp = state.matchedLocation == "/sign_up";

      if (!loggedIn && !isLogin && !isSignUp) {
        return "/login";
      }

      if (loggedIn && isLogin) {
        return "/home";
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) {
          return BlocProvider(
            create: (_) => sl<AuthBloc>(),
            child: LoginScreen(),
          );
        },
      ),

      GoRoute(
        path: '/sign_up',
        builder: (context, state) {
          return BlocProvider(
            create: (_) => sl<AuthBloc>(),
            child: SignUpScreen(),
          );
        },
      ),

      GoRoute(
        path: "/home",

        builder: (context, state) {
          return UserDashBoardScreen();
        },
      ),
    ],
  );
}
