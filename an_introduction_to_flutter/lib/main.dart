import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

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
  bool _buttonWasTapped = false;
  String _buttonTitle = 'Launch Ship'.toUpperCase();
  final AudioPlayer _backgroundPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _backgroundPlayer.setVolume(0.5);
    playAudio(
      _backgroundPlayer,
      'spaceBackground.wav',
    );
  }

  void playAudio(AudioPlayer player, String sourcePath) async {
    await player.setSource(AssetSource('sound/$sourcePath'));
  }

  @override
  void dispose() {
    _backgroundPlayer.dispose();
    super.dispose();
  }

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
                  height: MediaQuery.of(context).size.height * 1.1,
                  duration: const Duration(seconds: 3),
                  curve: Curves.easeInOut,
                  onEnd: () {
                    setState(() {
                      _buttonTitle = _buttonWasTapped
                          ? 'Land Ship'.toUpperCase()
                          : 'Launch Ship'.toUpperCase();
                    });
                  },
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
                      child: SizedBox(
                        height: 50.0,
                        width: 300.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.blue.shade600,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(25.0),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              _buttonTitle,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          _buttonWasTapped = !_buttonWasTapped;
                        });
                      },
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
