import 'package:awkward_silence_reborn/providers/prompts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Prompts(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: const Color(0xffa890fe),
          accentColor: const Color(0xffea8d8d),
          textTheme: const TextTheme(
              bodyMedium: TextStyle(color: Colors.white, fontSize: 50)),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
