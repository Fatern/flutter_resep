// lib/main.dart

import 'package:flutter/material.dart';
//import 'package:flutter_resep/pages/detail_page.dart';
import 'package:flutter_resep/pages/home_page.dart';
import 'package:flutter_resep/pages/login_page.dart';
//import 'package:flutter_resep/pages/search_filter_page.dart';
import 'package:flutter_resep/pages/sign_up_page.dart';
import 'package:flutter_resep/services/local_storage_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorageService.init();
  final bool isLoggedIn = LocalStorageService.getLoggedInStatus();

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'REKAN Resep Masakan',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF0F2F5),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: isLoggedIn ? '/home' : '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignUpPage(),
        '/home': (context) => const HomePage(),
        //'/detail': (context) => const DetailPage(),
        //'/search': (context) => const SearchFilterPage(),
      },
    );
  }
}
