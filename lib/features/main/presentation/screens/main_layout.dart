import 'package:flutter/material.dart';
import 'package:lms/features/home/presentation/screens/home_screen.dart';

import '../widgets/bottom_glass_nav.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    _DummyScreen(title: 'Exercises'),
    _DummyScreen(title: 'News'),
    _DummyScreen(title: 'Library'),
    _DummyScreen(title: 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: _screens[_selectedIndex],
      extendBody: true,
      bottomNavigationBar: BottomGlassNav(
        currentIndex: _selectedIndex,
        onTap: (i) => setState(() => _selectedIndex = i),
      ),
    );
  }
}

class _DummyScreen extends StatelessWidget {
  final String title;
  const _DummyScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFCF8FF),
      alignment: Alignment.center,
      child: Text(title),
    );
  }
}
