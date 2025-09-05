import 'package:provider/provider.dart';
import '../../features/auth/providers/auth_provider.dart';
import '../../features/home/providers/home_provider.dart';
import '../../features/portfolio/providers/portfolio_provider.dart';
import '../../features/market/providers/market_provider.dart';
import '../../features/chat/providers/chat_provider.dart';
import '../../features/settings/providers/settings_provider.dart';

class AppProviders {
  static List<ChangeNotifierProvider> get providers => [
        // Auth Provider
        ChangeNotifierProvider<AuthProvider>(
          create: (context) => AuthProvider(),
        ),

        // Home Provider
        ChangeNotifierProvider<HomeProvider>(
          create: (context) => HomeProvider(),
        ),

        // Portfolio Provider
        ChangeNotifierProvider<PortfolioProvider>(
          create: (context) => PortfolioProvider(),
        ),

        // Market Provider
        ChangeNotifierProvider<MarketProvider>(
          create: (context) => MarketProvider(),
        ),

        // Chat Provider
        ChangeNotifierProvider<ChatProvider>(
          create: (context) => ChatProvider(),
        ),

        // Settings Provider
        ChangeNotifierProvider<SettingsProvider>(
          create: (context) => SettingsProvider(),
        ),
      ];
}
