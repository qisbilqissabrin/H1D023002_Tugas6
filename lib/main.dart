import 'package:flutter/material.dart';
import 'package:h1d023002_tugas6/ui/form_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas 6 Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // Untuk membuat tampilan lebih modern
        appBarTheme: const AppBarTheme(
          elevation: 0,
        ),
      ),
      // Set halaman awal ke FormData
      home: const FormData(),
    );
  }
}