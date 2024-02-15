import 'package:flutter/material.dart';
import 'package:resumemaker/homePage.dart';
import 'package:resumemaker/previewPage.dart';
import 'package:resumemaker/view/main_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:const MainView(),
    );
  }
}