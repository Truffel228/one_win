import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:one_win/data/bets_notifier.dart';
import 'package:one_win/on_boarding.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  final BetsNotifier betsNotifier = BetsNotifier(preferences)..init();
  runApp(MyApp(betsNotifier: betsNotifier));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.betsNotifier});
  final BetsNotifier betsNotifier;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: betsNotifier,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF1f283c),
            elevation: 0,
          ),
          scaffoldBackgroundColor: const Color(0xFF0a0f1d),
          primaryColor: const Color(0xFF3b8ed7),
        ),
        home: const IP(),
      ),
    );
  }
}

class IP extends StatefulWidget {
  const IP({super.key});

  @override
  State<IP> createState() => _IPState();
}

class _IPState extends State<IP> {
  var _ = true;
  @override
  Widget build(BuildContext context) {
    if (false) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return OnBoarding();
  }
}
