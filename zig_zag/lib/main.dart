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
      home: const ZigZag(),
    );
  }
}

class ZigZag extends StatefulWidget {
  const ZigZag({super.key});

  @override
  State<ZigZag> createState() => _ZigZagState();
}

class _ZigZagState extends State<ZigZag> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipPath(
        clipper: ZigzagClip(),
        child: Container(
          height: 400,
          width: 250,
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ZigzagClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    const double zigzagWidth = 20.0;
    const double zigzagHeight = 20.0;

    path.moveTo(0, zigzagHeight);
    path.lineTo(0, size.height);
    double x = 0.0;
    double y = size.height;

    bool isEven = true;
    while (x < size.width) {
      x += zigzagWidth;
      if (isEven) {
        y -= zigzagHeight;
        path.lineTo(x, y);
      } else {
        y += zigzagHeight;
        path.lineTo(x, y);
      }
      isEven = !isEven;
    }
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, zigzagHeight);
    path.quadraticBezierTo(size.width, 0, size.width - zigzagWidth, 0);
    path.lineTo(zigzagWidth, 0);
    path.quadraticBezierTo(0, 0, 0, zigzagHeight);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
