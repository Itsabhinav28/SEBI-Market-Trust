# 🚀 SEBI MarketTrust App

<div align="center">
  <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter">
  <img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="Dart">
  <img src="https://img.shields.io/badge/Android-3DDC84?style=for-the-badge&logo=android&logoColor=white" alt="Android">
  <img src="https://img.shields.io/badge/iOS-000000?style=for-the-badge&logo=ios&logoColor=white" alt="iOS">
  <img src="https://img.shields.io/badge/Web-4285F4?style=for-the-badge&logo=googlechrome&logoColor=white" alt="Web">
</div>

<div align="center">
  <img src="assets/images/overview img.png" alt="SEBI MarketTrust App Overview" width="800" style="border-radius: 20px; box-shadow: 0 8px 32px rgba(0,0,0,0.1);">
</div>

## 📱 Project Overview

The **SEBI MarketTrust App** is a cutting-edge, responsive Flutter application designed to revolutionize investor education and engagement in the Indian securities market. Built with a focus on professional UI/UX and comprehensive financial tools, this app addresses the critical need for accessible, vernacular-friendly financial education while providing a complete trading and portfolio management experience.

### 🎯 **Problem Statement**
- Many retail investors lack the knowledge to navigate the securities market effectively
- Poor investment decisions due to reliance on unverified advice
- Limited educational material in vernacular languages
- Need for interactive, engaging financial education tools

### 💡 **Solution**
A comprehensive mobile application that combines:
- **Interactive Financial Education** with visual explanations and vernacular support
- **Professional Trading Interface** with real-time calculations
- **AI-Powered Chatbot** for personalized financial guidance
- **Portfolio Management** with advanced analytics
- **Smart Alerts** and goal tracking systems

---

## ✨ Key Features

### 🤖 **AI-Powered FinBot Chat Interface**
- **Intelligent Responses**: Hardcoded financial context covering SIPs, Mutual Funds, SEBI Regulations, Market Analysis, Portfolio Management, Tax Planning, and Risk Management
- **Graph Visualization**: Interactive financial charts (Line, Bar, Pie) with fixed Y-axis overlapping issues
- **Professional Design**: Enhanced chat bubbles, realistic typing delays, and industry-level formatting
- **Keyword Detection**: Smart response system with contextual answers

### 💰 **Functional Buy/Sell Trading Interface**
- **Real-time Calculations**: Automatic order summary updates (Quantity × Price, 0.1% Brokerage, Total Amount)
- **Live Stock Data**: Current prices, high/low, volume, and percentage changes
- **Quick Actions**: Pre-set quantity buttons (10, 25, 50, 100 shares)
- **Order Confirmation**: Professional dialog system with immediate feedback
- **Smart Input**: Pre-filled current market prices with validation

### 📊 **Comprehensive Portfolio Management**
- **Interactive Charts**: Advanced portfolio visualization with fl_chart library
- **Holdings Overview**: Detailed stock and mutual fund holdings
- **Performance Analytics**: Real-time portfolio performance tracking
- **Quick Actions**: Easy access to trading and management tools

### 🎓 **Learning Hub - Investor Education Portal**
- **Visual Explanation Cards**: Complex financial concepts made simple
- **Interactive Tutorials**: Step-by-step learning modules
- **Progress Tracking**: Learning journey monitoring
- **Vernacular Support**: Multi-language educational content

### 🔔 **Smart Alerts System**
- **Customizable Notifications**: Market movements, price changes, and important events
- **Priority Management**: High, medium, and low priority alert categorization
- **Professional Cards**: Clean, informative alert displays
- **Behavioral Insights**: User activity and pattern analysis

### 🎯 **Financial Goals Tracking**
- **Goal Setting**: Short-term and long-term financial objectives
- **Progress Visualization**: Interactive progress bars and charts
- **Achievement System**: Milestone tracking and rewards
- **Professional Design**: Clean, motivating goal cards

### 👤 **User Profile & Settings**
- **Account Management**: Comprehensive profile settings
- **Transaction History**: Complete trading history
- **Help & Support**: Integrated support system
- **Compact Design**: Professional, space-efficient interface

### 📰 **Market News & Insights**
- **Live Updates**: Real-time market news and analysis
- **Professional Cards**: Clean, readable news presentation
- **Status Indicators**: Breaking news and priority markers
- **Categorized Content**: Organized by market sectors and topics

---

## 🛠️ Technologies Used

| Technology | Purpose | Version |
|------------|---------|---------|
| **Flutter** | Cross-platform mobile framework | 3.x+ |
| **Dart** | Programming language | 3.x+ |
| **fl_chart** | Interactive charting library | Latest |
| **go_router** | Declarative routing | Latest |
| **Material Design 3** | UI/UX design system | Latest |

### 📱 **Platform Support**
- ✅ **Android** - Native performance with Material Design
- ✅ **iOS** - Optimized for iOS design guidelines  
- ✅ **Web** - Responsive web application
- ✅ **Desktop** - Windows, macOS, Linux support

---

## 🎨 Design System

