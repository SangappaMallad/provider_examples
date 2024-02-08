
import 'package:api_integration_demo/pages/home.dart';
import 'package:api_integration_demo/providers/user_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>  UserProviders()),
      ],
      child: const MaterialApp(
            home: Home()
      ),
    );
  }
}
