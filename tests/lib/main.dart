import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

class MyTestApp extends StatefulWidget {
  const MyTestApp({super.key});

  @override
  State<MyTestApp> createState() => _MyTestAppState();
}

class _MyTestAppState extends State<MyTestApp> {
  Widget text() => const Text('My name is Gabriel');

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      ensureScreenSize: true,
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('data'),
          ),
          body: Container(
            color: Colors.red,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'My name is Gabriel',
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
