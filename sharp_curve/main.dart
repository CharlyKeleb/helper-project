import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(392, 872),
      ensureScreenSize: true,
      builder: (context, _) {
        return MaterialApp(
          theme: ThemeData(
            colorSchemeSeed: Colors.blue,
            brightness: MediaQuery.of(context).platformBrightness,
            useMaterial3: true,
          ),
          home: const TestApp(),
        );
      },
    );
  }
}

class TestApp extends StatefulWidget {
  const TestApp({super.key});

  @override
  State<TestApp> createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            // color: Colors.red,
            height: MediaQuery.sizeOf(context).height,
          ),
          ClipPath(
            clipper: CurvedPath(),
            child: Container(
              color: const Color.fromARGB(255, 26, 51, 104),
              height: MediaQuery.sizeOf(context).height * 0.6,
            ),
          ),
        ],
      ),
    );
  }
}

class CurvedPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double offset = 60;
    path.moveTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.lineTo(0, size.height - (offset * 2));
    path.quadraticBezierTo(
        0, size.height - offset, offset, size.height - offset);
    path.lineTo(size.width - offset, size.height - offset);
    path.quadraticBezierTo(
      size.width,
      size.height - offset,
      size.width,
      size.height,
    );
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
