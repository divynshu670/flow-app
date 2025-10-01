# FoodFlow
A compact Flutter assignment that implements a single realistic ordering workflow (browse restaurants → view menu → add to cart → review order → pay → confirmation).
Built with BLoC for state management, a small repository layer, neat Material Design styling, error handling and unit tests for the cart workflow.

# Screenshot- flow\assets\ScreenShot

# Features (what the assignment requires ✔)

 Single ordering workflow (no auth screens). ✔

 BLoC architecture (cart_bloc manages cart state). ✔

 Repository separation (CartRepository keeps persistence logic). ✔

 Proper error handling in BLoC (errors surfaced on state). ✔

 Aesthetically pleasing UI (rounded cards, Material 3 styles, Lottie success). ✔

 SOLID-friendly structure and small reusable widgets. ✔

 Unit tests for the workflow (cart_bloc tests). ✔

# Requirements (tested against)

 Flutter SDK >= 3.0 (recommended latest stable)

 Android/iOS simulator or a connected device

# Recommended dev environment:

 VS Code or Android Studio

 Dart/Flutter plugins

# Setup & run (quick)

 Clone the repo

 git clone https://github.com/<your-username>/foodflow.git
 cd foodflow


Install dependencies

flutter pub get

Run on device or emulator

flutter run

Run tests

# flutter test

The test/bloc/cart_bloc_test.dart contains unit tests that validate CartBloc add/decrement/clear behaviour. 
