import 'package:flutter/material.dart';

import 'search_feature/search_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 185, 160, 228)),
        useMaterial3: true,
      ),
      home: SearchView(),
    );
  }
}

