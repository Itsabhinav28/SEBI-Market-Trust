# SEBI MarketTrust App

A comprehensive Flutter-based financial market application designed to provide users with portfolio management, market insights, and financial education tools.

## 🚀 Features

### Core Features
- **Portfolio Management**: Track investments, view holdings, and monitor performance
- **Market News**: Real-time market updates and financial news
- **Financial Goals**: Set and track financial objectives
- **Learning Hub**: Educational content for financial literacy
- **Smart Alerts**: Personalized notifications for market movements
- **Chat Interface**: AI-powered financial assistance
- **Regulatory Information**: SEBI guidelines and compliance updates

### Technical Features
- **Responsive Design**: Optimized for mobile, tablet, and desktop
- **Material Design 3**: Modern UI/UX following Google's design guidelines
- **State Management**: Provider pattern for efficient state handling
- **Navigation**: GoRouter for advanced routing capabilities
- **Theme Support**: Light and dark theme options
- **Local Storage**: Hive database for offline data persistence

## 📱 Screens

The app includes the following main screens:

1. **Splash Screen** - App introduction and loading
2. **Home Dashboard** - Main overview with quick actions
3. **Portfolio Overview** - Investment portfolio summary
4. **My Holdings** - Detailed stock holdings
5. **Market News** - Financial market updates
6. **Financial Goals** - Goal setting and tracking
7. **Learning Hub** - Educational content
8. **Smart Alerts** - Notification management
9. **Regulatory Info** - SEBI compliance information
10. **Quick Actions** - Common financial operations
11. **Chat Interface** - AI financial assistant
12. **Profile** - User account management

## 🛠️ Setup Instructions

### Prerequisites
- Flutter SDK (3.0.0 or higher)
- Dart SDK (3.0.0 or higher)
- Android Studio / VS Code
- Git

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd sebi_markettrust_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Build Commands

- **Debug Build**: `flutter run`
- **Release Build**: `flutter build apk` (Android) or `flutter build ios` (iOS)
- **Web Build**: `flutter build web`

## 📁 Project Structure

```
lib/
├── core/                           # Core app functionality
│   ├── constants/                  # App constants
│   ├── providers/                  # App-wide providers
│   ├── routes/                     # Navigation routes
│   ├── theme/                      # App themes
│   ├── widgets/                    # Shared widgets
│   └── screens/                    # Error screens
├── features/                       # Feature modules
│   ├── auth/                       # Authentication
│   ├── home/                       # Home dashboard
│   ├── portfolio/                  # Portfolio management
│   ├── market/                     # Market data
│   ├── goals/                      # Financial goals
│   ├── learning/                   # Learning content
│   ├── alerts/                     # Smart alerts
│   ├── regulatory/                 # Regulatory info
│   ├── actions/                    # Quick actions
│   ├── chat/                       # Chat functionality
│   ├── profile/                    # User profile
│   └── settings/                   # App settings
└── main.dart                       # App entry point
```

## 🎨 Design System

### Colors
- **Primary**: Blue (#1976D2)
- **Secondary**: Light Blue (#42A5F5)
- **Accent**: Orange (#FF9800)
- **Success**: Green (#4CAF50)
- **Error**: Red (#F44336)
- **Warning**: Amber (#FFC107)
- **Info**: Blue (#2196F3)

### Typography
- **Font Family**: Poppins
- **Font Weights**: Regular (400), Medium (500), SemiBold (600), Bold (700)

### Spacing
- **Small**: 8px
- **Default**: 16px
- **Large**: 24px

### Border Radius
- **Small**: 8px
- **Default**: 12px
- **Large**: 16px

## 🔧 Configuration

### Environment Variables
Create a `.env` file in the root directory:
```env
API_BASE_URL=https://api.sebimarkettrust.com
API_VERSION=/v1
```

### API Configuration
Update API endpoints in `lib/core/constants/app_constants.dart`

## 📱 Responsive Design

The app is designed to work seamlessly across different screen sizes:

- **Mobile**: 320px - 600px
- **Tablet**: 600px - 900px
- **Desktop**: 900px+

## 🧪 Testing

Run tests using the following commands:

```bash
# Unit tests
flutter test

# Widget tests
flutter test test/widget_test.dart

# Integration tests
flutter test integration_test/
```

## 📦 Dependencies

### Core Dependencies
- `flutter`: Flutter SDK
- `provider`: State management
- `go_router`: Navigation
- `hive_flutter`: Local storage
- `http`: HTTP client
- `responsive_framework`: Responsive design

### UI Dependencies
- `cupertino_icons`: iOS-style icons
- `flutter_svg`: SVG support
- `google_fonts`: Custom fonts
- `fl_chart`: Charts and graphs
- `lottie`: Animations

## 🚀 Deployment

### Android
1. Update `android/app/build.gradle` version
2. Run `flutter build apk --release`
3. Test on device
4. Upload to Google Play Store

### iOS
1. Update `ios/Runner/Info.plist` version
2. Run `flutter build ios --release`
3. Archive in Xcode
4. Upload to App Store Connect

### Web
1. Run `flutter build web`
2. Deploy to hosting service (Firebase, Netlify, etc.)

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 📞 Support

For support and questions:
- Email: support@sebimarkettrust.com
- Documentation: [Link to docs]
- Issues: [GitHub Issues]

## 🔄 Changelog

### Version 1.0.0
- Initial release
- Core app functionality
- Responsive design
- Basic portfolio management
- Market news integration

---

**Note**: This is a frontend-only implementation. Backend services and real market data integration would need to be implemented separately.

