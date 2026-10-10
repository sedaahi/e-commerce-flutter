# Flutter E-Commerce App

A simple e-commerce application built with Flutter and Dart as a learning project. It focuses on product browsing, product details, and a shopping cart interface.

<p align="center">
  <img src="./demo/demo.gif" alt="Cookbook" height="400" style="border-radius: 35px;" />
</p>

## Overview

The project includes:

- A basic login screen with name and surname fields.
- A home screen for displaying products.
- A product details screen.
- A shopping cart screen and an empty-cart component.
- Reusable product and cart widgets.
- Separate services for API requests and local storage.

## Technologies

- **Flutter** — Application UI.
- **Dart** — Programming language.
- **HTTP** — API requests.
- **Shared Preferences** — Local key-value storage.
- **Cupertino Icons** — iOS-style icons.

## Dependencies

The following dependencies are declared in `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  shared_preferences: ^2.5.6
  http: ^1.6.0
```

## Project Organization

| Path | Purpose |
| --- | --- |
| `lib/main.dart` | Application entry point |
| `lib/components/` | Reusable product cards, cart widgets, and empty-cart UI |
| `lib/models/` | Product data models |
| `lib/services/` | API communication and local storage |
| `lib/views/` | Application screens |

The code is organized into separate folders to keep UI components, data models, and services easy to maintain.

## Getting Started

### Prerequisites

- Flutter SDK with its bundled Dart SDK.
- An editor such as VS Code or Android Studio.
- A connected device or an emulator.

### Installation

1. Download or clone the repository.
2. Open a terminal in the project directory.
3. Install the dependencies:

```bash
flutter pub get
```

4. Run the application:

```bash
flutter run
```

An internet connection is required when loading products from the API.

## Build an Android APK

To generate separate release APKs for each supported CPU architecture:

```bash
flutter build apk --split-per-abi
```

The generated APK files are located in:

```text
build/app/outputs/flutter-apk/
```

## Learning Goals

This project provides practice with:

- Building interfaces with Flutter widgets.
- Creating reusable components.
- Organizing a Flutter project.
- Working with APIs and asynchronous operations.
- Mapping product data to Dart models.
- Saving simple data locally.
- Navigating between screens.

## Project Status

This is an educational project under development.

## Author

Seda Ahi