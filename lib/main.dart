import 'package:flutter/material.dart';
import 'package:flutter_new_progress_tracker/main_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final name = prefs.getString('user_name');

  runApp(MainApp(
    hasName: name != null,
    name: name ?? 'Гость',
  ));
}
