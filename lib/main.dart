import 'package:flutter/material.dart';
import 'package:my_test_flutter_ui_2/screens/chat_screen.dart';
import 'package:my_test_flutter_ui_2/screens/home_screen.dart';
import 'package:my_test_flutter_ui_2/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/config/gonfig_git_it.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class SaveName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(core.get<SharedPreferences>().getString('last result') ??
            "No Result"),
      ),
    );
  }
}
