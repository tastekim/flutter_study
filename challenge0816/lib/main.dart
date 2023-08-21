import 'dart:async';

import 'package:flutter/material.dart';

import 'widgets/time_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<int> options = [
    5,
    10,
    15,
    20,
    25,
    30,
    35,
    40,
    45,
    50,
    55,
  ];
  int _chooseItem = 0;
  bool _isPlay = false;
  bool _isRest = false;
  late Timer _timer;
  int _round = 0;

  int min = 5;
  int sec = 60;

  int restMin = 5;
  int restSec = 60;

  @override
  void initState() {
    super.initState();
  }

  void _onTick(Timer timer) {
    setState(() {
      sec = sec - 1;
      if (sec == 0 && min == 0) {
        _round += 1;
        _onRunTap();
        _onRest();
      }
      if (sec == 0) {
        sec = 60;
      }
      if (sec == 59) {
        _onMin();
      }
    });
  }

  void _onRestTick(Timer timer) {
    setState(() {
      restSec = restSec - 1;
      if (restSec == 0 && min == 0) {
        _timer.cancel();
        setState(() {
          _isRest = false;
        });
      }
      if (restSec == 0) {
        restSec = 60;
      }
      if (restSec == 59) {
        _onRestMin();
      }
    });
  }

  void _onMin() {
    setState(() {
      min = min - 1;
    });
  }

  void _onRestMin() {
    setState(() {
      restMin = restMin - 1;
    });
  }

  void _onRest() {
    _isRest = true;
    _timer = Timer.periodic(const Duration(seconds: 1), _onRestTick);
  }

  void _onRunTap() {
    _isPlay = !_isPlay;
    if (_isPlay) {
      _timer = Timer.periodic(const Duration(seconds: 1), _onTick);
    } else {
      _timer.cancel();
      sec = 60;
      min = options[_chooseItem];
      setState(() {});
    }
    setState(() {});
  }

  void _onTap(int index) {
    _chooseItem = index;
    min = options[index];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        backgroundColor: const Color(0xffe64d3d),
        body: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
              ),
              child: const Text(
                'POMOTIMER',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(
              height: 125,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TimeCard(
                  time: '$min',
                ),
                const Text(
                  ':',
                  style: TextStyle(
                    color: Color(0xfff0928a),
                    fontSize: 80,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TimeCard(
                  time: '${sec == 60 || sec == 0 ? "00" : sec}',
                ),
              ],
            ),
            const SizedBox(
              height: 45,
            ),
            SizedBox(
              height: 75,
              child: Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: options.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 10,
                        ),
                        height: 70,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            width: 3,
                            style: BorderStyle.solid,
                            color: Colors.white,
                          ),
                          color: index == _chooseItem
                              ? Colors.white
                              : const Color(0xffe64d3d),
                        ),
                        child: Text(
                          '${options[index]}',
                          style: TextStyle(
                            color: index == _chooseItem
                                ? const Color(0xffe64d3d)
                                : Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      onTap: () {
                        _onTap(index);
                      },
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 90,
            ),
            if (_isRest)
              Container(
                width: 100,
                height: 100,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xffbf3a2b),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(
                  '$restMin : ${restSec == 0 || restSec == 60 ? "00" : restSec}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            if (!_isRest)
              InkWell(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: const Color(0xffbf3a2b),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(
                    _isPlay ? Icons.pause : Icons.play_arrow,
                    size: 60,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  _onRunTap();
                },
              ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      '${_round.toString()}/4',
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                        color: Color(0xfff0928a),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'ROUND',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const Column(
                  children: [
                    Text(
                      '0/12',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                        color: Color(0xfff0928a),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'GOAL',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
