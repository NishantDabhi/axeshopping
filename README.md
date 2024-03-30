# Flutter Shopping Tracker APK

## Description
Flutter Shopping Tracker APK is a mobile application developed using Flutter that helps users track their shopping items. The app features a home page with a ListView where each list item is represented by a Card widget for better visualization. Users can add new shopping items, view item details, and remove items from the home screen. All operations, including adding, showing, and deleting items, are handled by Firebase Realtime Database and Firebase Storage, ensuring real-time synchronization and data persistence.

## Screenshots
<img src="https://github.com/NishantDabhi/axeshopping/assets/101393352/c26388ce-66aa-48f6-b2b1-4ba5eec2183b" height="440">
<img src="https://github.com/NishantDabhi/axeshopping/assets/101393352/9c4f4835-8b59-49c2-a578-f99785dac796" height="440">
<img src="https://github.com/NishantDabhi/axeshopping/assets/101393352/55111082-04e6-4d29-94b1-ec31158f28cc" height="440">

## Features
- Home Page with ListView displaying shopping items represented by Card widgets.
- Second Screen for adding details of a new shopping item.
- Add Item Button to add new items and refresh the home screen.
- Support for removing items from the home screen using the Dismissible widget.
- Integration with Firebase Realtime Database for handling data operations in real-time.
- Use of Firebase Storage for storing item details and images.

## Installation
1. Clone this repository.
2. Navigate to the project directory.
3. Run `flutter pub get` to install dependencies.
4. Set up Firebase Realtime Database and Firebase Storage for your project.
5. Add your Firebase configuration details to the project.
6. Connect your device or start an emulator.
7. Run `flutter run` to launch the app on your device/emulator.

## Usage
- On the Home Page, users can view a list of shopping items represented by Card widgets.
- Tap on the Add Item Button to navigate to the second screen for adding details of a new shopping item.
- After adding an item, users will be redirected to the home screen, where they can view the updated list of items.
- Swipe left on an item to remove it using the Dismissible widget. This action will also delete the item from Firebase Realtime Database.
- All operations performed on items, including adding, showing, and deleting, are reflected in real-time to Firebase Realtime Database.

## Configuration
- Configure Firebase Realtime Database and Firebase Storage for your project.
- Add your Firebase configuration details to the project by following the instructions provided by Firebase.

## Credits
- This app utilizes the Flutter framework: [Flutter](https://flutter.dev/)
- Firebase Realtime Database and Firebase Storage: [Firebase](https://firebase.google.com/)
