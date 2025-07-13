import 'package:go_router/go_router.dart';
import 'package:paynetic/features/home/presentation/screens/home_screen.dart';
import 'package:paynetic/features/home/presentation/widgets/bottombar_widget.dart';
import 'package:paynetic/features/onboarding/export_onboard.dart';
import 'package:paynetic/features/onboarding/presentation/screens/onboarding_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/onboarding',
  routes: [
    GoRoute(
      path: '/onboarding',
      name: 'onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
    // GoRoute(
    //   path: '/auth',
    //   name: 'auth',
    //   pageBuilder: (context, state) {
    //     return CustomTransitionPage(
    //       key: state.pageKey,
    //       child: const AuthScreen(),
    //       transitionDuration: const Duration(milliseconds: 500),
    //       transitionsBuilder: (context, animation, secondaryAnimation, child) {
    //         return SlideTransition(
    //           position: Tween<Offset>(
    //             begin: const Offset(0, 1),
    //             end: Offset.zero,
    //           ).animate(CurvedAnimation(
    //             parent: animation,
    //             curve: Curves.easeOut,
    //           )),
    //           child: child,
    //         );
    //       },
    //     );
    //   },
    // ),
    GoRoute(
      path: '/home',
      name: 'home',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: const HomeWithBottomNav(),
          transitionDuration: const Duration(milliseconds: 600),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      path: '/start',
      name: 'start',
      builder: (context, state) => const HomeWithBottomNav(),
    ),
  ],
);
