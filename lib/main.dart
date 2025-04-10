import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import 'auth_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadApp.material(
      title: 'Flutter Demo',
      // theme: ,
      home: const AuthScreen(),
    );
  }
}
