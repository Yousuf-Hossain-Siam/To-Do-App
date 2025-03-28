import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Provider/todo_provider.dart';
import 'package:todo_app/home.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_)=>TodoProvider())
  ], child: const MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 46, 196, 206)),
      ),
      home: const HomePage(),
    );
  }
}

