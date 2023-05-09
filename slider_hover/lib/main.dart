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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<int> monthList = List.generate(12, (index) => index += 1);
  double month = 1;

  double getLeftAlignment() {
    return (monthList.first - (-1)) / (monthList.length - 1) * month + -13 / 11;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Align(
              alignment: Alignment(getLeftAlignment(), 0),
              child: SizedBox(
                height: 40,
                width: 120,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: CustomPaint(
                        painter: HoverPainter(),
                      ),
                    ),
                    Align(
                      alignment: const Alignment(0, -0.2),
                      child: Text(
                        '${month.toInt()} month${month.toInt() == 1 ? "" : "s"}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Slider.adaptive(
                value: month,
                min: monthList.first.toDouble(),
                max: monthList.last.toDouble(),
                onChanged: (value) => setState(() => month = value),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HoverPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();
    var paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    path.moveTo(0, 5);
    path.lineTo(0, size.height - 8 - 5);
    path.quadraticBezierTo(0, size.height - 8, 5, size.height - 8);
    path.lineTo(size.width / 2 - 5, size.height - 8);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width / 2 + 5, size.height - 8);
    path.lineTo(size.width - 5, size.height - 8);
    path.quadraticBezierTo(
      size.width,
      size.height - 8,
      size.width,
      size.height - 8 - 5,
    );
    path.lineTo(size.width, 5);
    path.quadraticBezierTo(size.width, 0, size.width - 5, 0);
    path.lineTo(5, 0);
    path.quadraticBezierTo(0, 0, 0, 5);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}