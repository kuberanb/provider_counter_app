import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/Views/counter_screen.dart';
import 'package:provider_example/provider/counter_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: ((context) => CounterProvider()),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CounterScreen(),
      ),
    );
  }
}
