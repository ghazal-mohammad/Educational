// lib/features/home/presentation/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/features/home/widgets/continue_learning.dart';
import 'package:lms/features/home/widgets/home_header.dart';
import 'package:lms/features/home/widgets/quick_action.dart';
import 'package:lms/features/home/widgets/search_section.dart';
import 'package:lms/features/home/widgets/top_courses.dart';
import 'package:lms/features/home/widgets/your_progress.dart';
import 'package:lms/global/design/common_sizes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

const Color _bg = Color(0xFFFCF8FF);

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: _bg,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0.w),
            child: Column(
              children: [
                const HomeHeader(),
                SearchSection(controller: _searchController),
                const CommonSizes(height: 18),
                const ContinueLearningSection(),
                const CommonSizes(
                  height: 22,
                ),
                const TopCoursesSection(),
                const CommonSizes(
                  height: 17,
                ),
                const QuickAction(),
                const CommonSizes(
                  height: 15,
                ),
                const YourProgress(),
              ],
            ),
          ),
        )));
  }
}
