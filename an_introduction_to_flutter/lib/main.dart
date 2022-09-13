import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  final bool _buttonWasTapped = false;
  final String _buttonTitle = 'Launch Ship'.toUpperCase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'images/skyView.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            width: MediaQuery.of(context).size.width,
            bottom: 0.0,
            child: Column(
              children: [
                AnimatedContainer(
                  alignment: _buttonWasTapped
                      ? Alignment.topCenter
                      : Alignment.bottomCenter,
                  height: MediaQuery.of(context).size.height * 1.2,
                  duration: const Duration(seconds: 3),
                  curve: Curves.easeInOut,
                  child: Image.asset(
                    'images/spaceShip.png',
                    height: 200.0,
                    width: 200.0,
                  ),
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      child: Image.asset(
                        'images/groundLayer.png',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _buttonWasTapped = !_buttonWasTapped;
                        });
                      },
                      child: const SizedBox(
                        height: 40.0,
                        width: 350.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 30, 40, 50),
                            borderRadius: BorderRadius.all(
                              Radius.circular(25.0),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'SpaceX Ship',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
