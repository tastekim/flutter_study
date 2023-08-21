import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
        iconTheme: const IconThemeData(
          weight: 100,
        ),
        scaffoldBackgroundColor: Colors.grey.shade900,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
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
  late DateTime lastDayOfMonth;

  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();
    lastDayOfMonth = DateTime(now.year, now.month + 1, 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    child: const CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://avatars.githubusercontent.com/u/112174727?v=4',
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add,
                      weight: 100,
                    ),
                    iconSize: 30,
                    color: Colors.white,
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: const Text(
                  'MONDAY 16',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              CardWidget(), // ListView.builder(itemBuilder: (context, index) {
              //   return Container();
              // }),
            ],
          ),
        ),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  const CardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(30),
      ),
      height: 200,
      width: 400,
      child: Padding(
        padding: EdgeInsets.all(
          14,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      '11',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text('30'),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      '12',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text('20'),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'DESIGN\nMEETING',
                      style: TextStyle(fontSize: 50),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'ALEX',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black54,
                  ),
                ),
                Text(
                  'ALEX',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black54,
                  ),
                ),
                Text(
                  'ALEX',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
