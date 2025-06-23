# Flutter Login App

A professional Flutter application demonstrating secure authentication with clean architecture, state management, and modern UI/UX design patterns.

## 🚀 Features

- 🔐 **Secure Authentication** - Email/password login with API integration
- 💾 **Secure Token Storage** - Encrypted storage using FlutterSecureStorage
- 🎨 **Modern UI/UX** - Material Design 3 with clean, responsive interface
- ⚡ **GetX State Management** - Reactive programming and navigation
- 🛡️ **Input Validation** - Comprehensive form validation
- 🔄 **Loading States** - Visual feedback during API operations
- 📱 **Responsive Design** - Optimized for different screen sizes
- 🌙 **Theme Support** - Light and dark mode support
- 🚨 **Error Handling** - User-friendly error messages and network handling

## 🛠️ Technologies Used

- **Framework**: Flutter 3.10+
- **Language**: Dart 3.0+
- **State Management**: GetX 4.6.6
- **HTTP Client**: http 1.1.0
- **Secure Storage**: flutter_secure_storage 9.0.0
- **Architecture**: Clean Architecture + MVVM
- **Design System**: Material Design 3
- **API**: REST API integration

## 📋 Prerequisites

- Flutter SDK 3.10.0 or higher
- Dart SDK 3.0.0 or higher
- Android Studio / VS Code
- Android SDK (for Android development)
- Xcode (for iOS development - macOS only)

## 🚀 Installation

### Method 1: Clone & Run

```bash
# Clone the repository
git clone https://github.com/yourusername/flutter-login-app.git
cd flutter-login-app

# Install dependencies
flutter pub get

# Run the app
flutter run
```

### Method 2: New Project Setup (Recommended if facing Gradle issues)

```bash
# Create new Flutter project
flutter create --org com.example login_app
cd login_app

# Copy dependencies to pubspec.yaml
# Copy lib folder from this project

# Install dependencies
flutter pub get

# Run the app
flutter run
```

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.6
  get: ^4.6.6
  http: ^1.1.0
  get_storage: ^2.1.1
  flutter_secure_storage: ^9.0.0

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^3.0.0         # Linting rules
```

## 📁 Folder Structure

```
lib/
├── main.dart                    # App entry point and service initialization
├── app/
│   ├── routes/
│   │   └── app_routes.dart     # Navigation routes configuration
│   └── theme/
│       └── app_theme.dart      # App theme and styling
├── core/
│   ├── constants/
│   │   └── api_constants.dart  # API endpoints and constants
│   ├── services/
│   │   ├── api_service.dart    # HTTP service with error handling
│   │   └── storage_service.dart # Secure token storage service
│   └── utils/
│       └── validators.dart     # Input validation utilities
├── features/
│   ├── auth/
│   │   ├── controllers/
│   │   │   └── auth_controller.dart    # Authentication business logic
│   │   ├── models/
│   │   │   ├── login_request.dart      # Login request model
│   │   │   └── login_response.dart     # Login response model
│   │   ├── services/
│   │   │   └── auth_service.dart       # Authentication service
│   │   └── views/
│   │       └── login_screen.dart       # Login UI screen
│   └── home/
│       └── views/
│           └── home_screen.dart        # Home dashboard screen
└── widgets/
    ├── custom_button.dart      # Reusable button with loading states
    └── custom_text_field.dart  # Reusable input field with validation
```

## 🔧 Configuration

### API Configuration

Update the API endpoint in `lib/core/constants/api_constants.dart`:

```dart
class ApiConstants {
  static const String baseUrl = 'https://api.escuelajs.co';
  static const String loginEndpoint = '/api/v1/auth/login';
}
```

### Test Credentials

Use these credentials to test the login functionality:

```
Email: john@mail.com
Password: changeme
```

### Key Components:

- **Controllers**: Handle business logic and state management
- **Services**: Manage data operations and API calls
- **Models**: Define data structures and serialization
- **Views**: UI components and screens
- **Widgets**: Reusable UI components


## 🐛 Troubleshooting

### Common Issues

#### 1. Gradle Plugin Error
```
Error: Flutter's main Gradle plugin imperatively using apply script method
```
**Solution**: Use Method 2 installation (create new project and migrate code)

#### 2. Secure Storage Error
```
MissingPluginException: No implementation found for method
```
**Solution**:
```bash
flutter clean
flutter pub get
cd android && ./gradlew clean && cd ..
flutter run
```

#### 3. Network Connection Error
```
No internet connection
```
**Solution**: Check internet connectivity and API endpoint availability

#### 4. Build Errors
```bash
# Complete clean and rebuild
flutter clean
flutter pub get
cd android
./gradlew clean
cd ..
flutter run
```

### Flutter Doctor

Check your development environment:

```bash
flutter doctor
flutter doctor --android-licenses
```


## 🔄 State Management Flow

```
User Action → Controller → Service → API
     ↑                              ↓
     └──── UI Update ←──────────────┘
```

⭐ **If you found this project helpful, please give it a star!** ⭐
