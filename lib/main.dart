import 'package:arsip/views/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'views/main/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  var isLogin = prefs.containsKey('jwt');
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flutter Demo',
    theme: ThemeData(
        primaryColor: Colors.amber[900]
    ),
    home: isLogin ? const HomePage() : const LoginPage(),
  ));
}