// lib/features/library/presentation/screens/library_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Library')), body: Center(child: Text('Library', style: TextStyle(fontSize: 20.sp))));
  }
}
