import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const Counter());
}

class Counter extends StatelessWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  bool get isEmpty => count == 0;

  bool get isFull => count == 5;

  void increment() {
    setState(() {
      count++;
    });
  }

  void decrement() {
    setState(() {
      count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/image.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5,
              sigmaY: 5,
            ),
            child: Container(
              color: Colors.black.withOpacity(0),
            ),
          ),
          Text(
            isFull
                ? "Lotado"
                : isEmpty
                    ? "Vazio"
                    : "Aberto",
            style: TextStyle(
                fontSize: 60,
                color: isFull
                    ? Colors.red
                    : isEmpty
                        ? Colors.blue
                        : Colors.green,
                fontWeight: FontWeight.bold,
                shadows: const [Shadow(blurRadius: 20)]),
          ),
          Text(
            '$count',
            style: TextStyle(
              shadows: const [Shadow(blurRadius: 20)],
              fontSize: 100,
              color: isFull ? Colors.red : Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            TextButton(
              style: TextButton.styleFrom(
                  primary: Colors.black,
                  backgroundColor:
                      isFull ? Colors.white.withOpacity(0.3) : Colors.white,
                  padding: const EdgeInsets.all(24),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(16),
                  )),
              onPressed: isFull ? null : increment,
              child: const Text(
                "Entrou",
                style: TextStyle(
                  fontSize: 50,
                  shadows: [Shadow(blurRadius: 7)],
                  color: Colors.green,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                  primary: Colors.black,
                  backgroundColor:
                      isEmpty ? Colors.white.withOpacity(0.3) : Colors.white,
                  padding: const EdgeInsets.all(24),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(16),
                  )),
              onPressed: isEmpty ? null : decrement,
              child: const Text(
                "Saiu",
                style: TextStyle(
                  fontSize: 50,
                  shadows: [Shadow(blurRadius: 7)],
                  color: Colors.red,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ])
        ]),
      ),
    );
  }
}
