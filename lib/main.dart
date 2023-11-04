import 'package:flutter/material.dart';
import 'package:news/MyThemeData.dart';
import 'package:news/SearchProvider.dart';
import 'package:news/ui/home/HomeScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( ChangeNotifierProvider(
      create: (context) => SearchProvider(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News',
      onGenerateTitle:  (context) => 'News',
      routes: {
        HomeScreen.routeName : (_)=>HomeScreen()
      },
      initialRoute: HomeScreen.routeName,
      theme:MyThemeData.theme

    );
  }
}


