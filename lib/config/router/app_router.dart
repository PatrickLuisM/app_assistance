import 'package:app_assistance/screens/screens.dart';
import 'package:go_router/go_router.dart';
import '../internet_connection/connection.dart';

// GoRouter configuration
final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      // name: HomeScreen.name,
      builder: (context, state) => ConnectivityScreen(),
    ),
    GoRoute(
      path: '/login',
      // name: HomeScreen.name,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/home',
      // name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/qr',
      // name: HomeScreen.name,
      builder: (context, state) => const QrScreen(),
    ),
    GoRoute(
      path: '/info',
      // name: HomeScreen.name,
      builder: (context, state) => const InfoScreen(),
    ),
  ],
);
