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

class Info {
  String first;
  String second;

  Info({
    required this.first,
    required this.second,
  });
}

class _TestAppState extends State<TestApp> {
  List<Info> data = [];
  TextEditingController first = TextEditingController();
  TextEditingController second = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          150.verticalSpace,
          for (int i = data.length; i >= 0; i--)
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: first,
                    readOnly: i < data.length,
                    decoration: InputDecoration(
                      hintText: i < data.length ? data[i].first : '',
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                20.horizontalSpace,
                Expanded(
                  child: TextField(
                    controller: second,
                    decoration: InputDecoration(
                      labelText: i < data.length ? data[i].second : '',
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          TextButton(
            onPressed: () {
              print(first.text);
              print(second.text);
              data.add(Info(first: first.text, second: second.text));

              first.clear();
              second.clear();
              setState(() {});
            },
            child: const Text('Fetch'),
          ),
          ...data
              .map((e) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(e.first),
                      Text(e.second),
                    ],
                  ))
              .toList()
        ],
      ),
    );
  }
}
