// firebase_options.dart
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return const FirebaseOptions(
        apiKey: "AIzaSyDLGTqqZSOJKRzfydatYc0JWOySYYm90iU", // API Key for web
        appId: "1:694411349299:android:2f03587e2d03b06427c246", // Web appId
        messagingSenderId: "YOUR_WEB_MESSAGING_SENDER_ID", // Messaging sender id for web
        projectId: "pet-loginapp", // Project ID
        authDomain: "pet-loginapp.firebaseapp.com", // Auth domain (typically for web)
        databaseURL: "https://pet-loginapp.firebaseio.com", // Database URL (for web)
        storageBucket: "pet-loginapp.appspot.com", // Storage bucket
        measurementId: "YOUR_MEASUREMENT_ID", // Measurement ID for analytics (if available)
      );
    } else if (defaultTargetPlatform == TargetPlatform.android) {
      return const FirebaseOptions(
        apiKey: "AIzaSyDLGTqqZSOJKRzfydatYc0JWOySYYm90iU", // API Key for Android
        appId: "1:694411349299:android:2f03587e2d03b06427c246", // Android appId
        messagingSenderId: "694411349299", // Messaging sender ID for Android
        projectId: "pet-loginapp", // Project ID
        authDomain: "pet-loginapp.firebaseapp.com", // Auth domain for Android
        databaseURL: "https://pet-loginapp.firebaseio.com", // Database URL for Android
        storageBucket: "pet-loginapp.appspot.com", // Storage bucket for Android
      );
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return const FirebaseOptions(
        apiKey: "AIzaSyDLGTqqZSOJKRzfydatYc0JWOySYYm90iU", // API Key for iOS
        appId: "1:694411349299:android:2f03587e2d03b06427c246", // Use your iOS appId here
        messagingSenderId: "694411349299", // Messaging sender ID for iOS
        projectId: "pet-loginapp", // Project ID
        authDomain: "pet-loginapp.firebaseapp.com", // Auth domain for iOS
        databaseURL: "https://pet-loginapp.firebaseio.com", // Database URL for iOS
        storageBucket: "pet-loginapp.appspot.com", // Storage bucket for iOS
      );
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }
}
