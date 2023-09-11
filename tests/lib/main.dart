import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tests/provider.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TestApp(),
    );
  }
}

class TestApp extends ConsumerStatefulWidget {
  const TestApp({super.key});

  @override
  ConsumerState<TestApp> createState() => _TestAppState();
}

class _TestAppState extends ConsumerState<TestApp> {
  var group = 'any';
  @override
  Widget build(BuildContext context) {
    var jokes = ref.watch(jokeProvider(group));

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RadioListTile(
            value: 'any',
            title: const Text('Female'),
            groupValue: group,
            onChanged: (val) {
              setState(() {
                group = val!;
              });
            },
          ),
          RadioListTile(
            value: 'christmas',
            title: const Text('Male'),
            groupValue: group,
            onChanged: (val) {
              setState(() {
                group = val!;
              });
            },
          ),
          RadioListTile(
            value: 'programming',
            title: const Text('Programming'),
            groupValue: group,
            onChanged: (val) {
              setState(() {
                group = val!;
              });
            },
          ),
          RadioListTile(
            value: 'spooky',
            title: const Text('Spooky'),
            groupValue: group,
            onChanged: (val) {
              setState(() {
                group = val!;
              });
            },
          ),
          RadioListTile(
            value: 'pun',
            title: const Text('Pun'),
            groupValue: group,
            onChanged: (val) {
              setState(() {
                group = val!;
              });
            },
          ),
          RadioListTile(
            value: 'dark',
            title: const Text('Dark'),
            groupValue: group,
            onChanged: (val) {
              setState(() {
                group = val!;
              });
            },
          ),
          const SizedBox(
            height: 80,
          ),
          jokes.when(
            skipLoadingOnRefresh: false,
            data: (value) {
              if (value.error == false) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (value.type == 'single')
                        Text(
                          value.joke!,
                          textAlign: TextAlign.center,
                        )
                      else ...[
                        Text(
                          value.setup!,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(value.delivery!),
                      ]
                    ],
                  ),
                );
              }
              return const Text('There is an error');
            },
            error: (error, trace) => const Text('There was an Error'),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          ElevatedButton(
            onPressed: () => ref.invalidate(jokeProvider),
            child: const Text("Reload"),
          )
        ],
      ),
    );
  }
}
