import 'package:go_router/go_router.dart';
import '../../features/screens.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/loading',
    routes: [
      GoRoute(
        path: '/loading',
        builder: (context, state) => const LoadingScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: '/forgot-password',
        builder: (context, state) => const ForgotPasswordScreen(),
      ),
      GoRoute(
        path: '/portfolio/overview',
        builder: (context, state) => const PortfolioOverviewScreen(),
      ),
      GoRoute(
        path: '/portfolio/holdings',
        builder: (context, state) => const MyHoldingsScreen(),
      ),
      GoRoute(
        path: '/market/news',
        builder: (context, state) => const MarketNewsScreen(),
      ),
      GoRoute(
        path: '/goals',
        builder: (context, state) => const FinancialGoalsScreen(),
      ),
      GoRoute(
        path: '/learning',
        builder: (context, state) => const LearningHubScreen(),
      ),
      GoRoute(
        path: '/alerts',
        builder: (context, state) => const SmartAlertsScreen(),
      ),
      GoRoute(
        path: '/regulatory',
        builder: (context, state) => const RegulatoryInfoScreen(),
      ),
      GoRoute(
        path: '/actions',
        builder: (context, state) => const QuickActionsScreen(),
      ),
      GoRoute(
        path: '/trading/buy-sell',
        builder: (context, state) => const BuySellScreen(),
      ),
      GoRoute(
        path: '/chat',
        builder: (context, state) => const ChatScreen(),
      ),
      GoRoute(
        path: '/chat/interface',
        builder: (context, state) => const ChatInterfaceScreen(),
      ),
    ],
    errorBuilder: (context, state) => const ErrorScreen(),
  );
}
