import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_clone/navigation/naviga.dart';
import 'package:youtube_clone/provider/homeProvider.dart';
import 'package:youtube_clone/provider/navigaProvider.dart';
import 'package:youtube_clone/repository/homeRepository.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      //
      ChangeNotifierProvider<NavigaProvider>(create: (_) => NavigaProvider()),
      ChangeNotifierProvider<HomeProvider>(
          create: (_) => HomeProvider(homeRepository: HomeRepository()))
      //
    ],
    child: const MyApp(),
  ));
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
        debugShowCheckedModeBanner: false,
        home: const NavigaScreen());
  }
}
