import "package:flutter/material.dart";
import "package:tallerflutter/pages/HomeScreen.dart";
import "package:tallerflutter/pages/LoginScreen.dart";
import "package:tallerflutter/pages/RegisterScreen.dart";
import "package:tallerflutter/pages/newpassworscreen.dart";
import "package:tallerflutter/pages/newcontrascreen.dart";
import "package:tallerflutter/pages/verificationscreen.dart";

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (_) => LoginScreen(),
        "/register": (_) => RegisterScreen(),
        "/new-password": (_) => NewPasswordScreen(),
        "/verification": (_) => VerificationScreen(),
        "/new-contra": (_) => NewContraScreen(),
        "/home": (_) => HomeScreen(),
      },
    );
  }
}
