import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyTestApp(),
    );
  }
}

enum LoadingState {
  loading,
  error,
  normal,
}

class MyTestApp extends StatefulWidget {
  const MyTestApp({super.key});

  @override
  State<MyTestApp> createState() => _MyTestAppState();
}

class _MyTestAppState extends State<MyTestApp> {
  LoadingState loadingState = LoadingState.normal;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timer.tick ~/ 10 == 0) {
        setState(() {
          loadingState = LoadingState.loading;
        });
      } else if (timer.tick == 10) {
        setState(() {
          loadingState = LoadingState.error;
        });
      } else {
        setState(() {
          loadingState = LoadingState.normal;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('data'),
      ),
      body: Center(
        child: switch (loadingState) {
          LoadingState.loading => const CircularProgressIndicator(),
          LoadingState.error => const Text('Error'),
          LoadingState.normal => const Text('Normal'),
        },
      ),
    );
  }
}