### **Professional Color Palette**
```dart
Primary Dark:   #324E7B  // Deep professional blue
Primary Light:  #86A6DF  // Soft periwinkle blue  
Primary Medium: #5068A9  // Balanced blue
Background:     #F8F8F8  // Clean off-white
```

### **UI/UX Principles**
- **Consistent Design Language**: Professional gradients, shadows, and typography
- **Responsive Layout**: Optimized for all screen sizes
- **Accessibility**: WCAG compliant design patterns
- **Performance**: Smooth animations and transitions
- **Industry Standards**: Banking and fintech design best practices

---

## 🚀 Getting Started

### **Prerequisites**
- Flutter SDK (3.x or higher)
- Dart SDK (comes with Flutter)
- Android Studio / VS Code
- Git

### **Installation**

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/sebi-markettrust-app.git
   cd sebi-markettrust-app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the application**
   ```bash
   # For mobile devices
   flutter run
   
   # For specific device
   flutter run -d <device-id>
   
   # For web
   flutter run -d chrome
   ```

### **Build for Production**

```bash
# Android APK
flutter build apk --release

# iOS App
flutter build ios --release

# Web App
flutter build web --release
```

---

## 📱 Screenshots

### **Dashboard & Navigation**
- Professional home screen with quick stats
- Intuitive bottom navigation
- Side drawer with comprehensive menu

### **Trading Interface**
- Real-time stock data display
- Calculative order summary
- Professional confirmation dialogs

### **AI Chat Bot**
- Intelligent financial responses
- Interactive graph visualization
- Professional chat interface

### **Portfolio Management**
- Interactive charts and analytics
- Holdings overview
- Performance tracking

---

## 🏗️ Project Structure

```
lib/
├── core/                    # Core utilities and constants
│   ├── constants/          # App constants and colors
│   ├── theme/              # Theme configuration
│   └── widgets/            # Reusable widgets
├── features/               # Feature modules
│   ├── home/               # Dashboard and home screen
│   ├── portfolio/          # Portfolio management
│   ├── chat/               # AI chatbot interface
│   ├── learning/           # Educational content
│   ├── trading/            # Buy/sell functionality
│   ├── alerts/             # Smart alerts system
│   ├── goals/              # Financial goals tracking
│   ├── profile/            # User profile management
│   └── news/               # Market news and insights
└── main.dart               # App entry point
```

---

## 🔧 Configuration

### **Environment Setup**
- No API keys required for basic functionality
- All sensitive data uses environment variables
- Professional color scheme pre-configured
- Responsive design automatically adapts

### **Customization**
- Easy color scheme modification in `lib/core/constants/app_colors.dart`
- Theme customization in `lib/core/theme/app_theme.dart`
- Feature-specific configurations in respective modules

---

## 🚀 Key Achievements

### **Technical Excellence**
- ✅ **100% Flutter** - Single codebase for all platforms
- ✅ **Professional UI/UX** - Industry-level design standards
- ✅ **Real-time Calculations** - Live trading interface
- ✅ **AI Integration** - Intelligent chatbot responses
- ✅ **Chart Visualization** - Advanced financial charts
- ✅ **Responsive Design** - Works on all screen sizes

### **User Experience**
- ✅ **Intuitive Navigation** - Easy-to-use interface
- ✅ **Professional Design** - Banking-grade aesthetics
- ✅ **Fast Performance** - Optimized for speed
- ✅ **Accessibility** - Inclusive design principles
- ✅ **Multi-language Ready** - Vernacular support framework

---

## 🔮 Future Enhancements

### **Phase 2 Features**
- [ ] Real-time market data API integration
- [ ] User authentication and profile management
- [ ] Push notifications for smart alerts
- [ ] Advanced technical indicators
- [ ] Social trading features
- [ ] Voice commands for accessibility

### **Phase 3 Features**
- [ ] Blockchain integration for transparency
- [ ] AI-powered investment recommendations
- [ ] Advanced portfolio analytics
- [ ] Multi-language support (Hindi, Tamil, Bengali, etc.)
- [ ] Offline mode capabilities
- [ ] Advanced security features

---

## 🤝 Contributing

We welcome contributions! Please follow these steps:

1. **Fork the repository**
2. **Create a feature branch** (`git checkout -b feature/AmazingFeature`)
3. **Commit your changes** (`git commit -m 'Add some AmazingFeature'`)
4. **Push to the branch** (`git push origin feature/AmazingFeature`)
5. **Open a Pull Request**

### **Development Guidelines**
- Follow Flutter/Dart best practices
- Maintain consistent code formatting
- Write meaningful commit messages
- Add tests for new features
- Update documentation as needed

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 🙏 Acknowledgments

- **SEBI** for inspiring investor education initiatives
- **Flutter Team** for the amazing framework
- **fl_chart** for beautiful charting capabilities
- **Material Design** for design system guidance
- **Open Source Community** for continuous inspiration

---

<div align="center">
  <h3>🌟 Star this repository if you found it helpful! 🌟</h3>
  <p>Built with ❤️ for the Indian financial market</p>
</div>
