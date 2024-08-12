import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vazifa38/screens/biometrik_screen.dart';
import 'package:vazifa38/screens/pincode_screen.dart';
import 'package:vazifa38/screens/todo_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? storedPin = prefs.getString('userPin');
  bool isBiometricEnabled = prefs.getBool('isBiometricEnabled') ?? false;

  runApp(MyApp(storedPin: storedPin, isBiometricEnabled: isBiometricEnabled));
}

class MyApp extends StatelessWidget {
  final String? storedPin;
  final bool isBiometricEnabled;

  const MyApp({super.key, this.storedPin, required this.isBiometricEnabled});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Secure App',
      debugShowCheckedModeBanner: false,
      home: isBiometricEnabled
          ? BiometricCheckPage()
          : storedPin == null
              ? const TodoScreen()
              : PinEntryPage(storedPin: storedPin),
    );
  }
}