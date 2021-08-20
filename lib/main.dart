// @dart=2.9

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'src/main_screen.dart';


export 'src/auth/stub.dart'
    if (dart.library.io) 'src/auth/android_auth_provider.dart'
    if (dart.library.html) 'src/auth/web_auth_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //await FirebaseApp.initialize();
  await Firebase.initializeApp();

  runApp(const MyApp());
}
