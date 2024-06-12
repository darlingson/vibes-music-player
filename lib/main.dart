import 'package:flutter/material.dart';
import 'package:vibes_music_player/tabs/HomeScreen.dart';
import 'package:vibes_music_player/tabs/LibraryScreen.dart';
import 'package:vibes_music_player/tabs/SettingsScreen.dart';
import 'package:vibes_music_player/tabs/StatsScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vibes Music player',
      theme: ThemeData(
        primaryColor: const Color(0xFFffa07a),
        primaryColorDark: const Color(0xFFc77800),
        primaryColorLight: const Color(0xFFffc107),
        dialogBackgroundColor: const Color(0xFFf5f5f5),
        disabledColor: const Color(0xFFbababa),
        dividerColor: const Color(0xFFe0e0e0),
        focusColor: const Color(0xFFffd700),
        highlightColor: const Color(0xFFffd700),
        hintColor: const Color(0xFF909090),
        hoverColor: const Color(0xFFffe07d),
        indicatorColor: const Color(0xFFffa07a),
        scaffoldBackgroundColor: const Color(0xFFf5f5f5),
        secondaryHeaderColor: const Color(0xFFf7dc6f),
        shadowColor: const Color(0xFFc77800),
        splashColor: const Color(0xFFffd700),
        unselectedWidgetColor: const Color(0xFFbababa),
        fontFamily: 'OpenSans',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Vibes Music'),
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
  int _currentIndex = 0;
  final List<Widget> _tabs = [
    const HomeScreen(),
    const LibraryScreen(),
    const StatsScreen(),
    const SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Vibes Music'),
      ),
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music),
            label: 'Library',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics),
            label: 'Stats',
          ),
        ],
      ),
    );
  }
}
