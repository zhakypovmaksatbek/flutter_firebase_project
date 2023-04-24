import 'package:flutter/material.dart';
import 'package:flutter_firebase_project/feature/home/home_view.dart';
import 'package:flutter_firebase_project/product/constants/index.dart';
import 'package:flutter_firebase_project/product/initialize/app_builder.dart';
import 'package:flutter_firebase_project/product/initialize/app_theme.dart';
import 'package:flutter_firebase_project/product/initialize/application_start.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  await ApplicationStart.init();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => AppBuilder(child).build(),
      debugShowCheckedModeBanner: false,
      title: StringConstants.appName,
      home: const HomeView(),
      theme: AppTheme(context).theme,
    );
  }
}
